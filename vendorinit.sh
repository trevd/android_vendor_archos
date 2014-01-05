echo "Creating Local Vendor Manifests"

rm -rfv .repo/local_manifests
mkdir .repo/local_manifests
curl https://raw.github.com/trevd/android_vendor_archos/master/a80sboard/manifests/archos-vendor.xml > .repo/local_manifests/archos-vendor.xml

echo "Syncing vendor/archos directory"
repo sync vendor/archos
echo "Running source build/envsetup.sh"
# Make sure we have build sync before trying
# to run anything
repo sync build
symlink_local_manifests
repo sync -j16
source build/envsetup.sh




	
	
