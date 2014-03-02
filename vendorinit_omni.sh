
if [ ! -d .repo/local_manifests ] ; then 
	mkdir .repo/local_manifests
fi

echo "Creating Local Manifests for Archos device"

echo -e "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<manifest>\n" \
		"\t<remote name=\"trevd\" fetch=\"ssh://git@github.com/trevd\" />\n" \
		"\t<remote name=\"CyanogenMod\" fetch=\"git://github.com/CyanogenMod\" />\n" \
		"\t<remote name=\"linaro\" fetch=\"git://android.git.linaro.org\" />\n" \
		"\t<project path=\"vendor/archos\" name=\"android_vendor_archos\" remote=\"trevd\" revision=\"master\" />\n" \
		"\t<project path=\"vendor/google\" name=\"android_vendor_google\" remote=\"trevd\" revision=\"kitkat\" />\n" \
		"\t<project path=\"device/archos/a80sboard\" name=\"android_device_archos_a80sboard\" remote=\"trevd\" revision=\"master\" />\n" \
		"\t<remove-project name=\"android_hardware_ti_omap4xxx\" />\n" \
		"\t<remove-project name=\"platform/hardware/ti/wlan\"  />\n" \
		"\t<remove-project name=\"platform/hardware/ti/wpan\"  />\n</manifest>" > .repo/local_manifests/archos-omni.xml
                                                                         
repo sync vendor/archos
repo sync device/archos/a80sboard
echo "Running source build/envsetup.sh"
source build/envsetup.sh

if [ -f .repo/local_manifests/roomservice.xml ] ; then 
	rm .repo/local_manifests/roomservice.xml
fi

# Reset Modules to be patched
echo "Resetting Modules which will be patched"
cd system/extras ;  git reset --hard ; cd $ANDROID_BUILD_TOP
cd system/core ;  git reset --hard ; cd $ANDROID_BUILD_TOP
cd system/media ;  git reset --hard ; cd $ANDROID_BUILD_TOP
cd system/netd ;  git reset --hard ; cd $ANDROID_BUILD_TOP
cd system/security ;  git reset --hard ; cd $ANDROID_BUILD_TOP
cd system/vold ;  git reset --hard ; cd $ANDROID_BUILD_TOP
cd packages/inputmethods/hackerskeyboard  ;  git reset --hard ; cd $ANDROID_BUILD_TOP
cd packages/apps/Settings ;  git reset --hard ; cd $ANDROID_BUILD_TOP
cd frameworks/native ;  git reset --hard ; cd $ANDROID_BUILD_TOP
cd hardware/libhardware ;  git reset --hard ; cd $ANDROID_BUILD_TOP
cd hardware/libhardware_legacy ;  git reset --hard ; cd $ANDROID_BUILD_TOP
cd bionic ;  git reset --hard ; cd $ANDROID_BUILD_TOP
cd external/chromium_org ;  git reset --hard ; cd $ANDROID_BUILD_TOP
cd external/llvm ;  git reset --hard ; cd $ANDROID_BUILD_TOP


lunch omni_a80sboard-eng

read -e -p "Do you want to do a full repo sync?:[No]" answer
answer=`echo $answer | cut -c1 |   tr '[:upper:]' '[:lower:]'`
if [ "$answer" == "y" ] ; then 
	repo sync -j16 
fi 

# Apply Omni Patches 
echo "Patching Hackers Keyboard [ Removing Launcher Icon ]"
patch  --silent --forward --reject-file=- --strip=0 < vendor/archos/a80sboard/patches/hackerskeyboard.patch
echo "Patching Native Framework [ Surfaceflinger ]"
patch  --silent --forward --reject-file=- --strip=0 < vendor/archos/a80sboard/patches/frameworks_native_omni.patch
echo "Patching Libhardware [ Omap Enhanced Framebuffer ]"
patch  --silent --forward --reject-file=- --strip=0 < vendor/archos/a80sboard/patches/libhardware.patch
echo "Patching Settings Package [ Enable Koush's Embedded Superuser  ]"
patch  --silent --forward --reject-file=- --strip=0 < vendor/archos/a80sboard/patches/embedded_superuser_omni.patch
echo "Patching System Modules [ Enable Clang Building ]"
patch  --silent --forward --reject-file=- --strip=0 < vendor/archos/a80sboard/patches/clang_system_modules.patch
echo "Patching Hardware Modules [ Enable Clang Building ]"
patch  --silent --forward --reject-file=- --strip=0 < vendor/archos/a80sboard/patches/clang_hardware_modules.patch
echo "Patching Bionic Modules [ Enable Clang Building ]"
patch  --silent --forward --reject-file=- --strip=0 < vendor/archos/a80sboard/patches/clang_bionic_modules.patch
echo "Patching LLVM Modules [ Enable Clang Building ]"
patch  --silent --forward --reject-file=- --strip=0 < vendor/archos/a80sboard/patches/clang_llvm.patch
echo "Patching Chromium_org Modules [ Enable Clang Building ]"
patch  --silent --forward --reject-file=- --strip=0 < vendor/archos/a80sboard/patches/clang_chromium_org.patch

if [ -d system/extras/su ] ; then 
	echo "Removing Standard su binary"
	rm -rfv system/extras/su
fi

printconfig
