/*
* Copyright (C) 2013 The OmniROM Project
*
* This program is free software: you can redistribute it and/or modify
* it under the terms of the GNU General Public License as published by
* the Free Software Foundation, either version 2 of the License, or
* (at your option) any later version.
*
* This program is distributed in the hope that it will be useful,
* but WITHOUT ANY WARRANTY; without even the implied warranty of
* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
* GNU General Public License for more details.
*
* You should have received a copy of the GNU General Public License
* along with this program. If not, see <http://www.gnu.org/licenses/>.
*
*/
package com.aicp.device

import android.util.Log
import java.io.*

object Utils {
    private const val DEBUG = false
    private const val TAG = "Utils"

    /**
     * Write a string value to the specified file.
     * @param filename      The filename
     * @param value         The value
     */
    @JvmStatic
    fun writeValue(filename: String?, value: String) {
        if (filename == null) {
            return
        }
        if (DEBUG) Log.d(TAG, "writeValue filename / value:$filename / $value")
        try {
            val fos = FileOutputStream(File(filename))
            fos.write(value.toByteArray())
            fos.flush()
            fos.close()
        } catch (e: FileNotFoundException) {
            e.printStackTrace()
        } catch (e: IOException) {
            e.printStackTrace()
        }
    }

    /**
     * Write a string value to the specified sysfs file.
     * @param filename      The filename
     * @param value         The value
     */
    fun writeValueSimple(filename: String?, value: String) {
        if (filename == null) {
            return
        }
        if (DEBUG) Log.d(TAG, "writeValueSimple filename / value:$filename / $value")
        try {
            val fos = FileOutputStream(File(filename))
            val valueSimple = """
                $value
                
                """.trimIndent()
            fos.write(valueSimple.toByteArray())
            fos.close()
        } catch (e: FileNotFoundException) {
            e.printStackTrace()
        } catch (e: IOException) {
            e.printStackTrace()
        }
    }

    /**
     * Check if the specified file exists.
     * @param filename      The filename
     * @return              Whether the file exists or not
     */
    fun fileExists(filename: String?): Boolean {
        return if (filename == null) {
            false
        } else File(filename).exists()
    }

    @JvmStatic
    fun fileWritable(filename: String?): Boolean {
        return fileExists(filename) && File(filename).canWrite()
    }

    fun readLine(filename: String?): String? {
        if (filename == null) {
            return null
        }
        var br: BufferedReader? = null
        var line: String? = null
        try {
            br = BufferedReader(FileReader(filename), 1024)
            line = br.readLine()
        } catch (e: IOException) {
            return null
        } finally {
            if (br != null) {
                try {
                    br.close()
                } catch (e: IOException) {
                    // ignore
                }
            }
        }
        return line
    }

    fun getFileValueAsBoolean(filename: String?, defValue: Boolean): Boolean {
        val fileValue = readLine(filename)
        return if (fileValue != null) {
            if (fileValue == "0") false else true
        } else defValue
    }

    fun getFileValue(filename: String, defValue: String): String {
        val fileValue = readLine(filename)
        if (DEBUG) Log.d(TAG, "getFileValue file / value:$filename / $fileValue")
        if (fileValue != null) {
            return fileValue
        }
        if (DEBUG) Log.e(TAG, "getFileValue file / value:$filename / $defValue")
        return defValue
    }

    @JvmStatic
    fun getFileValueVibrator(filename: String, defValue: String): String {
        val fileValue = readLine(filename)
        if (fileValue != null) {
            return fileValue
        }
        if (DEBUG) Log.d(TAG, "getFileValue file / value:$filename / $defValue")
        return defValue
    }
}