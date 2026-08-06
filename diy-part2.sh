#!/bin/bash

# 1. 彻底替换为兼容新版 PassWall / Sing-box 的 Golang 23.x 编译环境
rm -rf feeds/packages/lang/golang
git clone https://github.com/sbwml/packages_lang_golang -b 23.x feeds/packages/lang/golang

# 2. 清理主线源码中重名且导致死循环冲突的 PassWall 软件包
rm -rf package/lean/luci-app-passwall
rm -rf feeds/packages/utils/bluez

# 3. 修复基础网络配置文件
sed -i 's/192.168.1.168/192.168.1.168/g' package/base-files/files/bin/config_generate
