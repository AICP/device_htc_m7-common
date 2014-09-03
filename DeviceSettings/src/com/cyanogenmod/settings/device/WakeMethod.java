package com.cyanogenmod.settings.device;

import android.content.Context;
import android.content.SharedPreferences;
import android.preference.Preference;
import android.preference.Preference.OnPreferenceChangeListener;
import android.preference.PreferenceManager;

public class WakeMethod implements OnPreferenceChangeListener {

    private static final String FILE_T2W = "/sys/android_touch/tap_to_wake";

    private static final String METHOD_NONE = "0";
    private static final String METHOD_TAP = "1";

    public static boolean isSupported() {
        return Utils.fileExists(FILE_T2W);
    }

    private static void setSysFsForMethod(String method)
    {
        if (method.equals(METHOD_NONE))
        {
             Utils.writeValue(FILE_T2W, "0\n");
        } else
        if (method.equals(METHOD_TAP))
        {
             Utils.writeValue(FILE_T2W, "1\n");
        }
    }

    /**
     * Restore WakeMethod setting from SharedPreferences. (Write to kernel.)
     * @param context       The context to read the SharedPreferences from
     */
    public static void restore(Context context) {
        if (!isSupported()) {
            return;
        }

        SharedPreferences sharedPrefs = PreferenceManager.getDefaultSharedPreferences(context);
        String method = sharedPrefs.getString(TouchscreenFragmentActivity.KEY_WAKE_METHOD, "0");
        setSysFsForMethod(method);
    }

    @Override
    public boolean onPreferenceChange(Preference preference, Object newValue) {
        setSysFsForMethod((String)newValue);
        return true;
    }

}
