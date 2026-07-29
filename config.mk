HW_NOTHING_PATH = hardware/nothing

PRODUCT_SOONG_NAMESPACES += $(HW_NOTHING_PATH)

SYSTEM_EXT_PRIVATE_SEPOLICY_DIRS += $(HW_NOTHING_PATH)/sepolicy/common/private
BOARD_VENDOR_SEPOLICY_DIRS += $(HW_NOTHING_PATH)/sepolicy/common/vendor

ifneq ($(filter NothingEsimSwitcher ,$(PRODUCT_PACKAGES)),)
SYSTEM_EXT_PRIVATE_SEPOLICY_DIRS += $(HW_NOTHING_PATH)/sepolicy/esimswitcher/private
endif

ifneq ($(filter DeviceExtras ,$(PRODUCT_PACKAGES)),)
SYSTEM_EXT_PRIVATE_SEPOLICY_DIRS += $(HW_NOTHING_PATH)/sepolicy/DeviceExtras/private
SYSTEM_EXT_PUBLIC_SEPOLICY_DIRS += $(HW_NOTHING_PATH)/sepolicy/DeviceExtras/public
endif
