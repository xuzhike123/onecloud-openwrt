#!/bin/bash
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#
# Copyright (c) 2019-2024 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#

# Modify default IP
sed -i 's/192.168.1.1/192.168.10.99/g' package/base-files/files/bin/config_generate

# Modify default theme
#sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci/Makefile

# Modify hostname
sed -i 's/LEDE/OneCloud/g' package/base-files/files/bin/config_generate

# 替换终端为bash
sed -i 's/\/bin\/ash/\/bin\/bash/' package/base-files/files/etc/passwd
# 替换为最新且兼容的 Golang 编译环境，修复 PassWall/Sing-Box 编译失败
rm -rf feeds/packages/lang/golang
git clone https://github.com/sbwml/packages_lang_golang -b 23.x feeds/packages/lang/golang

# 修改默认 IP (可选，默认 192.168.1.1)
# sed -i 's/192.168.1.168/192.168.2.168/g' package/base-files/files/bin/config_generate
# 取消勾选庞大且无用的蓝牙及重载组件，大幅加快编译速度并防止超时
sed -i 's/CONFIG_PACKAGE_bluez-libs=y/# CONFIG_PACKAGE_bluez-libs is not set/' .config
sed -i 's/CONFIG_PACKAGE_bluez-utils=y/# CONFIG_PACKAGE_bluez-utils is not set/' .config

# 1. 替换为兼容 FanchmWrt/PassWall 的最新 Golang 编译工具链
rm -rf feeds/packages/lang/golang
git clone https://github.com/sbwml/packages_lang_golang -b 23.x feeds/packages/lang/golang

# 2. 清除容易报错的 geoview 重构包（Passwall 会自动使用 v2dat 代替）
rm -rf feeds/passwall_packages/geoview
