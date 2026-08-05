#!/bin/bash

# 1. 替换为兼容 PassWall 和 Sing-box 的 Golang 23.x 编译环境
rm -rf feeds/packages/lang/golang
git clone https://github.com/sbwml/packages_lang_golang -b 23.x feeds/packages/lang/golang

# 2. 清理容易报错且玩客云不需要的蓝牙 (bluez) 源码包
rm -rf feeds/packages/utils/bluez
rm -rf package/lean/luci-app-passwall
