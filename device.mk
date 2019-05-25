#
# Copyright (C) 2017 The LineageOS Project
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

$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

LOCAL_PATH := device/samsung/millet3g

# Overlays
DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay

# Get non-open-source specific aspects
$(call inherit-product-if-exists, vendor/samsung/millet3g/millet3g-vendor.mk)

# Radio
PRODUCT_PROPERTY_OVERRIDES += \
	ro.telephony.default_network=0 \
	telephony.lteOnGsmDevice=1 \
	persist.data.netmgrd.qos.enable=false \
	persist.data.qmi.adb_logmask=0 \
	persist.radio.add_power_save=1 \
	rild.libargs=-d /dev/smd0 \
	rild.libpath=/system/lib/libsec-ril.so \
	ro.telephony.ril_class=SamsungMSM8226RIL \
	ro.telephony.ril.config=simactivation \
	ro.use_data_netmgrd=false \
	persist.radio.no_wait_for_card=true \
	keyguard.no_require_sim=true

# Data line Permissions
PRODUCT_COPY_FILES += \
	frameworks/native/data/etc/android.hardware.telephony.cdma.xml:$(TARGET_OUT_ETC)/system/etc/permissions/android.hardware.telephony.cdma.xml \
	frameworks/native/data/etc/android.hardware.telephony.gsm.xml:$(TARGET_OUT_ETC)/system/etc/permissions/android.hardware.telephony.gsm.xml

# millet-common
$(call inherit-product, device/samsung/millet-common/millet.mk)

# TODO: opengapps
$(call inherit-product, vendor/light/config/opengapps.mk)
