#!/bin/bash

# 1. 替换 Golang 编译工具链为 23.x 兼容版本
rm -rf feeds/packages/lang/golang
git clone https://github.com/sbwml/packages_lang_golang -b 23.x feeds/packages/lang/golang

# 2. 彻底移除 Python 与 蓝牙等耗时且易报错的组件
rm -rf feeds/packages/lang/python
rm -rf feeds/packages/utils/bluez
rm -rf package/lean/luci-app-passwall

# 3. 添加 xiaorouji 的 Passwall 专属软件源（自动完备依赖链）
echo "src-git passwall_packages https://github.com/xiaorouji/openwrt-passwall-packages.git;main" >> feeds.conf.default
echo "src-git passwall https://github.com/xiaorouji/openwrt-passwall.git;main" >> feeds.conf.default

# 4. 修改默认后台 IP 为 192.168.10.99
sed -i 's/192.168.1.1/192.168.10.99/g' package/base-files/files/bin/config_generate
