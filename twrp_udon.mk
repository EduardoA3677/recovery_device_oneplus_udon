#
# Copyright (C) 2024 The Android Open Source Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit some common TWRP stuff.
$(call inherit-product, vendor/twrp/config/common.mk)

# Inherit from device.mk configuration
$(call inherit-product, device/oneplus/udon/device.mk)

PRODUCT_PLATFORM := taro

## Device identifier
PRODUCT_DEVICE := udon
PRODUCT_NAME := twrp_udon
PRODUCT_BRAND := OnePlus
PRODUCT_MODEL := CPH2487
PRODUCT_MANUFACTURER := OnePlus

PRODUCT_GMS_CLIENTID_BASE := android-oneplus


