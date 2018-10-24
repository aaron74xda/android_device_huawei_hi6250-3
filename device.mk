#
# Copyright 2018 The Android Open Source Project
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

# This contains the module build definitions for the hardware-specific
# components for this device.
#
# As much as possible, those components should be built unconditionally,
# with device-specific names to avoid collisions, to avoid device-specific
# bitrot and build breakages. Building a component unconditionally does
# *not* include it on all devices, so it is safe even with hardware-specific
# components.

# AAPT
PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := xxhdpi
PRODUCT_AAPT_PREBUILT_DPI := xxhdpi xhdpi hdpi

# APN
PRODUCT_COPY_FILES += \
        device/sample/etc/apns-full-conf.xml:system/etc/apns-conf.xml

# Audio
PRODUCT_COPY_FILES += \
    frameworks/av/services/audiopolicy/config/usb_audio_policy_configuration.xml:system/etc/usb_audio_policy_configuration.xml

# Blobs
$(call inherit-product-if-exists, vendor/huawei/kirin970-common/kirin970-common-vendor.mk)

# Blobs
$(call inherit-product-if-exists, vendor/huawei/hi6250/hi6250-vendor.mk)

# Camera
PRODUCT_PACKAGES += \
    Snap

# Display
TARGET_SCREEN_HEIGHT := 1920
TARGET_SCREEN_WIDTH := 1080

# Graphics
PRODUCT_PACKAGES += \
    libion

# HIDL
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/compatibility_matrix.xml:system/compatibility_matrix.xml

PRODUCT_PACKAGES += \
    android.hidl.base@1.0 \
    android.hidl.manager@1.0

# Input
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/keylayout/fingerprint.kl:system/usr/keylayout/fingerprint.kl

# NFC
PRODUCT_PACKAGES += \
    NfcNci \
    Tag \
    com.android.nfc_extras \
    nfc_nci.pn54x.default

PRODUCT_COPY_FILES += \
    device/huawei/hi6250/rootdir/system/etc/libnfc_brcm_pra_L31.conf:system/etc/libnfc-brcm.conf \
    device/huawei/hi6250/rootdir/system/etc/libnfc_nxp_pra_L31.conf:system/etc/libnfc-nxp.conf \
    device/huawei/hi6250/rootdir/system/etc/nfcscc_access.xml:system/etc/nfcscc_access.xml \
    device/huawei/hi6250/rootdir/system/etc/nfcse_access.xml:system/etc/nfcse_access.xml \

# Overlays
DEVICE_PACKAGE_OVERLAYS += \
    $(LOCAL_PATH)/overlay

DEVICE_PACKAGE_OVERLAYS += \
    $(LOCAL_PATH)/overlay-lineage

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.fingerprint.xml:system/etc/permissions/android.hardware.fingerprint.xml \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml

# Properties
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.build.version.all_codenames=$(PLATFORM_VERSION_ALL_CODENAMES) \
    ro.build.version.codename=$(PLATFORM_VERSION_CODENAME) \
    ro.build.version.huawei=8.0.0 \
    ro.build.version.huawei1=8.1.0 \
    ro.build.version.release=$(PLATFORM_VERSION) \
    ro.build.version.sdk=$(PLATFORM_SDK_VERSION) \
    ro.cust.cdrom=/dev/null

# Radio
PRODUCT_PACKAGES += \
    qti-telephony-common

PRODUCT_BOOT_JARS += \
    telephony-ext

# Ramdisk
PRODUCT_PACKAGES += \
    init.bcm43xx.rc \
    init.hisi.rc \
    init.kirin970.rc \
    init.kirin970.ab.rc \
    init.kirin970.environ.rc

# Recovery
PRODUCT_PACKAGES += \
    resize2fs_static

# Release Tools
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/releasetools/releasetools.kirin970.sh:$(TARGET_COPY_OUT_SYSTEM)/bin/releasetools.kirin970.sh

# Remove unwanted packages
PRODUCT_PACKAGES += \
    RemovePackages

# Selinux
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/sepolicy/27.0.cil:$(TARGET_COPY_OUT_SYSTEM)/etc/selinux/mapping/27.0.cil

# Shims
PRODUCT_PACKAGES += \
    libshims_hisupl \
    libshims_hwsmartdisplay_jni

# USB
PRODUCT_PACKAGES += \
    android.hardware.usb@1.0-service.kirin970

# VNDK
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/vndk-compat/ld.config.26.txt:system/etc/ld.config.26.txt \
    $(LOCAL_PATH)/vndk-compat/llndk.libraries.26.txt:system/etc/llndk.libraries.26.txt \
    $(LOCAL_PATH)/vndk-compat/vndksp.libraries.26.txt:system/etc/vndksp.libraries.26.txt \
    $(LOCAL_PATH)/vndk-compat/ld.config.27.txt:system/etc/ld.config.27.txt

# Wi-Fi
PRODUCT_PACKAGES += \
    android.hardware.wifi.hostapd@1.0 \
    android.hardware.wifi@1.2
