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
function copy_manifests(){

	cp -rvp vendor/archos/a80sboard/manifests/*.xml .repo/local_manifests/

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
		echo "Patching System Core"
		patch  --silent --forward --reject-file=- --strip=0 < vendor/archos/a80sboard/patches/system_core.patch
		echo "Patching Hackers Keyboard"
		patch  --silent --forward --reject-file=- --strip=0 < vendor/archos/a80sboard/patches/hackerskeyboard.patch
		
		copy_manifests
		rm -rf system/extra/su
	fi
	
	
	
	
	