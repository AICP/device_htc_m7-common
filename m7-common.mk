# Copyright (C) 2016 The CyanogenMod Project
# Copyright (C) 2018 The LineageOS Project
# Copyright (C) 2020 Android Ice Cold Project
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

# common msm8960 configs
$(call inherit-product, device/htc/msm8960-common/msm8960-common.mk)

$(call inherit-product, $(SRC_TARGET_DIR)/product/product_launched_with_k.mk)

# Overlay
DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay

# APEX
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/ld.config.txt:$(TARGET_COPY_OUT_SYSTEM)/etc/swcodec/ld.config.txt

# Screen density
PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := xxhdpi

# Bionic Shim
PRODUCT_PACKAGES += \
    libshims_bionic

# Bluetooth HAL
PRODUCT_PACKAGES += \
    android.hardware.bluetooth@1.0-impl \
    libbt-vendor

# Boot animation
TARGET_SCREEN_HEIGHT := 1920
TARGET_SCREEN_WIDTH := 1080

# Audio
PRODUCT_PACKAGES += \
    audio_amplifier.msm8960

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/audio/audio_effects.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_effects.xml \
    $(LOCAL_PATH)/configs/audio/audio_platform_info.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_platform_info.xml \
    $(LOCAL_PATH)/configs/audio/audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_configuration.xml \
    $(LOCAL_PATH)/configs/audio/mixer_paths.xml:$(TARGET_COPY_OUT_VENDOR)/etc/mixer_paths.xml \
    frameworks/av/services/audiopolicy/config/a2dp_audio_policy_configuration.xml:system/vendor/etc/a2dp_audio_policy_configuration.xml \
    frameworks/av/services/audiopolicy/config/audio_policy_volumes.xml:system/vendor/etc/audio_policy_volumes.xml \
    frameworks/av/services/audiopolicy/config/default_volume_tables.xml:system/vendor/etc/default_volume_tables.xml \
    frameworks/av/services/audiopolicy/config/r_submix_audio_policy_configuration.xml:system/vendor/etc/r_submix_audio_policy_configuration.xml \
    frameworks/av/services/audiopolicy/config/usb_audio_policy_configuration.xml:system/vendor/etc/usb_audio_policy_configuration.xml

# Bluetooth
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/bluetooth/bcm4335_prepatch.hcd:$(TARGET_COPY_OUT_VENDOR)/firmware/bcm4335_prepatch.hcd

# Camera HIDL interfaces
PRODUCT_PACKAGES += \
    android.hardware.camera.provider@2.4-impl-htc_msm8960 \
    camera.device@1.0-impl-htc_msm8960

# Camera
PRODUCT_PACKAGES += \
    camera.msm8960 \
    libcamera_shim \
    Snap \
    libstdc++.vendor

# Camera External Config
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/camera/external_camera_config.xml:$(TARGET_COPY_OUT_VENDOR)/etc/external_camera_config.xml

# Charger
WITH_CM_CHARGER := false

# GUI Shims
PRODUCT_PACKAGES += \
    libui_shim

# GPS
PRODUCT_PACKAGES += \
    gps.msm8960

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/gps/gps.conf:$(TARGET_COPY_OUT_SYSTEM)/etc/gps.conf

# IDC
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/idc/projector_input.idc:$(TARGET_COPY_OUT_SYSTEM)/usr/idc/projector_input.idc \
    $(LOCAL_PATH)/idc/synaptics-rmi-touchscreen.idc:$(TARGET_COPY_OUT_SYSTEM)/usr/idc/synaptics-rmi-touchscreen.idc

# Consumerir HIDL interfaces
PRODUCT_PACKAGES += \
    android.hardware.ir@1.0-impl

# Keylayouts
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/keylayout/h2w_headset.kl:$(TARGET_COPY_OUT_SYSTEM)/usr/keylayout/h2w_headset.kl \
    $(LOCAL_PATH)/keylayout/keypad_8960.kl:$(TARGET_COPY_OUT_SYSTEM)/usr/keylayout/keypad_8960.kl \
    $(LOCAL_PATH)/keylayout/projector-Keypad.kl:$(TARGET_COPY_OUT_SYSTEM)/usr/keylayout/projector-Keypad.kl \
    $(LOCAL_PATH)/keylayout/synaptics-rmi-touchscreen.kl:$(TARGET_COPY_OUT_SYSTEM)/usr/keylayout/synaptics-rmi-touchscreen.kl \

# Keystore
PRODUCT_PACKAGES += \
    keystore.msm8960 \
    android.hardware.keymaster@3.0-impl

# Log
PRODUCT_PACKAGES += \
    liblog_shim

# Media
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/media/media_profiles_V1_0.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_profiles_V1_0.xml

# NFC
PRODUCT_PACKAGES += \
    com.android.nfc_extras \
    libnfc \
    libnfc_jni \
    libnfc_ndef \
    libpn544_fw \
    Nfc \
    nfc.msm8960 \
    Tag

ifeq ($(TARGET_BUILD_VARIANT),user)
    NFCEE_ACCESS_PATH := $(LOCAL_PATH)/configs/nfc/nfcee_access.xml
else
    NFCEE_ACCESS_PATH := $(LOCAL_PATH)/configs/nfc/nfcee_access_debug.xml
endif
PRODUCT_COPY_FILES += \
    $(NFCEE_ACCESS_PATH):$(TARGET_COPY_OUT_SYSTEM)/etc/nfc/nfcee_access.xml

# Perf
PRODUCT_PACKAGES += \
    libshims_atomic

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.audio.low_latency.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/android.hardware.audio.low_latency.xml \
    frameworks/native/data/etc/android.hardware.bluetooth_le.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/android.hardware.bluetooth_le.xml \
    frameworks/native/data/etc/android.hardware.consumerir.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/android.hardware.consumerir.xml \
    frameworks/native/data/etc/android.hardware.nfc.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/android.hardware.nfc.xml \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/android.hardware.wifi.direct.xml

# Ramdisk
PRODUCT_PACKAGES += \
    fstab.qcom \
    init.qcom.power.rc \
    init.recovery.qcom.rc \
    init.qcom.rc \
    init.qcom.usb.rc \
    init.target.rc \
    ueventd.qcom.rc

# RIL
PRODUCT_PACKAGES += \
    libshims_ril

# Seccomp policy
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/seccomp/mediacodec.policy:$(TARGET_COPY_OUT_VENDOR)/etc/seccomp_policy/mediacodec.policy

# System properties
-include $(LOCAL_PATH)/system_prop.mk

# Recovery
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/etc/fstab.qcom:$(TARGET_COPY_OUT_RAMDISK)/fstab.qcom

# Thermal
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/thermal/thermald.conf:$(TARGET_COPY_OUT_SYSTEM)/etc/thermald.conf

# Vibrator
PRODUCT_PACKAGES += \
    android.hardware.vibrator@1.0-impl \
    android.hardware.vibrator@1.0-service

# Voice processing
PRODUCT_PACKAGES += \
    libqcomvoiceprocessing

# USB
PRODUCT_PACKAGES += \
    android.hardware.usb@1.0-service.basic

# Widevine
PRODUCT_PACKAGES += \
    libshim_wvm

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/wifi/calibration:$(TARGET_COPY_OUT_SYSTEM)/etc/calibration \
    $(LOCAL_PATH)/configs/wifi/calibration_EMEA:$(TARGET_COPY_OUT_SYSTEM)/etc/calibration_EMEA \
    $(LOCAL_PATH)/configs/wifi/p2p_supplicant_overlay.conf:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/p2p_supplicant_overlay.conf \
    $(LOCAL_PATH)/configs/wifi/wpa_supplicant_overlay.conf:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/wpa_supplicant_overlay.conf

# Include non-opensource parts
$(call inherit-product-if-exists, vendor/htc/m7-common/m7-common-vendor.mk)
