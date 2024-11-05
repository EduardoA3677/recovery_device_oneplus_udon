#
#	This file is part of the OrangeFox Recovery Project
# 	Copyright (C) 2020-2021 The OrangeFox Recovery Project
#
#	OrangeFox is free software: you can redistribute it and/or modify
#	it under the terms of the GNU General Public License as published by
#	the Free Software Foundation, either version 3 of the License, or
#	any later version.
#
#	OrangeFox is distributed in the hope that it will be useful,
#	but WITHOUT ANY WARRANTY; without even the implied warranty of
#	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#	GNU General Public License for more details.
#
# 	This software is released under GPL version 3 or any later version.
#	See <http://www.gnu.org/licenses/>.
#
# 	Please maintain this if you use this script or any part of it
#
FDEVICE="udon"
#set -o xtrace

fox_get_target_device() {
local chkdev=$(echo "$BASH_SOURCE" | grep \"$FDEVICE\")
   if [ -n "$chkdev" ]; then
      FOX_BUILD_DEVICE="$FDEVICE"
   else
      chkdev=$(set | grep BASH_ARGV | grep \"$FDEVICE\")
      [ -n "$chkdev" ] && FOX_BUILD_DEVICE="$FDEVICE"
   fi
}

if [ -z "$1" -a -z "$FOX_BUILD_DEVICE" ]; then
   fox_get_target_device
fi

if [ "$1" = "$FDEVICE" -o "$FOX_BUILD_DEVICE" = "$FDEVICE" ]; then
     	echo "test =============="
	export FOX_VERSION="R12.2"
fi

	export LC_ALL="C"
 	export ALLOW_MISSING_DEPENDENCIES=true
 	
 	#OFR build settings & info
   
   export TARGET_ARCH=arm64
   export FOX_VERSION="R12.1"
 	export FOX_VANILLA_BUILD=1
	export FOX_USE_TWRP_RECOVERY_IMAGE_BUILDER=1
	export TARGET_DEVICE_ALT="PHK110, CPH2487, udon, OP5913L1, OP5961L1, ossi, qss"
   export FOX_TARGET_DEVICES="PHK110, CPH2487 ,udon ,OP5913L1, OP5961L1, ossi, qssi"
	export FOX_RECOVERY_SYSTEM_PARTITION="/dev/block/mapper/system"
	export FOX_RECOVERY_VENDOR_PARTITION="/dev/block/mapper/vendor"
   
	#OFR binary files
	export FOX_REPLACE_BUSYBOX_PS=1
	export FOX_USE_BASH_SHELL=1
	export FOX_ASH_IS_BASH=1
	export FOX_REPLACE_TOOLBOX_GETPROP=1
	export FOX_USE_TAR_BINARY=1
	export FOX_USE_XZ_UTILS=1
	export FOX_USE_SED_BINARY=1
	export FOX_USE_NANO_EDITOR=1
   export FOX_USE_GREP_BINARY=1
	export FOX_USE_SPECIFIC_MAGISK_ZIP=$(pwd)/device/oneplus/udon/Magisk-v28.0.zip

	#OTA
	export FOX_VIRTUAL_AB_DEVICE=1
	export FOX_DELETE_AROMAFM=1
   export OF_AB_DEVICE_WITH_RECOVERY_PARTITION=1
	export FOX_ENABLE_APP_MANAGER=1

   export OF_HIDE_NOTCH=1
   export OF_USE_GREEN_LED=0
   export OF_FLASHLIGHT_ENABLE=1
   export OF_ALLOW_DISABLE_NAVBAR=0
   export OF_QUICK_BACKUP_LIST=/data;/boot;
   export OF_SKIP_MULTIUSER_FOLDERS_BACKUP=1
   export OF_ENABLE_USB_STORAGE=1
   export OF_IGNORE_LOGICAL_MOUNT_ERRORS=1
   export OF_BIND_MOUNT_SDCARD_ON_FORMAT=1
   export OF_NO_SPLASH_CHANGE=1
   export OF_FORCE_CASEFOLDING=1
   export OF_DONT_KEEP_LOG_HISTORY=1

   export OF_SCREEN_H=2412
   export OF_STATUS_H=106
   export OF_STATUS_INDENT_LEFT=48
   export OF_STATUS_INDENT_RIGHT=48
   export OF_HIDE_NOTCH=1
   export OF_CLOCK_POS=1
   export OF_OPTIONS_LIST_NUM=6
   export OF_SPLASH_MAX_SIZE=16384

   export OF_ENABLE_LPTOOLS=1
 
   export OF_FBE_METADATA_MOUNT_IGNORE=1
   export OF_DISABLE_OTA_MENU=1
   export OF_DYNAMIC_FULL_SIZE=9663676416
   export OF_NO_TREBLE_COMPATIBILITY_CHECK=1
   export OF_PATCH_AVB20=1
   export OF_KEEP_DM_VERITY_FORCED_ENCRYPTION=1
   export OF_MAINTAINER=EduardoA3677

	lunch twrp_$FDEVICE-eng
	# let's see what are our build VARs
	if [ -n "$FOX_BUILD_LOG_FILE" -a -f "$FOX_BUILD_LOG_FILE" ]; then
  	   export | grep "FOX" >> $FOX_BUILD_LOG_FILE
  	   export | grep "OF_" >> $FOX_BUILD_LOG_FILE
   	   export | grep "TARGET_" >> $FOX_BUILD_LOG_FILE
  	   export | grep "TW_" >> $FOX_BUILD_LOG_FILE
 	fi
