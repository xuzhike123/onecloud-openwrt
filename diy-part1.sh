#!/bin/bash

# 1. 自动删除 feeds.conf.default 中可能存在的重复 passwall 行
sed -i '/passwall/d' feeds.conf.default

# 2. 重新追加干净的源定义
echo 'src-git passwall_packages https://github.com/xiaorouji/openwrt-passwall-packages.git;main' >> feeds.conf.default
echo 'src-git passwall https://github.com/xiaorouji/openwrt-passwall.git;main' >> feeds.conf.default
