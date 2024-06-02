crave run --no-patch -- "rm -rf .repo/local_manifests/
repo init -u https://github.com/alphadroid-project/manifest -b alpha-14 --git-lfs
git clone https://github.com/Kneba/local_manifests crdroid .repo/local_manifests
/opt/crave/resync.sh
git clone https://github.com/Tiktodz/vendor -b 14 vlp && cp -R vlp/* vendor/ && rm -rf vlp
. build/envsetup.sh
export ALPHA_MAINTAINER=Kneba
export TZ=Asia/Jakarta
lunch lineage_X00TD-ap1a-userdebug
make bacon"
