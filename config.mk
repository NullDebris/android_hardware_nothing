HW_NOTHING_PATH = hardware/nothing

PRODUCT_SOONG_NAMESPACES += $(HW_NOTHING_PATH)

SYSTEM_EXT_PRIVATE_SEPOLICY_DIRS += $(HW_NOTHING_PATH)/sepolicy/common/private

ifneq ($(filter NothingEsimSwitcher ,$(PRODUCT_PACKAGES)),)
SYSTEM_EXT_PRIVATE_SEPOLICY_DIRS += $(HW_NOTHING_PATH)/sepolicy/esimswitcher/private
endif

