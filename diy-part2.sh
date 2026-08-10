#!/bin/bash

# 1. 修改默认后台登录 IP 为 192.168.10.99
sed -i 's/192.168.1.1/192.168.10.99/g' package/base-files/files/bin/config_generate

# 2. 清理 Lean 源码自带的冲突包及无用蓝牙模块
rm -rf package/lean/luci-app-passwall
rm -rf feeds/packages/utils/bluez
