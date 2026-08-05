#!/bin/bash

# 1. 替换 Golang 编译工具链为兼容版本 (解决 PassWall 及其依赖的 Golang 编译死锁)
rm -rf feeds/packages/lang/golang
git clone https://github.com/sbwml/packages_lang_golang -b 23.x feeds/packages/lang/golang

# 2. 安全清理冲突的 geoview（若存在）
if [ -d "feeds/passwall_packages/geoview" ]; then
    rm -rf feeds/passwall_packages/geoview
fi
# 强制更新 passwall_packages 依赖包仓库
rm -rf feeds/passwall_packages
git clone https://github.com/xiaorouji/openwrt-passwall-packages.git package/passwall_packages
