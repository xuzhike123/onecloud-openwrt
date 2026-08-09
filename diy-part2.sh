#!/bin/bash

# 1. 替换 Golang 编译工具链为兼容版本 (Passwall/Xray 编译必需)
rm -rf feeds/packages/lang/golang
git clone https://github.com/sbwml/packages_lang_golang -b 23.x feeds/packages/lang/golang

# 2. 清理主线 Lean 源码自带的旧版 passwall 冲突
rm -rf feeds/packages/utils/bluez
rm -rf package/lean/luci-app-passwall

# 3. 设置默认登录 IP 为 192.168.10.99
sed -i 's/192.168.1.1/192.168.1.99/g' package/base-files/files/bin/config_generate
