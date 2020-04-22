# Copyright (C) 2016 The CyanogenMod Project
# Copyright (C) 2013 The Android Open Source Project
# Copyright (C) 2018 The LineageOS Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

#
# This file sets variables that control the way modules are built
# thorughout the system. It should not be used to conditionally
# disable makefiles (the proper mechanism to control what gets
# included in a build is to use PRODUCT_PACKAGES in a product
# definition file).
#

# WARNING: This line must come *before* including the proprietary
# variant, so that it gets overwritten by the parent (which goes
# against the traditional rules of inheritance).

# inherit from common msm8960
-include device/htc/msm8960-common/BoardConfigCommon.mk

LOCAL_PATH := device/htc/m7-common

# Audio
BOARD_HAVE_HTC_CSDCLIENT := true
USE_CUSTOM_AUDIO_POLICY := 1
USE_XML_AUDIO_POLICY_CONF := 1

# Bluetooth
BOARD_CUSTOM_BT_CONFIG := $(LOCAL_PATH)/bluetooth/libbt_vndcfg.txt
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := $(LOCAL_PATH)/bluetooth
BOARD_BLUETOOTH_USES_HCIATTACH_PROPERTY := false
BOARD_HAVE_BLUETOOTH_BCM := true

# Boot animation
TARGET_BOOTANIMATION_HALF_RES := true

# Camera
TARGET_DISPLAY_INSECURE_MM_HEAP := true
TARGET_PROCESS_SDK_VERSION_OVERRIDE += \
    /system/bin/mediaserver=21 \
    /system/bin/mm-qcamera-daemon=21 \
    /system/bin/qseecomd=21 \
    /system/bin/audioserver=21 \
    /system/vendor/bin/hw/android.hardware.media.omx@1.0-service=21
USE_DEVICE_SPECIFIC_CAMERA := true
TARGET_SPECIFIC_CAMERA_PARAMETER_LIBRARY := camera_parameters_htc_msm8960

# Charger
BOARD_CHARGING_MODE_BOOTING_LPM := /sys/htc_lpm/lpm_mode

# Filesystem
BOARD_BOOTIMAGE_PARTITION_SIZE := 16777216
BOARD_FLASH_BLOCK_SIZE := 131072
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 16776704

# General compilation flags
TARGET_SPECIFIC_HEADER_PATH += device/htc/m7-common/include

# Graphics
HAVE_ADRENO_SOURCE := false
OVERRIDE_RS_DRIVER := libRSDriver_adreno.so

# Kernel
BOARD_KERNEL_BASE := 0x80600000
BOARD_KERNEL_CMDLINE := console=none androidboot.hardware=qcom user_debug=31
BOARD_KERNEL_CMDLINE += androidboot.selinux=permissive
BOARD_KERNEL_PAGESIZE := 2048
BOARD_KERNEL_IMAGE_NAME := zImage
BOARD_MKBOOTIMG_ARGS := --ramdisk_offset 0x01800000
TARGET_KERNEL_CONFIG := m7_defconfig
TARGET_KERNEL_SOURCE := kernel/htc/msm8960

BOARD_ROOT_EXTRA_FOLDERS := \
    firmware/q6 \
    firmware/mdm

BOARD_ROOT_EXTRA_SYMLINKS += \
    /data/tombstones:/tombstones \
    /data/persist:/persist \
    /data/ramdump:/ramdump \
    /data/devlog:/devlog

# Recovery
BOARD_GLOBAL_CFLAGS := -DBOARD_RECOVERY_BLDRMSG_OFFSET=2048
BOARD_NO_SECURE_DISCARD := true
TARGET_RECOVERY_DEVICE_DIRS += device/htc/m7-common
TARGET_RECOVERY_FSTAB := $(LOCAL_PATH)/rootdir/etc/fstab.qcom
TARGET_RECOVERY_PIXEL_FORMAT := RGBX_8888
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true

# RIL
BOARD_PROVIDES_LIBRIL := true
BOARD_RIL_CLASS := ../../../$(LOCAL_PATH)/ril

# SELinux
-include device/qcom/sepolicy-legacy/sepolicy.mk

BOARD_SEPOLICY_DIRS += device/htc/m7-common/sepolicy

# We modify several neverallows, so let the build proceed
ifneq ($(TARGET_BUILD_VARIANT),user)
SELINUX_IGNORE_NEVERALLOWS := true
endif

# Shims
TARGET_LD_SHIM_LIBS := \
    /system/bin/mpdecision|libshims_atomic.so \
    /system/lib/hw/camera.vendor.msm8960.so|libcamera_shim.so \
    /system/vendor/lib/libqc-opt.so|libqc-opt_shim.so \
    /system/lib/liblog.so|liblog_shim.so \
    /system/vendor/lib/libwvm.so|libshim_wvm.so \
    /system/lib/libril.so|libshim_ril.so \
    /system/vendor/lib/libril-qc-qmi-1.so|libshim_ril.so

# Wifi
BOARD_HOSTAPD_DRIVER             := NL80211
BOARD_HOSTAPD_PRIVATE_LIB        := lib_driver_cmd_bcmdhd
BOARD_WLAN_DEVICE                := bcmdhd
BOARD_WPA_SUPPLICANT_DRIVER      := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_bcmdhd
WIFI_DRIVER_FW_PATH_AP           := "/system/etc/firmware/fw_bcm4335_apsta_b0.bin"
WIFI_DRIVER_FW_PATH_P2P          := "/system/etc/firmware/fw_bcm4335_p2p_b0.bin"
WIFI_DRIVER_FW_PATH_PARAM        := "/sys/module/bcmdhd/parameters/firmware_path"
WIFI_DRIVER_FW_PATH_STA          := "/system/etc/firmware/fw_bcm4335_b0.bin"
WPA_SUPPLICANT_VERSION           := VER_0_8_X
WIFI_HIDL_FEATURE_DISABLE_AP_MAC_RANDOMIZATION := true

# inherit from the proprietary version
-include vendor/htc/m7-common/BoardConfigVendor.mk

