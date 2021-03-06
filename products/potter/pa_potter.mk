# Copyright (C) 2016-2017 Paranoid Android
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

# Check for target product
ifeq (pa_potter,$(TARGET_PRODUCT))

# Inherit from those products. Most specific first.
$(call inherit-product, device/motorola/potter/core_32_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/aosp_base_telephony.mk)

TARGET_BOOT_ANIMATION_RES := 1080

include device/qcom/common/common.mk

# Inherit AOSP device configuration
$(call inherit-product, device/motorola/potter/device.mk)

# Override AOSP build properties
PRODUCT_NAME := pa_potter
PRODUCT_DEVICE := potter
PRODUCT_BRAND := Motorola
PRODUCT_MANUFACTURER := Motorola

PRODUCT_GMS_CLIENTID_BASE := android-motorola

PRODUCT_PROPERTY_OVERRIDES += \
    sys.usb.config=mtp,adb \
    persist.sys.usb.config=mtp,adb \
    ro.adb.secure=0 \
    ro.secure=0 \
    ro.debuggable=1

PRODUCT_BUILD_PROP_OVERRIDES += \
    BUILD_FINGERPRINT=motorola/potter/potter:7.0/NPNS25.137-33-11/11:user/release-keys \
    PRIVATE_BUILD_DESC="potter-7.0/NPNS25.137-33-11/11:user/release-keys"
    
# Paranoid Android platform
include vendor/pa/main.mk

endif
