#!/bin/bash

# 1. 替换 Golang 编译工具链为 23.x 兼容版本 (Passwall 必须)
rm -rf feeds/packages/lang/golang
git clone https://github.com/sbwml/packages_lang_golang -b 23.x feeds/packages/lang/golang

# 2. 清理容易报错及冲突的源码包
rm -rf feeds/packages/lang/python
rm -rf feeds/packages/utils/bluez
rm -rf package/lean/luci-app-passwall

# 3. 直接 Clone 适配 Lean 源码的最新 PassWall 及依赖包
git clone https://github.com/xiaorouji/openwrt-passwall-packages.git package/passwall_packages
git clone https://github.com/xiaorouji/openwrt-passwall.git package/luci-app-passwall

# 4. 修改默认后台登录 IP 为 192.168.1.99
sed -i 's/192.168.1.1/192.168.1.99/g' package/base-files/files/bin/config_generate
