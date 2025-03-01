#!/bin/bash

#set -e

rm -rf .repo/local_manifests/ packages/apps/Aperture

repo init -u https://github.com/ProjectPixelage/android_manifest.git -b 15 --git-lfs

git clone --depth=1 https://github.com/sotodrom/local_manifests -b vic .repo/local_manifests

/opt/crave/resync.sh

. build/envsetup.sh
lunch pixelage_X00TD-ap4a-userdebug
export TZ=Asia/Jakarta
export PIXELAGE_BUILD=X00TD
make installclean
mka bacon
