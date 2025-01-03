#
# Copyright (C) 2024 The Android Open Source Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from device.mk configuration
$(call inherit-product, device/oneplus/udon/device.mk)


PRODUCT_PLATFORM := taro

# Release name
PRODUCT_RELEASE_NAME := udon

## Device identifier
PRODUCT_DEVICE := udon
PRODUCT_NAME := twrp_udon
PRODUCT_BRAND := OnePlus
PRODUCT_MODEL := CPH2487
PRODUCT_MANUFACTURER := OnePlus
PRODUCT_SYSTEM_NAME := CPH2487
PRODUCT_SYSTEM_DEVICE := OP5961L1


PRODUCT_BUILD_PROP_OVERRIDES += \
    TARGET_DEVICE=$(PRODUCT_SYSTEM_DEVICE) \
    TARGET_PRODUCT=$(PRODUCT_SYSTEM_NAME)

