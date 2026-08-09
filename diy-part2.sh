#!/bin/bash

# 1. 修改默认后台登录 IP 为 192.168.1.99
sed -i 's/192.168.1.1/192.168.1.99/g' package/base-files/files/bin/config_generate

# 2. 升级 Golang 编译工具链为 23.x 兼容版本（PassWall 必须）
rm -rf feeds/packages/lang/golang
git clone https://github.com/sbwml/packages_lang_golang.git -b 23.x feeds/packages/lang/golang

# 3. 清理主线 Lean 源码自带的旧版冲突包与蓝牙无用包
rm -rf package/lean/luci-app-passwall
rm -rf feeds/packages/utils/bluez

# 4. 直接拉取 Passwall 官方源码到 package 目录（无需修改 feeds.conf.default，绝对不会提示 Duplicate feed）
git clone https://github.com/xiaorouji/openwrt-passwall.git package/luci-app-passwall
