#!/bin/bash

# 1. 替换 Golang 编译工具链为兼容版本
rm -rf feeds/packages/lang/golang
git clone https://github.com/sbwml/packages_lang_golang -b 23.x feeds/packages/lang/golang

# 2. 删除玩客云极易引发 GCC 13/14 编译崩溃的蓝牙相关无用软件包
rm -rf feeds/packages/utils/bluez
rm -rf package/lean/luci-app-passwall

# 3. 修复基础配置文件生成权限
sed -i 's/192.168.1.1/192.168.1.1/g' package/base-files/files/bin/config_generate
