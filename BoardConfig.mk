#
# Copyright 2019 The Android Open Source Project
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

PLATFORM_PATH := device/BQ/BQ5519G

# For building with minimal manifest
ALLOW_MISSING_DEPENDENCIES=true

# FOCKING BINDER
TARGET_USES_64_BIT_BINDER := true
#TARGET_SUPPORTS_32_BIT_APPS := true

# Architecture
TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_VARIANT := cortex-a7

# Platform
TARGET_BOARD_PLATFORM := sp7731e

# Bootloader
TARGET_NO_BOOTLOADER := true 
TARGET_BOOTLOADER_BOARD_NAME := sp7731e

# Partitions
BOARD_BOOTIMAGE_PARTITION_SIZE := 36700160
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 36700160
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 1782579200
BOARD_USERDATAIMAGE_PARTITION_SIZE := 1782579200
BOARD_CACHEIMAGE_PARTITION_SIZE := 157286400
BOARD_PERSISTIMAGE_PARTITION_SIZE := 2097152
BOARD_FLASH_BLOCK_SIZE := 131072 # (BOARD_KERNEL_PAGESIZE * 64)

BOARD_BUILD_SYSTEM_ROOT_IMAGE := true
BOARD_PROPERTY_OVERRIDES_SPLIT_ENABLED := true

TARGET_USERIMAGES_USE_F2FS := true
TARGET_USERIMAGES_USE_EXT4 := true
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4

# Workaround for error copying vendor files to recovery ramdisk
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4
TARGET_COPY_OUT_VENDOR := vendor

# Use mke2fs to create ext4 images
TARGET_USES_MKE2FS := true

# Android Verified Boot
BOARD_AVB_ENABLE := true
BOARD_AVB_KEY_PATH := external/avb/test/data/testkey_rsa4096.pem
BOARD_AVB_RECOVERY_KEY_PATH := $(BOARD_AVB_KEY_PATH)
BOARD_AVB_ALGORITHM := SHA256_RSA4096
BOARD_AVB_RECOVERY_ALGORITHM := $(BOARD_AVB_ALGORITHM)
BOARD_AVB_ROLLBACK_INDEX := $(PLATFORM_SECURITY_PATCH_TIMESTAMP)
BOARD_AVB_RECOVERY_ROLLBACK_INDEX := $(BOARD_AVB_ROLLBACK_INDEX)
BOARD_AVB_RECOVERY_ROLLBACK_INDEX_LOCATION := 0


# Kernel
BOARD_KERNEL_CMDLINE := console=ttyS1,115200n8
BOARD_KERNEL_CMDLINE += androidboot.selinux=permissive
BOARD_KERNEL_BASE := 0x00000000
BOARD_KERNEL_PAGESIZE := 2048
BOARD_RAMDISK_OFFSET := 0x05400000
TARGET_PREBUILT_KERNEL := $(PLATFORM_PATH)/prebuilt/zImage-dtb
BOARD_INCLUDE_RECOVERY_DTBO := true
BOARD_PREBUILT_DTBOIMAGE := $(PLATFORM_PATH)/prebuilt/dtbo.img
BOARD_HEADER_VERSION := 1
BOARD_MKBOOTIMG_ARGS += --ramdisk_offset 0x05400000 --header_version $(BOARD_HEADER_VERSION)
BOARD_KERNEL_IMAGE_NAME := zImage-dtb

# TWRP specific build flags
BOARD_HAS_LARGE_FILESYSTEM := true
TARGET_RECOVERY_PIXEL_FORMAT := "RGBX_8888"
TW_BRIGHTNESS_PATH := "/sys/devices/platform/sprd_backlight/backlight/sprd_backlight/brightness"
TARGET_RECOVERY_LCD_BACKLIGHT_PATH := \"/sys/devices/platform/sprd_backlight/backlight/sprd_backlight/brightness\"
TW_THEME := portrait_hdpi
TW_USE_TOOLBOX := true
HAVE_SELINUX := true
RECOVERY_SDCARD_ON_DATA := true
TW_NO_LEGACY_PROPS := true
TW_DEFAULT_LANGUAGE := ru
#TW_INCLUDE_NTFS_3G := true
TW_MAX_BRIGHTNESS := 125
TW_DEFAULT_BRIGHTNESS := 90
TW_SCREEN_BLANK_ON_BOOT := false
TWRP_INCLUDE_LOGCAT := true
TARGET_USES_LOGD := true
TW_NO_USB_STORAGE := false
TW_EXCLUDE_DEFAULT_USB_INIT := true
TW_INPUT_BLACKLIST := "hbtp_vm"
TW_USE_MODEL_HARDWARE_ID_FOR_DEVICE_ID := true
TW_NO_SCREEN_BLANK := true

# Show build time on the splash screen
TW_DEVICE_VERSION=$(shell date '+%Y%m%d') by depesh1977

# Encryption
PLATFORM_VERSION := 16.1.0
PLATFORM_SECURITY_PATCH := 2025-12-31
#VENDOR_SECURITY_PATCH := 2025-12-31
#TW_INCLUDE_CRYPTO := true

#PIE
PLATFORM_SDK_VERSION := 28
#
#
#The End!
#
#




