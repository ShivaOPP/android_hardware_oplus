#
# Copyright (C) 2022-2024 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Calcite uses CLO QVA policy directly; it has no CAF legacy-um sub-tree.
ifeq ($(AOSPA_BUILD),)
SEPOLICY_PLATFORM := $(subst device/qcom/sepolicy_vndr/,,$(SEPOLICY_PATH))
else
SEPOLICY_PLATFORM := common-um
endif

BOARD_VENDOR_SEPOLICY_DIRS += \
    hardware/oplus/sepolicy/qti/vendor \
    $(if $(filter-out common-um,$(SEPOLICY_PLATFORM)),hardware/oplus/sepolicy/qti/vendor/$(SEPOLICY_PLATFORM))

SYSTEM_EXT_PRIVATE_SEPOLICY_DIRS += \
    hardware/oplus/sepolicy/qti/private \
    $(if $(filter-out common-um,$(SEPOLICY_PLATFORM)),hardware/oplus/sepolicy/qti/private/$(SEPOLICY_PLATFORM))

SYSTEM_EXT_PUBLIC_SEPOLICY_DIRS += \
    hardware/oplus/sepolicy/qti/public \
    $(if $(filter-out common-um,$(SEPOLICY_PLATFORM)),hardware/oplus/sepolicy/qti/public/$(SEPOLICY_PLATFORM))

ifneq ($(SEPOLICY_PLATFORM), legacy-um)
BOARD_VENDOR_SEPOLICY_DIRS += \
    hardware/oplus/sepolicy/qti/vendor/common-um

SYSTEM_EXT_PRIVATE_SEPOLICY_DIRS += \
    hardware/oplus/sepolicy/qti/private/common-um

SYSTEM_EXT_PUBLIC_SEPOLICY_DIRS += \
    hardware/oplus/sepolicy/qti/public/common-um
endif

include device/lineage/sepolicy/libperfmgr/sepolicy.mk
