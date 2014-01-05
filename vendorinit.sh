function remove_local_manifests(){

    echo "Removing Old Local Vendor Manifests"

    rm .repo/local_manifests/archos-vendor.xml
    rm .repo/local_manifests/archos-aosp.xml
    rm .repo/local_manifests/cyanogenmod.xml
    rm .repo/local_manifests/linaro.xml


}
function symlink_local_manifests(){

    XMLDIR=
    mkdir -pv .repo/local_manifests
    remove_local_manifests
    ln -sfv $PWD/vendor/archos/a80sboard/manifests/archos-vendor.xml .repo/local_manifests/archos-vendor.xml
    ln -sfv $PWD/vendor/archos/a80sboard/manifests/archos-aosp.xml .repo/local_manifests/archos-aosp.xml
    ln -sfv $PWD/vendor/archos/a80sboard/manifests/cyanogenmod.xml .repo/local_manifests/cyanogenmod.xml
    ln -sfv $PWD/vendor/archos/a80sboard/manifests/linaro.xml .repo/local_manifests/linaro.xml

}

echo "Creating Local Vendor Manifests"

rm -rfv .repo/local_manifests
mkdir .repo/local_manifests
curl https://raw.github.com/trevd/android_vendor_archos/master/a80sboard/manifests/archos-vendor.xml > .repo/local_manifests/archos-vendor.xml
                                                                                
echo "Syncing vendor/archos directory"
repo sync vendor/archos
symlink_local_manifests
echo "Running source build/envsetup.sh"
# Make sure we have build sync before trying
# to run anything
repo sync -j16
