# OpenWrt 自动化每日构建

[![OpenWrt Daily Build](https://github.com/suifei/openwrt-daily-build/actions/workflows/build-openwrt.yml/badge.svg)](https://github.com/suifei/openwrt-daily-build/actions/workflows/build-openwrt.yml)

本项目使用 GitHub Actions 自动化构建 OpenWrt 固件，支持多种设备配置。每日定时构建，确保获取最新的代码更新和安全修复。

## 支持的设备

- Xiaomi AX6S
- Xiaomi AX9000
- x86_64

## 快速开始

1. 点击 `Use this template` 按钮创建一个新的仓库。
2. 在新仓库的 `Settings` -> `Secrets` 中添加以下密钥：
   - `RELEASES_TOKEN`: 用于发布固件的 GitHub token。
3. 在新仓库的 `configs` 目录下添加你的设备配置文件，文件名格式为 `设备名.config`。
4. 在新仓库的 `.github/workflows/build-openwrt.yml` 文件中的 `matrix` 部分添加你的设备名和对应的 feeds 配置文件名。
5. 提交你的修改，GitHub Actions 将自动开始构建固件。

## 下载固件

固件可以在项目的 [Actions](https://github.com/suifei/openwrt-daily-build/actions) 页面中找到。每个设备对应一个 workflow run，可以在 run 详情页面的 Artifacts 部分下载对应的固件。

## 自定义

你可以通过修改 `configs` 目录下的设备配置文件来自定义固件功能。比如添加新的软件包、调整编译选项等。

如果你想添加新的设备，可以在 `configs` 目录下创建一个新的设备配置文件，然后在 `.github/workflows/build-openwrt.yml` 文件的 `matrix` 部分添加新设备的信息。

## 工作流说明

本仓库包含用于自动构建 OpenWrt 固件的 GitHub Actions 工作流:

1. `Build OpenWrt (Official)`: 构建 OpenWrt 官方版本
2. `Build OpenWrt (Full Components)`: 构建包含全部组件的 OpenWrt 版本

### Build OpenWrt (Official)

该工作流用于构建 OpenWrt 官方版本。它会执行以下步骤:

1. 检出仓库代码
2. 初始化构建环境
3. 下载 OpenWrt 源码
4. 复制编译配置文件
5. 更新软件源
6. 生成默认配置
7. 下载软件包
8. 编译固件
9. 检查空间使用情况
10. 上传编译产物

### Build OpenWrt (Full Components)

该工作流用于构建包含全部组件的 OpenWrt 版本。与官方版本相比,它额外添加了以下软件包:

- luci-app-alist: 支持多存储的文件列表程序
- luci-app-advanced: 系统高级设置
- luci-app-adguardhome: AdGuardHome 去广告
- luci-theme-atmaterial_new: Atmaterial 三合一主题
- luci-theme-argone: argone 主题
- luci-app-argone-config: argone 主题设置
- luci-app-aliddns: 阿里云 DDNS 插件
- luci-app-aliyundrive-webdav: 阿里云盘 WebDAV 服务
- luci-app-dnsfilter: 基于 DNS 的广告过滤
- luci-theme-design: design 主题
- luci-app-amlogic: 晶晨宝盒
- luci-app-eqos: 依 IP 地址限速
- luci-app-gost: 隐蔽的 HTTPS 代理
- luci-app-openclash: clash 的图形代理软件
- luci-app-passwall: passwall 代理软件
- luci-app-wechatpush: 微信/钉钉推送
- luci-theme-tomato: tomato 主题
- luci-app-smartdns: SmartDNS DNS防污染
- luci-app-ssr-plus: ssr-plus 代理软件
- luci-app-store: 应用商店
- luci-theme-mcat: mcat 主题
- luci-app-mosdns: DNS 国内外分流解析与广告过滤
- luci-app-unblockneteasemusic: 解锁网易云音乐
- luci-app-homeproxy: homeproxy 代理

除了添加额外的软件包,该工作流的其他步骤与官方版本相同。

## 注意事项

- 编译时间可能较长,请耐心等待
- 编译产物仅供学习交流使用,请勿用于商业用途
- 构建过程中可能会消耗大量的网络流量和存储空间,请确保有足够的资源

## 贡献

- https://openwrt.org/
- src-git kenzo https://github.com/kenzok8/openwrt-packages
- src-git small https://github.com/kenzok8/small

如果你有任何改进建议或者想要增加新的设备支持，欢迎提交 issue 或者 pull request。

## 联系方式
如果您在使用过程中遇到任何问题,或者有任何建议和反馈,欢迎通过以下方式联系我:

- 邮箱: c3VpZmUgQGdtYWlsIGRvdGNvbQ==
- QQ群: 555354813

---
Here's the English version of the README:

# OpenWrt Automated Daily Build

[![OpenWrt Daily Build](https://github.com/suifei/openwrt-daily-build/actions/workflows/build-openwrt.yml/badge.svg)](https://github.com/suifei/openwrt-daily-build/actions/workflows/build-openwrt.yml)

This project uses GitHub Actions to automate the building of OpenWrt firmware, supporting various device configurations. Daily scheduled builds ensure the latest code updates and security fixes are obtained.

## Supported Devices

- Xiaomi AX6S
- Xiaomi AX9000
- x86_64

## Quick Start

1. Click the `Use this template` button to create a new repository.
2. Add the following secrets in the `Settings` -> `Secrets` of the new repository:
   - `RELEASES_TOKEN`: GitHub token for publishing firmware.
3. Add your device configuration files in the `configs` directory of the new repository, with file names in the format of `device_name.config`.
4. Add your device name and corresponding feeds configuration file name in the `matrix` section of `.github/workflows/build-openwrt.yml`.
5. Commit your changes, and GitHub Actions will automatically start building the firmware.

## Download Firmware

Firmware can be found on the [Actions](https://github.com/suifei/openwrt-daily-build/actions) page of the project. Each device corresponds to a workflow run, and the corresponding firmware can be downloaded in the Artifacts section on the run details page.

## Customization

You can customize firmware features by modifying the device configuration files in the `configs` directory. For example, adding new packages, adjusting compile options, etc.

If you want to add support for new devices, you can create a new device configuration file in the `configs` directory and add the new device information in the `matrix` section of `.github/workflows/build-openwrt.yml`.

## Workflow Description

This repository contains GitHub Actions workflows for automatically building OpenWrt firmware:

1. `Build OpenWrt (Official)`: Build the official version of OpenWrt
2. `Build OpenWrt (Full Components)`: Build OpenWrt version with full components

### Build OpenWrt (Official)

This workflow is used to build the official version of OpenWrt. It performs the following steps:

1. Checkout repository code
2. Initialize build environment
3. Download OpenWrt source code
4. Copy compile configuration files
5. Update package sources
6. Generate default configuration
7. Download packages
8. Compile firmware
9. Check space usage
10. Upload build artifacts

### Build OpenWrt (Full Components)

This workflow is used to build OpenWrt version with full components. Compared to the official version, it additionally includes the following packages:

- luci-app-alist: File list program supporting multiple storage
- luci-app-advanced: System advanced settings
- luci-app-adguardhome: AdGuardHome ad blocking
- luci-theme-atmaterial_new: Atmaterial 3-in-1 theme
- luci-theme-argone: argone theme
- luci-app-argone-config: argone theme settings
- luci-app-aliddns: Aliyun DDNS plugin
- luci-app-aliyundrive-webdav: Aliyun Drive WebDAV service
- luci-app-dnsfilter: DNS-based ad filtering
- luci-theme-design: design theme
- luci-app-amlogic: Amlogic box
- luci-app-eqos: IP address-based speed limit
- luci-app-gost: Hidden HTTPS proxy
- luci-app-openclash: clash graphical proxy software
- luci-app-passwall: passwall proxy software
- luci-app-wechatpush: WeChat/DingTalk push
- luci-theme-tomato: tomato theme
- luci-app-smartdns: SmartDNS DNS anti-pollution
- luci-app-ssr-plus: ssr-plus proxy software
- luci-app-store: App store
- luci-theme-mcat: mcat theme
- luci-app-mosdns: DNS domestic and international resolution and ad filtering
- luci-app-unblockneteasemusic: Unblock NetEase Cloud Music
- luci-app-homeproxy: homeproxy proxy

Except for adding extra packages, other steps of this workflow are the same as the official version.

## Notes

- Build time may be long, please be patient
- Build artifacts are for learning and communication purposes only, not for commercial use
- The build process may consume a large amount of network traffic and storage space, please ensure sufficient resources

## Contribution

- https://openwrt.org/
- src-git kenzo https://github.com/kenzok8/openwrt-packages
- src-git small https://github.com/kenzok8/small

If you have any suggestions for improvement or want to add support for new devices, feel free to submit an issue or pull request.

## Contact

If you encounter any problems during use, or have any suggestions and feedback, please feel free to contact me through the following methods:

- Email: c3VpZmUgQGdtYWlsIGRvdGNvbQ==
- QQ group: 555354813