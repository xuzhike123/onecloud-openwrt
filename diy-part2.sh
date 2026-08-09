#!/bin/bash

# 1. 修改默认 IP
sed -i 's/192.168.1.1/192.168.10.99/g' package/base-files/files/bin/config_generate

# 2. 移除旧的依赖/冲突包
rm -rf feeds/packages/lang/golang
git clone https://github.com/sbwml/packages_lang_golang -b 23.x feeds/packages/lang/golang

rm -rf package/lean/luci-app-passwall

# 3. 重新克隆 PassWall 及其依赖包
git clone https://github.com/xiaorouji/openwrt-passwall-packages.git package/openwrt-passwall-packages
git clone https://github.com/xiaorouji/openwrt-passwall.git package/luci-app-passwall
