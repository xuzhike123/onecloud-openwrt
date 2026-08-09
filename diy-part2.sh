#!/bin/bash

# 1. 修改默认后台登录 IP 为 192.168.10.99
sed -i 's/192.168.1.1/192.168.10.99/g' package/base-files/files/bin/config_generate

# 2. 清理 Lean 源码自带的旧版 PassWall 及冲突蓝牙模块
rm -rf package/lean/luci-app-passwall
rm -rf feeds/packages/utils/bluez

# 3. 替换 Golang 编译工具链为兼容版本 (SSR-Plus 编译必需)
rm -rf feeds/packages/lang/golang
git clone https://github.com/sbwml/packages_lang_golang.git -b 23.x feeds/packages/lang/golang
