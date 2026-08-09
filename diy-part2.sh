#!/bin/bash

# 1. 修改默认后台登录 IP 为 192.168.1.99
sed -i 's/192.168.1.1/192.168.1.99/g' package/base-files/files/bin/config_generate

# 2. 升级 Golang 编译工具链为 23.x 兼容版本（PassWall 编译必需）
rm -rf feeds/packages/lang/golang
git clone https://github.com/sbwml/packages_lang_golang -b 23.x feeds/packages/lang/golang

# 3. 清理主线 Lean 源码自带的旧版冲突包与蓝牙无用包
rm -rf package/lean/luci-app-passwall
rm -rf feeds/packages/utils/bluez

# 4. 使用公有可访问的 PassWall 官方地址（添加 .git 后缀防止鉴权误判）
git clone https://github.com/xiaorouji/openwrt-passwall-packages.git package/openwrt-passwall-packages
git clone https://github.com/xiaorouji/openwrt-passwall.git package/luci-app-passwall
