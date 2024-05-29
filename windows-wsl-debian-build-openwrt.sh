# Windows WSL Debian

# Update apt source

cat > sources.list <<EOF
# 默认注释了源码镜像以提高 apt update 速度，如有需要可自行取消注释
deb https://mirrors.tuna.tsinghua.edu.cn/debian/ bookworm main contrib non-free non-free-firmware
# deb-src https://mirrors.tuna.tsinghua.edu.cn/debian/ bookworm main contrib non-free non-free-firmware

deb https://mirrors.tuna.tsinghua.edu.cn/debian/ bookworm-updates main contrib non-free non-free-firmware
# deb-src https://mirrors.tuna.tsinghua.edu.cn/debian/ bookworm-updates main contrib non-free non-free-firmware

deb https://mirrors.tuna.tsinghua.edu.cn/debian/ bookworm-backports main contrib non-free non-free-firmware
# deb-src https://mirrors.tuna.tsinghua.edu.cn/debian/ bookworm-backports main contrib non-free non-free-firmware

# 以下安全更新软件源包含了官方源与镜像站配置，如有需要可自行修改注释切换
deb https://security.debian.org/debian-security bookworm-security main contrib non-free non-free-firmware
# deb-src https://security.debian.org/debian-security bookworm-security main contrib non-free non-free-firmware
EOF
# 比较新生成的 sources.list 与 /etc/apt/sources.list 的内容
# 如果内容不同,则备份原文件并复制新文件
if ! diff sources.list /etc/apt/sources.list >/dev/null 2>&1; then
  sudo cp /etc/apt/sources.list /etc/apt/sources.list.backup
  sudo cp -rf ./sources.list /etc/apt
fi
# Install build essential
sudo apt update

sudo apt install -y build-essential asciidoc binutils bzip2 gawk gettext git libncurses5-dev libz-dev patch python3 unzip zlib1g-dev lib32gcc-s1 libc6-dev-i386 subversion flex uglifyjs git-core gcc-multilib p7zip p7zip-full msmtp libssl-dev texinfo libglib2.0-dev xmlto qemu-utils upx libelf-dev autoconf automake libtool autopoint device-tree-compiler g++-multilib antlr3 gperf wget rsync curl screen python2

sudo -E apt-get -y autoremove --purge
df -h


# Git clone sources

git clone https://github.com/openwrt/openwrt.git
cd openwrt

# Cleanup folders


# Update feeds
cat > feeds.conf.default <<EOF
src-git packages https://git.openwrt.org/feed/packages.git^063b2393c
src-git luci https://git.openwrt.org/project/luci.git^b07cf9dcfc
src-git routing https://git.openwrt.org/feed/routing.git^6487539 
src-git telephony https://git.openwrt.org/feed/telephony.git^86af194
EOF

./scripts/feeds update -a
./scripts/feeds install -a
./scripts/feeds install -a

# Generate configuration file
make menuconfig

# mediatek mt7622b for Xiaomi AX6S

cat > ./env/.config <<EOF
CONFIG_TARGET_mediatek=y
CONFIG_TARGET_mediatek_mt7622=y
CONFIG_TARGET_MULTI_PROFILE=y
CONFIG_TARGET_DEVICE_mediatek_mt7622_DEVICE_bananapi_bpi-r64=y
CONFIG_TARGET_DEVICE_PACKAGES_mediatek_mt7622_DEVICE_bananapi_bpi-r64=""
CONFIG_TARGET_DEVICE_mediatek_mt7622_DEVICE_linksys_e8450=y
CONFIG_TARGET_DEVICE_PACKAGES_mediatek_mt7622_DEVICE_linksys_e8450=""
CONFIG_TARGET_DEVICE_mediatek_mt7622_DEVICE_linksys_e8450-ubi=y
CONFIG_TARGET_DEVICE_PACKAGES_mediatek_mt7622_DEVICE_linksys_e8450-ubi=""
CONFIG_TARGET_DEVICE_mediatek_mt7622_DEVICE_buffalo_wsr-2533dhp2=y
CONFIG_TARGET_DEVICE_PACKAGES_mediatek_mt7622_DEVICE_buffalo_wsr-2533dhp2=""
CONFIG_TARGET_DEVICE_mediatek_mt7622_DEVICE_buffalo_wsr-3200ax4s=y
CONFIG_TARGET_DEVICE_PACKAGES_mediatek_mt7622_DEVICE_buffalo_wsr-3200ax4s=""
CONFIG_TARGET_DEVICE_mediatek_mt7622_DEVICE_dlink_eagle-pro-ai-m32-a1=y
CONFIG_TARGET_DEVICE_PACKAGES_mediatek_mt7622_DEVICE_dlink_eagle-pro-ai-m32-a1=""
CONFIG_TARGET_DEVICE_mediatek_mt7622_DEVICE_elecom_wrc-2533gent=y
CONFIG_TARGET_DEVICE_PACKAGES_mediatek_mt7622_DEVICE_elecom_wrc-2533gent=""
CONFIG_TARGET_DEVICE_mediatek_mt7622_DEVICE_elecom_wrc-x3200gst3=y
CONFIG_TARGET_DEVICE_PACKAGES_mediatek_mt7622_DEVICE_elecom_wrc-x3200gst3=""
CONFIG_TARGET_DEVICE_mediatek_mt7622_DEVICE_mediatek_mt7622-rfb1=y
CONFIG_TARGET_DEVICE_PACKAGES_mediatek_mt7622_DEVICE_mediatek_mt7622-rfb1=""
CONFIG_TARGET_DEVICE_mediatek_mt7622_DEVICE_mediatek_mt7622-rfb1-ubi=y
CONFIG_TARGET_DEVICE_PACKAGES_mediatek_mt7622_DEVICE_mediatek_mt7622-rfb1-ubi=""
CONFIG_TARGET_DEVICE_mediatek_mt7622_DEVICE_netgear_wax206=y
CONFIG_TARGET_DEVICE_PACKAGES_mediatek_mt7622_DEVICE_netgear_wax206=""
CONFIG_TARGET_DEVICE_mediatek_mt7622_DEVICE_reyee_ax3200-e5=y
CONFIG_TARGET_DEVICE_PACKAGES_mediatek_mt7622_DEVICE_reyee_ax3200-e5=""
CONFIG_TARGET_DEVICE_mediatek_mt7622_DEVICE_ruijie_rg-ew3200gx-pro=y
CONFIG_TARGET_DEVICE_PACKAGES_mediatek_mt7622_DEVICE_ruijie_rg-ew3200gx-pro=""
CONFIG_TARGET_DEVICE_mediatek_mt7622_DEVICE_totolink_a8000ru=y
CONFIG_TARGET_DEVICE_PACKAGES_mediatek_mt7622_DEVICE_totolink_a8000ru=""
CONFIG_TARGET_DEVICE_mediatek_mt7622_DEVICE_ubnt_unifi-6-lr-v1=y
CONFIG_TARGET_DEVICE_PACKAGES_mediatek_mt7622_DEVICE_ubnt_unifi-6-lr-v1=""
CONFIG_TARGET_DEVICE_mediatek_mt7622_DEVICE_ubnt_unifi-6-lr-v1-ubootmod=y
CONFIG_TARGET_DEVICE_PACKAGES_mediatek_mt7622_DEVICE_ubnt_unifi-6-lr-v1-ubootmod=""
CONFIG_TARGET_DEVICE_mediatek_mt7622_DEVICE_ubnt_unifi-6-lr-v2=y
CONFIG_TARGET_DEVICE_PACKAGES_mediatek_mt7622_DEVICE_ubnt_unifi-6-lr-v2=""
CONFIG_TARGET_DEVICE_mediatek_mt7622_DEVICE_ubnt_unifi-6-lr-v2-ubootmod=y
CONFIG_TARGET_DEVICE_PACKAGES_mediatek_mt7622_DEVICE_ubnt_unifi-6-lr-v2-ubootmod=""
CONFIG_TARGET_DEVICE_mediatek_mt7622_DEVICE_ubnt_unifi-6-lr-v3=y
CONFIG_TARGET_DEVICE_PACKAGES_mediatek_mt7622_DEVICE_ubnt_unifi-6-lr-v3=""
CONFIG_TARGET_DEVICE_mediatek_mt7622_DEVICE_ubnt_unifi-6-lr-v3-ubootmod=y
CONFIG_TARGET_DEVICE_PACKAGES_mediatek_mt7622_DEVICE_ubnt_unifi-6-lr-v3-ubootmod=""
CONFIG_TARGET_DEVICE_mediatek_mt7622_DEVICE_xiaomi_redmi-router-ax6s=y
CONFIG_TARGET_DEVICE_PACKAGES_mediatek_mt7622_DEVICE_xiaomi_redmi-router-ax6s=""
CONFIG_ALL_KMODS=y
CONFIG_ALL_NONSHARED=y
CONFIG_DEVEL=y
CONFIG_TARGET_PER_DEVICE_ROOTFS=y
CONFIG_AUTOREMOVE=y
CONFIG_BPF_TOOLCHAIN_BUILD_LLVM=y
# CONFIG_BPF_TOOLCHAIN_NONE is not set
CONFIG_BUILDBOT=y
CONFIG_COLLECT_KERNEL_DEBUG=y
CONFIG_HAS_BPF_TOOLCHAIN=y
CONFIG_IB=y
CONFIG_IMAGEOPT=y
CONFIG_JSON_CYCLONEDX_SBOM=y
CONFIG_KERNEL_BUILD_DOMAIN="buildhost"
CONFIG_KERNEL_BUILD_USER="builder"
# CONFIG_KERNEL_KALLSYMS is not set
CONFIG_MAKE_TOOLCHAIN=y
CONFIG_PACKAGE_cgi-io=y
CONFIG_PACKAGE_libbpf=m
CONFIG_PACKAGE_libelf=m
CONFIG_PACKAGE_liblucihttp=y
CONFIG_PACKAGE_liblucihttp-ucode=y
CONFIG_PACKAGE_libpcap=m
CONFIG_PACKAGE_libxdp=m
CONFIG_PACKAGE_luci=y
CONFIG_PACKAGE_luci-app-firewall=y
CONFIG_PACKAGE_luci-app-opkg=y
CONFIG_PACKAGE_luci-base=y
CONFIG_PACKAGE_luci-light=y
CONFIG_PACKAGE_luci-mod-admin-full=y
CONFIG_PACKAGE_luci-mod-network=y
CONFIG_PACKAGE_luci-mod-status=y
CONFIG_PACKAGE_luci-mod-system=y
CONFIG_PACKAGE_luci-proto-ipv6=y
CONFIG_PACKAGE_luci-proto-ppp=y
CONFIG_PACKAGE_luci-ssl=y
CONFIG_PACKAGE_luci-theme-bootstrap=y
CONFIG_PACKAGE_px5g-mbedtls=y
CONFIG_PACKAGE_qosify=m
CONFIG_PACKAGE_rpcd=y
CONFIG_PACKAGE_rpcd-mod-file=y
CONFIG_PACKAGE_rpcd-mod-iwinfo=y
CONFIG_PACKAGE_rpcd-mod-luci=y
CONFIG_PACKAGE_rpcd-mod-rrdns=y
CONFIG_PACKAGE_rpcd-mod-ucode=y
CONFIG_PACKAGE_tc-tiny=m
CONFIG_PACKAGE_ucode-mod-html=y
CONFIG_PACKAGE_ucode-mod-math=y
CONFIG_PACKAGE_uhttpd=y
CONFIG_PACKAGE_uhttpd-mod-ubus=y
CONFIG_PACKAGE_xdp-filter=m
CONFIG_PACKAGE_xdp-loader=m
CONFIG_PACKAGE_xdpdump=m
CONFIG_PACKAGE_zlib=m
CONFIG_REPRODUCIBLE_DEBUG_INFO=y
CONFIG_SDK=y
CONFIG_SDK_LLVM_BPF=y
CONFIG_TARGET_ALL_PROFILES=y
CONFIG_USE_LLVM_BUILD=y
CONFIG_VERSIONOPT=y
CONFIG_VERSION_BUG_URL=""
CONFIG_VERSION_CODE=""
CONFIG_VERSION_DIST="OpenWrt"
CONFIG_VERSION_FILENAMES=y
CONFIG_VERSION_HOME_URL=""
CONFIG_VERSION_HWREV=""
CONFIG_VERSION_MANUFACTURER=""
CONFIG_VERSION_MANUFACTURER_URL=""
CONFIG_VERSION_NUMBER=""
CONFIG_VERSION_PRODUCT=""
CONFIG_VERSION_REPO="https://downloads.openwrt.org/releases/23.05.3"
CONFIG_VERSION_SUPPORT_URL=""
EOF

cat ./.config

# Modify default IP
sed -i 's/192.168.1.1/192.168.31.1/g' package/base-files/files/bin/config_generate

make defconfig

# Make download
make download -j36
rm -rf $(find ./dl/ -size -1024c)
df -h

# Compile firmware
make -j36 || make -j1 V=sc
# make[3] -C package/system/rpcd compile

echo "======================="
echo "Space usage:"
echo "======================="
df -h
echo "======================="
du -h ./ --max-depth=1
du -h ~/openwrt/ --max-depth=1 || true

# Prepare artifact
mkdir -p ./artifact/firmware
mkdir -p ./artifact/package
mkdir -p ./artifact/buildinfo
rm -rf $(find ./bin/targets/ -type d -name "packages")
cp -rf $(find ./bin/targets/ -type f) ./artifact/firmware/
cp -rf $(find ./bin/packages/ -type f -name "*.ipk") ./artifact/package/
cp -rf $(find ./bin/targets/ -type f -name "*.buildinfo" -o -name "*.manifest") ./artifact/buildinfo/

# Deliver buildinfo
ls ./artifact/buildinfo/

# Deliver package
ls ./artifact/package/

# Deliver firmware
ls ./bin/targets/

# Upload release asset
ls ./artifact/firmware/*