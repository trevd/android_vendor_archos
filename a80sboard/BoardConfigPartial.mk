#
# Copyright (C) 2012 Texas Instruments Inc.
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

# Common Makefile to be included at the bottom of each device's
# BoardConfig.mk file. Definitions here are supposed to be device independent.


# Makefile variable and C/C++ macro to recognise DOMX version
ENHANCED_DOMX := true
COMMON_GLOBAL_CFLAGS += -DENHANCED_DOMX
DOMX_PATH := hardware/ti/domx

# C/C++ macros for OMAP_ENHANCEMENT
OMAP_ENHANCEMENT := true
COMMON_GLOBAL_CFLAGS += -DOMAP_ENHANCEMENT -DTARGET_OMAP4

OMAP_ENHANCEMENT_S3D := true
COMMON_GLOBAL_CFLAGS += -DOMAP_ENHANCEMENT_S3D

