package com.cyanogenmod.settings.device;

import android.content.Context;
import android.content.SharedPreferences;
import android.preference.Preference;
import android.preference.Preference.OnPreferenceChangeListener;
import android.preference.PreferenceManager;

public class F2STimeOutMethod implements OnPreferenceChangeListener {

    private static final String FILE = "/sys/devices/virtual/htc_g_sensor/g_sensor/f2w_min_sleep_time";

    private static final String METHOD_DEFAULT = "0";
    private static final String METHOD_1_SEC = "1";
    private static final String METHOD_2_SEC = "2";
    private static final String METHOD_3_SEC = "3";
    private static final String METHOD_4_SEC = "4";
    private static final String METHOD_5_SEC = "5";

    public static boolean isSupported() {
        return Utils.fileExists(FILE);
    }

    private static void setSysFsForMethod(String method)
    {
        if (method.equals(METHOD_DEFAULT))
        {
             Utils.writeValue(FILE, "0\n");
        } else
        if (method.equals(METHOD_1_SEC))
        {
             Utils.writeValue(FILE, "1\n");
        }
        if (method.equals(METHOD_2_SEC))
        {
             Utils.writeValue(FILE, "2\n");
        }
        if (method.equals(METHOD_3_SEC))
        {
             Utils.writeValue(FILE, "3\n");
        }
        if (method.equals(METHOD_4_SEC))
        {
             Utils.writeValue(FILE, "4\n");
        }
        if (method.equals(METHOD_5_SEC))
        {
             Utils.writeValue(FILE, "5\n");
        }
    }

    /**
     * Restore F2STimeOut setting from SharedPreferences. (Write to kernel.)
     * @param context       The context to read the SharedPreferences from
     */
    public static void restore(Context context) {
        if (!isSupported()) {
            return;
        }

        SharedPreferences sharedPrefs = PreferenceManager.getDefaultSharedPreferences(context);
        String method = sharedPrefs.getString(SensorsFragmentActivity.KEY_F2STIMEOUT_METHOD, "0");
        setSysFsForMethod(method);
    }

    @Override
    public boolean onPreferenceChange(Preference preference, Object newValue) {
        setSysFsForMethod((String)newValue);
        return true;
    }

}
