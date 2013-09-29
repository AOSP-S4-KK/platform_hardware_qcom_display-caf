ifeq ($(TARGET_QCOM_DISPLAY_VARIANT),caf)
display-hals := libgralloc libgenlock libcopybit liblight libvirtual
display-hals += libhwcomposer liboverlay libqdutils libexternal libqservice

ifneq (,$(filter $(QCOM_BOARD_PLATFORMS),$(TARGET_BOARD_PLATFORM)))
    include $(call all-named-subdir-makefiles,$(display-hals))
else
ifneq ($(filter msm8226 msm8x26 msm8960 msm8974 msm8x74,$(TARGET_BOARD_PLATFORM)),)
    #This is for mako since it doesn't have the QCOM make functions
    include $(call all-named-subdir-makefiles,$(display-hals))
endif
endif
endif
