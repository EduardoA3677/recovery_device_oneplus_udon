#
# Copyright (C) 2024 The Android Open Source Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from common AOSP config
$(call inherit-product, $(SRC_TARGET_DIR)/product/base.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit_only.mk)

# Enable project quotas and casefolding for emulated storage without sdcardfs
$(call inherit-product, $(SRC_TARGET_DIR)/product/emulated_storage.mk)

# Installs gsi keys into ramdisk, to boot a GSI with verified boot.
$(call inherit-product, $(SRC_TARGET_DIR)/product/gsi_keys.mk)

# Configure twrp common.mk
$(call inherit-product, vendor/twrp/config/common.mk)

# Platform
QCOM_BOARD_PLATFORMS += $(PRODUCT_PLATFORM)
TARGET_BOARD_PLATFORM := $(PRODUCT_PLATFORM)
TARGET_BOOTLOADER_BOARD_NAME := $(TARGET_BOARD_PLATFORM)

BUILD_BROKEN_DUP_RULES := true

RELAX_USES_LIBRARY_CHECK := true

# VNDK
PRODUCT_TARGET_VNDK_VERSION := 32

# Virtual A/B
$(call inherit-product, $(SRC_TARGET_DIR)/product/virtual_ab_ota/compression.mk)

# A/B updater updatable partitions list. Keep in sync with the partition list
# with "_a" and "_b" variants in the device. Note that the vendor can add more
# more partitions to this list for the bootloader and radio.
# Main Logical Partitions
AB_OTA_UPDATER := true
AB_OTA_PARTITIONS += \
    boot \
    dtbo \
    odm \
    product \
    recovery \
    system \
    odm_dlkm \
    system_ext \
    vbmeta \
    vbmeta_system \
    vbmeta_vendor \
    vendor \
    vendor_boot \
    
PRODUCT_PACKAGES += update_engine \
    update_engine_client \
    update_verifier \
    android.hardware.boot@1.2-impl-qti \
    android.hardware.boot@1.2-impl-qti.recovery \
    android.hardware.boot@1.2-service

PRODUCT_PACKAGES += \
  update_engine_sideload

# F2FS Utilities
PRODUCT_PACKAGES += \
    sg_write_buffer \
    f2fs_io \
    check_f2fs

# Userdata checkpoint
PRODUCT_PACKAGES += \
    otapreopt_script \
    checkpoint_gc

AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_system=true \
    POSTINSTALL_PATH_system=system/bin/otapreopt_script \
    FILESYSTEM_TYPE_system=ext4 \
    POSTINSTALL_OPTIONAL_system=true

AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_vendor=true \
    POSTINSTALL_PATH_vendor=bin/checkpoint_gc \
    FILESYSTEM_TYPE_vendor=ext4 \
    POSTINSTALL_OPTIONAL_vendor=true

BOARD_SHIPPING_API_LEVEL := 31
BOARD_API_LEVEL := 31
SHIPPING_API_LEVEL := 31
PRODUCT_SHIPPING_API_LEVEL := 31

#Support to compile recovery without msm headers
TARGET_HAS_GENERIC_KERNEL_HEADERS := true

# Stock OEM OTA Cert
PRODUCT_EXTRA_RECOVERY_KEYS += \
    $(LOCAL_PATH)/security/local_OTA \
    $(LOCAL_PATH)/security/special_OTA

# Dynamic partitions
PRODUCT_USE_DYNAMIC_PARTITIONS := true

# fastbootd
PRODUCT_PACKAGES += fastbootd

# Add default implementation of fastboot HAL.
PRODUCT_PACKAGES += android.hardware.fastboot@1.1-impl-mock

# Hidl Service
PRODUCT_ENFORCE_VINTF_MANIFEST := true

# qcom decryption
PRODUCT_PACKAGES += \
    qcom_decrypt \
    qcom_decrypt_fbe

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(DEVICE_PATH)
