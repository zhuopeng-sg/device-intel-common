# Copyright (C) 2013-2014 Intel Mobile Communications GmbH
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
# ------------------------------------------------------------------------

#########################################################################
# This file originated in WPRD's android/device/intel/common/Android.mk #
# It has been adapted to function in the GMIN build system              #
#########################################################################

LOCAL_PATH:= $(call my-dir)

#-----------------------
# Common
#-----------------------

FLSTOOL        = $(CURDIR)/modem/msw_tools/FlashTool/release/bin/FlsTool
FLASHFILES_DIR := $(PRODUCT_OUT)/fls
SIGN_FLS_DIR   := $(CURDIR)/$(PRODUCT_OUT)/sign_fls

SOCLIB_SRC_PATH ?= $(CURDIR)/soclib
SECVM_SRC_PATH  ?= $(CURDIR)/secure_vm
GUESTVM2_SRC_PATH  ?= $(CURDIR)/mobilevisor/guests/vm2
MOBILEVISOR_SVC_PATH ?= $(CURDIR)/mobilevisor/services
MOBILEVISOR_SRC_PATH ?= $(CURDIR)/mobilevisor/products
MOBILEVISOR_REL_PATH ?= $(CURDIR)/mobilevisor/release
MOBILEVISOR_GUEST_PATH ?= $(CURDIR)/mobilevisor/guests
BLOB_BUILDER_SCRIPT ?= $(MOBILEVISOR_REL_PATH)/tools/vmmBlobBuilder.py
BINARY_MERGE_TOOL = $(MOBILEVISOR_REL_PATH)/tools/binary_merge
VBT_GENERATE_TOOL = $(MOBILEVISOR_REL_PATH)/tools/vbtgen




createflashfile_dir:
	mkdir -p $(FLASHFILES_DIR)

create_sign_fls_dir:
	mkdir -p $(SIGN_FLS_DIR)

droidcore: createflashfile_dir

.PHONY: build_info
build_info:
	@echo "-------------------------------------------"

SYSTEM_SIGNED_FLS_LIST =
SYSTEM_SEC_BIN_LIST =

include $(LOCAL_PATH)/createprg.mk
include $(LOCAL_PATH)/soclib.mk
include $(LOCAL_PATH)/mobilevisor_svc.mk
include $(LOCAL_PATH)/bootcore.mk
include $(LOCAL_PATH)/mobilevisor_config.mk
include $(LOCAL_PATH)/mobilevisor.mk
include $(LOCAL_PATH)/secvm.mk
include $(LOCAL_PATH)/secbin.mk
#include $(LOCAL_PATH)/kernel.mk
include $(LOCAL_PATH)/modem.mk
include $(LOCAL_PATH)/guestvm.mk
include $(LOCAL_PATH)/androidfls.mk
include $(LOCAL_PATH)/signfls.mk

include $(all-subdir-makefiles)