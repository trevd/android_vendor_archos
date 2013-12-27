echo "Removing Old Local Vendor Manifests"
rm .repo/local_manifests/archos-vendor.xml
rm .repo/local_manifests/archos-aosp.xml

echo "Creating Local Vendor Manifests"

rm .repo/local_manifests/archos-vendor.xml
rm .repo/local_manifests/archos-aosp.xml
mkdir .repo/local_manifests
curl https://raw.github.com/trevd/android_vendor_archos/master/a80sboard/manifests/archos-vendor.xml > .repo/local_manifests/archos-vendor.xml

echo "Syncing vendor/archos directory"
repo sync vendor/archos

echo "Running source build/envsetup.sh"
source build/envsetup.sh


	
	
	