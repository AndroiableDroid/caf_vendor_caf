DEVICE_PACKAGE_OVERLAYS += vendor/caf/overlay/common

ifeq ($(TARGET_BUILD_VARIANT),user)
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += ro.adb.secure=1
else
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += ro.adb.secure=0
endif

# Include support for GApps backup
PRODUCT_COPY_FILES += \
    vendor/caf/prebuilt/bin/backuptool.sh:install/bin/backuptool.sh \
    vendor/caf/prebuilt/bin/backuptool.functions:install/bin/backuptool.functions \
    vendor/caf/prebuilt/bin/50-backuptool.sh:system/addon.d/50-backuptool.sh

ifeq ($(AB_OTA_UPDATER),true)
PRODUCT_COPY_FILES += \
    vendor/caf/prebuilt/bin/backuptool_ab.sh:system/bin/backuptool_ab.sh \
    vendor/caf/prebuilt/bin/backuptool_ab.functions:system/bin/backuptool_ab.functions \
    vendor/caf/prebuilt/bin/backuptool_postinstall.sh:system/bin/backuptool_postinstall.sh
endif

# Build Snapdragon apps
PRODUCT_PACKAGES += \
    SnapdragonGallery \
    SnapdragonMusic  \
    CMFileManager \
    messaging \

# Build Themes
PRODUCT_PACKAGES += \
    DuiDarkTheme \
    GBoardDarkTheme \
    SettingsDarkTheme \
    SystemDarkTheme

# Build sound recorder
PRODUCT_PACKAGES += SoundRecorder

# Build WallpaperPicker
PRODUCT_PACKAGES += WallpaperPicker
