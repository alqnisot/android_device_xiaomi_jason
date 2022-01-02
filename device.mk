#
# Copyright (C) 2017-2020 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from sdm660-common
$(call inherit-product, device/xiaomi/sdm660-common/sdm660.mk)

# Setup dalvik vm configs
$(call inherit-product, frameworks/native/build/phone-xhdpi-6144-dalvik-heap.mk)

# Overlays
DEVICE_PACKAGE_OVERLAYS += \
    $(LOCAL_PATH)/overlay \
    $(LOCAL_PATH)/overlay-lineage

# Boot animation
TARGET_SCREEN_HEIGHT := 1920
TARGET_SCREEN_WIDTH := 1080

# Haters gonna hate..
PRODUCT_CHARACTERISTICS := nosdcard

# Treble
PRODUCT_COMPATIBLE_PROPERTY_OVERRIDE := true

# Audio
PRODUCT_PACKAGES += \
    libspkrprot

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/audio/audio_platform_info_intcodec.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_platform_info_intcodec.xml \
    $(LOCAL_PATH)/audio/mixer_paths.xml:$(TARGET_COPY_OUT_VENDOR)/etc/mixer_paths.xml \

PRODUCT_PROPERTY_OVERRIDES += \
    persist.vendor.audio.spkr.cal.duration=100 \
    persist.vendor.audio.speaker.prot.enable=true \
    persist.vendor.audio.spv3.enable=true \
    persist.vendor.audio.avs.afe_api_version=2

PRODUCT_PROPERTY_OVERRIDES += \
    persist.camera.dxoaf.sc=1 \
    persist.camera.gyro.disable=0 \
    persist.camera.hist.high=20 \
    persist.camera.hist.drc=1.2 \
    persist.camera.stats.test=5 \
    persist.vendor.camera.expose.aux=1 \
    persist.vendor.camera.sat.enable=1 \
    persist.vendor.camera.instant.aec=1 \
    persist.vendor.camera.ae.instant.bound=20 \
    persist.vendor.camera.set.afd=4 \
    persist.vendor.camera.dxo=1 \
    persist.vendor.camera.feature.cac=1 \
    persist.vendor.camera.fovc.enable=1 \
    persist.vendor.dualcam.lpm.enable=1 \
    persist.vendor.dualcam.defer.enable=1 \

# Consumerir
BOARD_HAVE_IR := true

# Display
PRODUCT_PROPERTY_OVERRIDES += \
    ro.vendor.display.ad=1 \
    ro.vendor.display.ad.sdr_calib_data=/system/vendor/etc/sdr_config.cfg \
    ro.vendor.display.ad.hdr_calib_data=/system/vendor/etc/hdr_config.cfg \
    ro.vendor.display.sensortype=2

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/keylayout/gpio-keys.kl:$(TARGET_COPY_OUT_VENDOR)/usr/keylayout/gpio-keys.kl \
    $(LOCAL_PATH)/keylayout/synaptics_dsx.kl:$(TARGET_COPY_OUT_VENDOR)/usr/keylayout/synaptics_dsx.kl

# Dual SIM
PRODUCT_PROPERTY_OVERRIDES += \
    persist.radio.multisim.config=dsds

# Fingerprint
PRODUCT_PACKAGES += \
    libpowermanager.vendor

# Gatekeeper HAL
PRODUCT_PACKAGES += \
    android.hardware.gatekeeper@1.0-impl \
    android.hardware.gatekeeper@1.0-service

# HW crypto
PRODUCT_PACKAGES += \
    vendor.qti.hardware.cryptfshw@1.0-service-qti.qsee

# HIDL
PRODUCT_PACKAGES += \
    libhwbinder \
    libhwbinder.vendor

# Keymaster HAL
PRODUCT_PACKAGES += \
    android.hardware.keymaster@3.0-impl \
    android.hardware.keymaster@3.0-service

# Lineage hardware
PRODUCT_PACKAGES += \
    vendor.lineage.touch@1.0-service.jason

# NFC
PRODUCT_PACKAGES += \
    NfcNci \
    SecureElement \
    android.hardware.nfc@1.2-service \
    Tag

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/nfc/libnfc-nxp.conf:$(TARGET_COPY_OUT_VENDOR)/etc/libnfc-nxp.conf \
    $(LOCAL_PATH)/configs/nfc/libnfc-nci.conf:$(TARGET_COPY_OUT_SYSTEM)/etc/libnfc-nci.conf \
    $(LOCAL_PATH)/configs/nfc/libnfc-nxp_RF.conf:$(TARGET_COPY_OUT_VENDOR)/libnfc-nxp_RF.conf

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.nfc.hce.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.nfc.hce.xml \
    frameworks/native/data/etc/android.hardware.nfc.hcef.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.nfc.hcef.xml \
    frameworks/native/data/etc/android.hardware.nfc.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.nfc.xml \
     frameworks/native/data/etc/android.hardware.nfc.uicc.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.nfc.uicc.xml \
    frameworks/native/data/etc/com.android.nfc_extras.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/com.android.nfc_extras.xml \
    frameworks/native/data/etc/com.nxp.mifare.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/com.nxp.mifare.xml

# Pocket mode
PRODUCT_PACKAGES += \
    XiaomiPocketMode

# Ramdisk
PRODUCT_PACKAGES += \
    init.panel_info.sh \
    init.device.rc \
    fstab.qcom

# Recovery
PRODUCT_PACKAGES += \
    librecovery_updater_jason

# Sensorservice
PRODUCT_COPY_FILES += \
    prebuilts/vndk/v28/arm/arch-arm-armv7-a-neon/shared/vndk-core/android.frameworks.sensorservice@1.0.so:$(TARGET_COPY_OUT_VENDOR)/lib/android.frameworks.sensorservice@1.0.so \
    prebuilts/vndk/v28/arm64/arch-arm64-armv8-a/shared/vndk-core/android.frameworks.sensorservice@1.0.so:$(TARGET_COPY_OUT_VENDOR)/lib64/android.frameworks.sensorservice@1.0.so

# Telephony
PRODUCT_PROPERTY_OVERRIDES += \
    persist.vendor.radio.force_on_dc=true

# Torch
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.flash-autofocus.xml

# Vibrator
PRODUCT_PACKAGES += \
    android.hardware.vibrator@1.0-impl \
    android.hardware.vibrator@1.0-service

BOARD_VNDK_RUNTIME_DISABLE := true

# Wifi
PRODUCT_PACKAGES += \
    JasonWifiOverlay \
    readmac

# Inherit the proprietary files
$(call inherit-product, vendor/xiaomi/jason/jason-vendor.mk)
$(call inherit-product-if-exists, vendor/miuicamera/common/common-vendor.mk)
