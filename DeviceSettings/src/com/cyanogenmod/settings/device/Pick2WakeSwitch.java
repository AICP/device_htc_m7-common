package com.cyanogenmod.settings.device;

import android.content.Context;
import android.content.SharedPreferences;
import android.preference.Preference;
import android.preference.Preference.OnPreferenceChangeListener;
import android.preference.PreferenceManager;
import java.io.File;

public class Pick2WakeSwitch implements OnPreferenceChangeListener {

    private static final String FILE = "/sys/devices/virtual/htc_g_sensor/g_sensor/pick2wake";

    public static boolean isSupported() {
        return Utils.fileExists(FILE);
    }

    /**
     * Restore Pick2Wake setting from SharedPreferences. (Write to kernel.)
     * @param context       The context to read the SharedPreferences from
     */
    public static void restore(Context context) {
        if (!isSupported()) {
            return;
        }

        SharedPreferences sharedPrefs = PreferenceManager.getDefaultSharedPreferences(context);
        boolean enabled = sharedPrefs.getBoolean(SensorsFragmentActivity.KEY_PICK2WAKE_SWITCH, false);

        File blFile = new File(FILE);
        if(enabled) {
            Utils.writeValue(FILE, "1\n");
            blFile.setWritable(false);
        }
        else {
            blFile.setWritable(true);
            Utils.writeValue(FILE, "0\n");
        }
    }

    @Override
    public boolean onPreferenceChange(Preference preference, Object newValue) {
        Boolean enabled = (Boolean) newValue;
        File blFile = new File(FILE);
        if(enabled) {
            Utils.writeValue(FILE, "1\n");
            blFile.setWritable(false);
        }
        else {
            blFile.setWritable(true);
            Utils.writeValue(FILE, "0\n");
        }
        return true;
    }
}
