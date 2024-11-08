#!/system/bin/sh
# This script is needed to automatically set device props.

variant=$(getprop ro.boot.prjname)

echo $variant

case $variant in
    "22881")
    #China
        resetprop ro.product.device "OP5913L1"
        resetprop ro.product.vendor.device "OP5913L1"
        resetprop ro.product.odm.device "OP5913L1"
        resetprop ro.product.product.device "OP5913L1"
        resetprop ro.product.device "OP5913L1"
        resetprop ro.product.system_ext.device "OP5913L1"
        resetprop ro.product.product.model "PHK110"
        resetprop ro.product.model "PHK110"
        resetprop ro.product.system.model "PHK110"
        resetprop ro.product.system_ext.model "PHK110"
        resetprop ro.product.vendor.model "PHK110"
        resetprop ro.product.odm.model "PHK110"
        ;;
    "22803")
    #India
        resetprop ro.product.device "OP5961L1"
        resetprop ro.product.odm.device "OP5961L1"
        resetprop ro.product.product.device "OP5961L1"
        resetprop ro.product.system_ext.device "OP5961L1"
        resetprop ro.product.vendor.device "OP5961L1"
        resetprop ro.product.product.model "CPH2487"
        resetprop ro.product.product.model "CPH2487"
        resetprop ro.product.model "CPH2487"
        resetprop ro.product.system.model "CPH2487"
        resetprop ro.product.system_ext.model "CPH2487"
        resetprop ro.product.vendor.model "CPH2487"
        resetprop ro.product.odm.model "CPH2487"
        ;;
    *)
        resetprop ro.product.device "OP5961L1"
        resetprop ro.product.odm.device "OP5961L1"
        resetprop ro.product.product.device "OP5961L1"
        resetprop ro.product.system_ext.device "OP5961L1"
        resetprop ro.product.vendor.device "OP5961L1"
        resetprop ro.product.product.model "CPH2487"
        resetprop ro.product.product.model "CPH2487"
        resetprop ro.product.model "CPH2487"
        resetprop ro.product.system.model "CPH2487"
        resetprop ro.product.system_ext.model "CPH2487"
        resetprop ro.product.vendor.model "CPH2487"
        resetprop ro.product.odm.model "CPH2487"
        ;;
esac

exit 0
