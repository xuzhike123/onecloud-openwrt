#!/bin/bash

# 1. 修改默认后台登录 IP 为 192.168.1.99
sed -i 's/192.168.1.1/192.168.1.99/g' package/base-files/files/bin/config_generate

# 2. 清理 Lean 源码自带的冲突/旧版软件包
rm -rf package/lean/luci-app-passwall
rm -rf feeds/packages/utils/bluez

# 3. 升级 Golang 工具链为稳定版 (SSR-Plus 核心依赖)
rm -rf feeds/packages/lang/golang
git clone url?id=1sbwml/packages_lang_golang.git -b 23.x feeds/packages/lang/golang
