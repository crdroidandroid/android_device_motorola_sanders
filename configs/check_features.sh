#!/sbin/sh

# 1802 - Brazil
# 1803 - Europe
# 1804 - India
# 1805 - Europe
# 1806 - USA

sku=`getprop ro.boot.hardware.sku`

if [ "$sku" == "XT1806" ]; then
    # XT1806 doesn't have NFC chip
    rm /vendor/etc/permissions/android.hardware.nfc.xml
    rm /vendor/etc/permissions/android.hardware.nfc.hce.xml
    rm /vendor/etc/permissions/android.hardware.nfc.hcef.xml
    rm /vendor/etc/permissions/com.android.nfc_extras.xml
    rm -rf /system/system/app/NfcNci
fi

if [ "$sku" != "XT1802" ]; then
    # Others variants doesn't have DTV support
    rm -f /system/system/etc/permissions/com.motorola.hardware.dtv.xml
    rm -f /system/system/etc/permissions/mot_dtv_permissions.xml
    rm /vendor/etc/permissions/com.motorola.hardware.dtv.xml
    rm /vendor/etc/permissions/mot_dtv_permissions.xml
    rm /vendor/lib/libdtvtuner.so
    rm /vendor/lib64/libdtvtuner.so
    rm /vendor/lib/libdtvhal.so
    rm /vendor/lib64/libdtvhal.so
    rm -rf /vendor/app/DTVPlayer
    rm -rf /vendor/app/DTVService
fi

if [ "$sku" == "XT1804" ]; then
    # XT1804 has additional thermal configs
    rm -f /vendor/etc/thermal-engine.conf
    mv /vendor/etc/thermal-engine-INDIA.conf /vendor/etc/thermal-engine.conf
else
    rm -f /vendor/etc/thermal-engine-INDIA.conf
fi

