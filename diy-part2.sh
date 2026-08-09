#!/bin/bash

# 1. 修改默认登录后台 IP 为 192.168.10.99
sed -i 's/192.168.1.1/192.168.10.99/g' package/base-files/files/bin/config_generate

# 2. 升级 Golang 编译工具链为兼容版本
rm -rf feeds/packages/lang/golang
git clone https://github.com/sbwml/packages_lang_golang -b 23.x feeds/packages/lang/golang

# 3. 清理 Lean 源码自带的旧版 passwall 冲突
rm -rf package/lean/luci-app-passwall
rm -rf feeds/packages/utils/bluez

# 4. 直接拉取 Passwall 完整源码包到 package 目录（无需追加 feeds.conf.default）
git clone https://github.com/xiaorouji/openwrt-passwall-packages.git package/openwrt-passwall-packages
git clone https://github.com/xiaorouji/openwrt-passwall.git package/luci-app-passwall
