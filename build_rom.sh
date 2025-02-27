#!/bin/bash

#set -e

cyan='\033[0;36m'
blue='\033[0;34m'
nocol='\033[0m'

echo -e "$cyan***********************************************"
echo -e "           BUILDING ROM from Devspaces CLI     "
echo -e "**********************************************$nocol"

rm -rf .repo/manifests
repo init -u https://github.com/ProjectPixelage/android_manifest.git -b 15 --git-lfs
git clone --depth=1 https://github.com/sotodrom/local_manifests -b vic .repo/local_manifests
/opt/crave/resync.sh
source build/envsetup.sh
lunch pixelage_X00TD-ap4a-userdebug
export TZ=Asia/Jakarta
export PIXELAGE_BUILD=X00TD
make installclean
mka bacon
