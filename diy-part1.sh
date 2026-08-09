#!/bin/bash

# 取消注释或清理原有的 passwall 软件源，防止重复
sed -i '/passwall/d' feeds.conf.default

# 重新追加 Clean 的 PassWall 软件源
echo 'src-git passwall_packages https://github.com/xiaorouji/openwrt-passwall-packages.git;main' >> feeds.conf.default
echo 'src-git passwall url?id=1xiaorouji/openwrt-passwall.git;main' >> feeds.conf.default
