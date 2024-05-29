# OpenWrt 自动化每日构建

[![OpenWrt Daily Build](https://github.com/suifei/openwrt-daily-build/actions/workflows/build-openwrt.yml/badge.svg)](https://github.com/suifei/openwrt-daily-build/actions/workflows/build-openwrt.yml)

本项目使用 GitHub Actions 自动化构建 OpenWrt 固件，支持多种设备配置。每日定时构建，确保获取最新的代码更新和安全修复。

## 支持的设备

- Xiaomi AX6S
- ...

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

## 贡献

如果你有任何改进建议或者想要增加新的设备支持，欢迎提交 issue 或者 pull request。

---
english version

# OpenWrt Automatic Daily Build

[![OpenWrt Daily Build](https://github.com/suifei/openwrt-daily-build/actions/workflows/build-openwrt.yml/badge.svg)](https://github.com/suifei/openwrt-daily-build/actions/workflows/build-openwrt.yml)

This project uses GitHub Actions to automatically build OpenWrt firmware on a daily basis, supporting multiple device configurations. Daily scheduled builds ensure the latest code updates and security fixes are included.

## Supported Devices

- Xiaomi AX6S
- ...

## Quick Start

1. Click the `Use this template` button to create a new repository.
2. Add the following secrets in the `Settings` -> `Secrets` page of your new repository:
   - `RELEASES_TOKEN`: GitHub token for releasing firmware.
3. Add your device configuration files in the `configs` directory of your new repository, with the file name format `device_name.config`.
4. Add your device name and corresponding feeds config file name in the `matrix` section of the `.github/workflows/build-openwrt.yml` file in your new repository.
5. Commit your changes, and GitHub Actions will automatically start building the firmware.

## Downloading Firmware

Firmware can be found on the [Actions](https://github.com/suifei/openwrt-daily-build/actions) page of the project. Each device corresponds to a workflow run, and the corresponding firmware can be downloaded in the Artifacts section of the run details page.

## Customization

You can customize the firmware features by modifying the device configuration files in the `configs` directory. For example, adding new packages, adjusting compile options, etc.

If you want to add a new device, you can create a new device configuration file in the `configs` directory, and then add the new device information in the `matrix` section of the `.github/workflows/build-openwrt.yml` file.

## Contributing

If you have any suggestions for improvements or want to add support for new devices, please feel free to submit an issue or pull request.