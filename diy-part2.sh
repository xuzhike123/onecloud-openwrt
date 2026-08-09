#!/bin/bash

# 1. 替换 Golang 编译工具链为 23.x 兼容版本
rm -rf feeds/packages/lang/golang
git clone https://github.com/sbwml/packages_lang_golang -b 23.x feeds/packages/lang/golang

# 2. 彻底从源头删除 Python 语言环境包，防止被其他插件隐式依赖触发长达 1.5 小时的编译
rm -rf feeds/packages/lang/python

# 3. 清理 Lean 源码自带的旧版冲突 PassWall 及蓝牙包
rm -rf feeds/packages/utils/bluez
rm -rf package/lean/luci-app-passwall

# 4. 引入官方 PassWall 依赖包
git clone https://github.com/xiaorouji/openwrt-passwall-packages.git package/openwrt-passwall-packages

# 5. 修改默认后台 IP 为 192.168.10.99
sed -i 's/192.168.1.1/192.168.10.99/g' package/base-files/files/bin/config_generate
