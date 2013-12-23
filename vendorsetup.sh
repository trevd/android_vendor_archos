#!/bin/bash
#
# Patch the build system to show the file list
#
#

function check_remote_revision(){

	# AOSP MASTER
	echo $(tr '\n/' ' '  < .repo/manifest.xml | grep -o '<default.*' | cut -f1 -d'>' ) \
	| grep -E 'remote="aosp".*revision="master"|revision="master".*remote="aosp"' ;
	return $?


}

	if [  -z check_remote_revision ] ; then
		echo "Not on the AOSP Master Branch.... Skipping Archos setup"
	else	
	
		echo "Patching Chromium"
		patch -p1 --silent --forward --reject-file=- --strip=1 --directory=external/chromium_org < vendor/archos/a80sboard/patches/chromium.patch
		echo "Patching Native Framework"
		patch  --silent --forward --reject-file=- --strip=0 < vendor/archos/a80sboard/patches/frameworks_native.patch
		echo "Patching Libhardware Framework"
		patch  --silent --forward --reject-file=- --strip=0 < vendor/archos/a80sboard/patches/libhardware.patch
	
		
		VENDOR_MANIFEST="vendor/archos/a80sboard/manifests/archos-aosp.xml"
		REPO_MANIFEST=".repo/local_manifests/archos-aosp.xml"
		if [ $VENDOR_MANIFEST -nt  $REPO_MANIFEST ] ; then 
				cp $VENDOR_MANIFEST $REPO_MANIFEST
				echo "Local Manifest [ archos.xml ] Update... Resyncing"
				repo sync device/archos/a80sboard
				repo sync hardware/ti/domx
				repo sync hardware/ti/wpan
				repo sync hardware/ti/wlan
				repo sync hardware/ti/omap4xxx-archos
				repo sync packages/apps/CMFileManager
				repo sync vendor/archos
				repo sync vendor/ti/a80sboard
				repo sync vendor/imgtec/a80sboard
				repo sync external/busybox

		fi	
	fi
	
	
	
	
	