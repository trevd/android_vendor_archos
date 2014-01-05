#!/bin/bash
#
# Patch the build system to show the file list
#
#
REPO_LAUNCHER=$( which repo )
function check_remote_revision(){

        # AOSP MASTER
        echo $(tr '\n/' ' '  < .repo/manifest.xml | grep -o '<default.*' | cut -f1 -d'>' ) \
        | grep -E 'remote="aosp".*revision="master"|revision="master".*remote="aosp"' ;
        return $?


}
function remove_local_manifests(){

    echo "Removing Old Local Vendor Manifests"

    rm .repo/local_manifests/archos-vendor.xml
    rm .repo/local_manifests/archos-aosp.xml
    rm .repo/local_manifests/cyanogenmod.xml
    rm .repo/local_manifests/linaro.xml


}
function symlink_local_manifests(){

    XMLDIR=$ANDROID_BUILD_TOP/vendor/archos/a80sboard/manifests/
    mkdir -pv .repo/local_manifests
    remove_local_manifests
    ln -sfv $XMLDIRarchos-vendor.xml .repo/local_manifests/archos-vendor.xml
    ln -sfv $XMLDIRarchos-aosp.xml .repo/local_manifests/archos-aosp.xml
    ln -sfv $XMLDIRcyanogenmod.xml .repo/local_manifests/cyanogenmod.xml
    ln -sfv $XMLDIRlinaro.xml .repo/local_manifests/linaro.xml

}
function apply_additional_patches(){

    echo "Patching Chromium"
    patch -p1 --silent --forward --reject-file=- --strip=1 --directory=external/chromium_org < vendor/archos/a80sboard/patches/chromium.patch
    echo "Patching Native Framework"
    patch  --silent --forward --reject-file=- --strip=0 < vendor/archos/a80sboard/patches/frameworks_native.patch
    echo "Patching Libhardware Framework"
    patch  --silent --forward --reject-file=- --strip=0 < vendor/archos/a80sboard/patches/libhardware.patch
    echo "Patching System Core"
    patch  --silent --forward --reject-file=- --strip=0 < vendor/archos/a80sboard/patches/system_core.patch
    echo "Patching Hackers Keyboard"
    patch  --silent --forward --reject-file=- --strip=0 < vendor/archos/a80sboard/patches/hackerskeyboard.patch
    echo "Patching Settings to enable embedded superuser"
    patch  --silent --forward --reject-file=- --strip=0 < vendor/archos/a80sboard/patches/embedded_superuser.patch

}
        if [  -z check_remote_revision ] ; then
                echo "Not on the AOSP Master Branch.... Skipping Archos setup"
        else               
        apply_additional_patches
        rm -rf system/extra/su

    fi
