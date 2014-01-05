echo "Removing Old Local Vendor Manifests"

rm .repo/local_manifests/archos-vendor.xml
rm .repo/local_manifests/archos-aosp.xml
rm .repo/local_manifests/cyanogenmod.xml
rm .repo/local_manifests/linaro.xml


echo "Creating Local Vendor Manifests"

mkdir .repo/local_manifests
curl https://raw.github.com/trevd/android_vendor_archos/master/a80sboard/manifests/archos-vendor.xml > .repo/local_manifests/archos-vendor.xml

echo "Syncing vendor/archos directory"
repo sync vendor/archos

echo "Syncing vendor/archos directory"
cp -rvp vendor/archos/a80sboard/manifests/*.xml .repo/local_manifests/

repo sync

echo "Running source build/envsetup.sh"
source build/envsetup.sh


	
	
	