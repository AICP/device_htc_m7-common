package com.cyanogenmod.settings.device;

import android.content.Context;
import android.content.SharedPreferences;
import android.preference.Preference;
import android.preference.Preference.OnPreferenceChangeListener;
import android.preference.PreferenceManager;

public class F2WSensitivityMethod implements OnPreferenceChangeListener {

    private static final String FILE = "/sys/devices/virtual/htc_g_sensor/g_sensor/f2w_sensitivity";

    private static final String METHOD_LESS = "0";
    private static final String METHOD_MORE = "1";

    public static boolean isSupported() {
        return Utils.fileExists(FILE);
    }

    private static void setSysFsForMethod(String method)
    {
        if (method.equals(METHOD_LESS))
        {
             Utils.writeValue(FILE, "0\n");
        } else
        if (method.equals(METHOD_MORE))
        {
             Utils.writeValue(FILE, "1\n");
        }
    }

    /**
     * Restore F2WSensitivity setting from SharedPreferences. (Write to kernel.)
     * @param context       The context to read the SharedPreferences from
     */
    public static void restore(Context context) {
        if (!isSupported()) {
            return;
        }

        SharedPreferences sharedPrefs = PreferenceManager.getDefaultSharedPreferences(context);
        String method = sharedPrefs.getString(SensorsFragmentActivity.KEY_F2WSENSITIVITY_METHOD, "0");
        setSysFsForMethod(method);
    }

    @Override
    public boolean onPreferenceChange(Preference preference, Object newValue) {
        setSysFsForMethod((String)newValue);
        return true;
    }

}
