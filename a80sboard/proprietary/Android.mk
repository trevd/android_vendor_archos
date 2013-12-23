#
# Copyright (C) 2011 The Android Open-Source Project
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


ifeq ($(TARGET_DEVICE),a80sboard)
LOCAL_PATH:= $(call my-dir)

include $(CLEAR_VARS)
LOCAL_MODULE := sensors.omap4
LOCAL_SRC_FILES := sensors.omap4.so
LOCAL_MODULE_SUFFIX := .so
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_MODULE_PATH := $(TARGET_OUT_SHARED_LIBRARIES)/hw
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_OWNER := archos
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE := gps.omap4
LOCAL_SRC_FILES := gps.omap4.so
LOCAL_MODULE_SUFFIX := .so
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_MODULE_PATH := $(TARGET_OUT_SHARED_LIBRARIES)/hw
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_OWNER := archos
include $(BUILD_PREBUILT)


include $(CLEAR_VARS)
LOCAL_MODULE := libgps
LOCAL_SRC_FILES := libgps.so
LOCAL_MODULE_SUFFIX := .so
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_MODULE_PATH := $(TARGET_OUT_SHARED_LIBRARIES)
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_OWNER := archos
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE := libgpsservices
LOCAL_SRC_FILES := libgpsservices.so
LOCAL_MODULE_SUFFIX := .so
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_MODULE_PATH := $(TARGET_OUT_SHARED_LIBRARIES)
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_OWNER := archos
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE := libmcphalgps
LOCAL_SRC_FILES := libmcphalgps.so
LOCAL_MODULE_SUFFIX := .so
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_MODULE_PATH := $(TARGET_OUT_SHARED_LIBRARIES)
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_OWNER := archos
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE := libsupllocationprovider
LOCAL_SRC_FILES := libsupllocationprovider.so
LOCAL_MODULE_SUFFIX := .so
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_MODULE_PATH := $(TARGET_OUT_SHARED_LIBRARIES)
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_OWNER := archos
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE := akmd8975
LOCAL_SRC_FILES := akmd8975
LOCAL_MODULE_CLASS := EXECUTABLES
LOCAL_MODULE_PATH := $(TARGET_OUT_EXECUTABLES)
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_OWNER := archos
include $(BUILD_PREBUILT)


include $(CLEAR_VARS)
LOCAL_MODULE := batteryd
LOCAL_SRC_FILES := batteryd
LOCAL_MODULE_CLASS := EXECUTABLES
LOCAL_MODULE_PATH := $(TARGET_OUT_EXECUTABLES)
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_OWNER := archos
include $(BUILD_PREBUILT)


include $(CLEAR_VARS)
LOCAL_MODULE := navd
LOCAL_SRC_FILES := navd
LOCAL_MODULE_CLASS := EXECUTABLES
LOCAL_MODULE_PATH := $(TARGET_OUT_EXECUTABLES)
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_OWNER := archos
include $(BUILD_PREBUILT)


include $(CLEAR_VARS)
LOCAL_MODULE := client_keystore
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_PATH := $(TARGET_OUT_ETC)/gps/cert
LOCAL_MODULE_SUFFIX := .bks
LOCAL_SRC_FILES := client_keystore.bks
LOCAL_MODULE_CLASS := FIRMWARE
LOCAL_MODULE_OWNER := archos
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE := GPSCConfigFile
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_PATH := $(TARGET_OUT_ETC)/gps/config
LOCAL_MODULE_SUFFIX := .cfg
LOCAL_SRC_FILES := GPSCConfigFile.cfg
LOCAL_MODULE_CLASS := FIRMWARE
LOCAL_MODULE_OWNER := archos
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE := GpsConfigFile
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_PATH := $(TARGET_OUT_ETC)/gps/config
LOCAL_MODULE_SUFFIX := .txt
LOCAL_SRC_FILES := GpsConfigFile.txt
LOCAL_MODULE_CLASS := FIRMWARE
LOCAL_MODULE_OWNER := archos
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE := inavconfigfile
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_PATH := $(TARGET_OUT_ETC)/gps/config
LOCAL_MODULE_SUFFIX := .txt
LOCAL_SRC_FILES := inavconfigfile.txt
LOCAL_MODULE_CLASS := FIRMWARE
LOCAL_MODULE_OWNER := archos
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE := pathconfigfile
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_PATH := $(TARGET_OUT_ETC)/gps/config
LOCAL_MODULE_SUFFIX := .txt
LOCAL_SRC_FILES := pathconfigfile.txt
LOCAL_MODULE_CLASS := FIRMWARE
LOCAL_MODULE_OWNER := archos
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE := PeriodicConfFile
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_PATH := $(TARGET_OUT_ETC)/gps/config
LOCAL_MODULE_SUFFIX := .cfg
LOCAL_SRC_FILES := PeriodicConfFile.cfg
LOCAL_MODULE_CLASS := FIRMWARE
LOCAL_MODULE_OWNER := archos
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE := SuplConfig
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_PATH := $(TARGET_OUT_ETC)/gps/config
LOCAL_MODULE_SUFFIX := .spl
LOCAL_SRC_FILES := SuplConfig.spl
LOCAL_MODULE_CLASS := FIRMWARE
LOCAL_MODULE_OWNER := archos
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE := patch-X.0
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_PATH := $(TARGET_OUT_ETC)/gps/patch
LOCAL_MODULE_SUFFIX := .ce
LOCAL_SRC_FILES := patch-X.0.ce
LOCAL_MODULE_CLASS := FIRMWARE
LOCAL_MODULE_OWNER := archos
include $(BUILD_PREBUILT)

# abcbox archos binary
include $(CLEAR_VARS)
LOCAL_MODULE := abcbox
LOCAL_SRC_FILES := abcbox
LOCAL_MODULE_CLASS := EXECUTABLES
LOCAL_MODULE_PATH := $(TARGET_OUT_OPTIONAL_EXECUTABLES)
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_OWNER := archos
include $(BUILD_PREBUILT)
    
ABCBOX_LINKS := acat adev aosparser autodim bat cramfschecker create_nvs create_sysid \
	    fb_write flash_partition_erase fsck.ext3_parser get_info kd_flasher \
	    kx_checker led mactool mkfs.ext3_parser reboot_into 
	    
# Make #!/system/bin/abcbox launchers for each tool.
#
SYMLINKS := $(addprefix $(TARGET_OUT_OPTIONAL_EXECUTABLES)/,$(ABCBOX_LINKS))
$(SYMLINKS): ABCBOX_BINARY := $(LOCAL_MODULE)
$(SYMLINKS): $(LOCAL_INSTALLED_MODULE) $(LOCAL_PATH)/Android.mk
	@echo "Symlink: $@ -> $(ABCBOX_BINARY)"
	@mkdir -p $(dir $@)
	@rm -rf $@
	$(hide) ln -sf $(ABCBOX_BINARY) $@

ALL_DEFAULT_INSTALLED_MODULES += $(SYMLINKS)

# We need this so that the installed files could be picked up based on the
# local module name
ALL_MODULES.$(LOCAL_MODULE).INSTALLED := \
    $(ALL_MODULES.$(LOCAL_MODULE).INSTALLED) $(SYMLINKS)

####### abcbox recovery version ######################

include $(CLEAR_VARS)
LOCAL_MODULE := abcbox_recovery
LOCAL_SRC_FILES := abcbox
LOCAL_MODULE_CLASS := RECOVERY_EXECUTABLES
LOCAL_MODULE_PATH :=  $(TARGET_RECOVERY_ROOT_OUT)/sbin
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_OWNER := archos
LOCAL_MODULE_STEM := abcbox
include $(BUILD_PREBUILT)

# Make #!/sbin/abcbox launchers for each tool.
#
SYMLINKS_RECOVERY := $(addprefix $(TARGET_RECOVERY_ROOT_OUT)/sbin/,$(ABCBOX_LINKS))
$(SYMLINKS_RECOVERY): ABCBOX_BINARY := $(LOCAL_MODULE_STEM)
$(SYMLINKS_RECOVERY): $(LOCAL_INSTALLED_MODULE) $(LOCAL_PATH)/Android.mk
	@echo "Symlink: $@ -> $(ABCBOX_BINARY)"
	@mkdir -p $(dir $@)
	@rm -rf $@
	$(hide) ln -sf $(ABCBOX_BINARY) $@

ALL_DEFAULT_INSTALLED_MODULES += $(SYMLINKS_RECOVERY)

# We need this so that the installed files could be picked up based on the
# local module name
ALL_MODULES.$(LOCAL_MODULE).INSTALLED := \
    $(ALL_MODULES.$(LOCAL_MODULE).INSTALLED) $(SYMLINKS_RECOVERY)
    
#### kd_flasher utility tool #####

include $(CLEAR_VARS)
LOCAL_MODULE := utility_kdflasher
LOCAL_SRC_FILES := abcbox
LOCAL_MODULE_CLASS := UTILITY_EXECUTABLES
LOCAL_MODULE_PATH := $(PRODUCT_OUT)/utilities
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_OWNER := archos
LOCAL_MODULE_STEM := kd_flasher
include $(BUILD_PREBUILT)

endif
