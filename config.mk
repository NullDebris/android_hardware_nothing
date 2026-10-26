HW_NOTHING_PATH = hardware/nothing
PRODUCT_SOONG_NAMESPACES += $(HW_NOTHING_PATH)

# Camera
$(call soong_config_set,camera,package_name,com.nothing.device.package_name)

# Sepolicy (common)
SYSTEM_EXT_PRIVATE_SEPOLICY_DIRS += $(HW_NOTHING_PATH)/sepolicy/common/private
BOARD_VENDOR_SEPOLICY_DIRS += $(HW_NOTHING_PATH)/sepolicy/common/vendor
SYSTEM_EXT_PUBLIC_SEPOLICY_DIRS += $(HW_NOTHING_PATH)/sepolicy/common/public

# Sepolicy (QCOM)
ifeq ($(BOARD_USES_QCOM_HARDWARE),true)
BOARD_VENDOR_SEPOLICY_DIRS += $(HW_NOTHING_PATH)/sepolicy/qcom/vendor
endif

# Lineage Health
ifneq ($(filter vendor.lineage.health-service.default ,$(PRODUCT_PACKAGES)),)
$(call soong_config_set,lineage_health,charging_control_charging_path,/proc/charger/usb_charger_en)
BOARD_VENDOR_SEPOLICY_DIRS += $(HW_NOTHING_PATH)/sepolicy/lineage/health
endif

# eSim Switcher
ifneq ($(filter NothingEsimSwitcher ,$(PRODUCT_PACKAGES)),)
SYSTEM_EXT_PRIVATE_SEPOLICY_DIRS += $(HW_NOTHING_PATH)/sepolicy/esimswitcher/private
endif

# Device Extras
ifneq ($(filter DeviceExtras ,$(PRODUCT_PACKAGES)),)
SYSTEM_EXT_PRIVATE_SEPOLICY_DIRS += $(HW_NOTHING_PATH)/sepolicy/DeviceExtras/private
SYSTEM_EXT_PUBLIC_SEPOLICY_DIRS += $(HW_NOTHING_PATH)/sepolicy/DeviceExtras/public
endif

# Sepolicy (Glyph)
ifneq ($(filter HieroGlyph$(PRODUCT_DEVICE) ParanoidGlyph%,$(PRODUCT_PACKAGES)),)

SYSTEM_EXT_PRIVATE_SEPOLICY_DIRS += $(HW_NOTHING_PATH)/sepolicy/glyph/private
BOARD_VENDOR_SEPOLICY_DIRS += $(HW_NOTHING_PATH)/sepolicy/glyph/vendor
SYSTEM_EXT_PUBLIC_SEPOLICY_DIRS += $(HW_NOTHING_PATH)/sepolicy/glyph/public

ifneq ($(filter HieroGlyph$(PRODUCT_DEVICE) ,$(PRODUCT_PACKAGES)),)
SYSTEM_EXT_PRIVATE_SEPOLICY_DIRS += $(HW_NOTHING_PATH)/sepolicy/glyph/HieroGlyph/private
endif

endif

# Vibrator (shared_libs guaard)
ifneq ($(filter android.hardware.vibrator.service.nothing-rt_ics, $(PRODUCT_PACKAGES)),)
$(call soong_config_set_bool, nothing_vibrator, enable_deps, true)
endif
