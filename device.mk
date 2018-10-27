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

# Blobs
$(call inherit-product-if-exists, vendor/huawei/kirin970-common/kirin970-common-vendor.mk)

# Camera
PRODUCT_PACKAGES += \
    Snap \

# Device
$(call inherit-product, device/huawei/kirin970-common/kirin970.mk)

# Display
TARGET_SCREEN_HEIGHT := 1920
TARGET_SCREEN_WIDTH := 1080

# NFC
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/system/etc/libnfc_brcm_pra_L31.conf:system/etc/libnfc-brcm.conf \
    $(LOCAL_PATH)/rootdir/system/etc/libnfc_nxp_pra_L31.conf:system/etc/libnfc-nxp.conf \
    $(LOCAL_PATH)/rootdir/system/etc/nfcscc_access.xml:system/etc/nfcscc_access.xml \
    $(LOCAL_PATH)/rootdir/system/etc/nfcse_access.xml:system/etc/nfcse_access.xml \

# Overlays
DEVICE_PACKAGE_OVERLAYS += \
    $(LOCAL_PATH)/overlay \
    $(LOCAL_PATH)/overlay-lineage
