# dnspod-shell-tcapi
[中文](./README_zh.md) | [English](./README.md)

On Android phones, use pure shell to dynamically update dnspod domain name records, turning the phone into a ddns client. This project depends on Tencent API 3.0.

## Description
1. Currently popular https://github.com/rehiy/dnspod-shell is found to not work on Android phone pixel3, and the phone will restart.
2. Tencent API 3.0 has provided a complete multi-language SDK for dnspod domain name service, supporting dynamic resolution and update of domain names, but choosing pure shell is to reduce dependency so that it can work properly in resource-constrained device environments, such as AOSP devices or some small embedded Linux devices.

## Usage
1. Refer to loop.sh and write your own call entry file. Note that you need to set the environment variable PATH and use an absolute path.
1. Edit the key file and configure your actual Tencent API secret. Refer to https://console.cloud.tencent.com/capi.
2. Refer to dnspod.sh and configure the domain name information you want to update.
```shell
. dnspodrec domain.com test A
. dnspodrec domain.com testv6 AAAA
```
3. You can implement real-time ddns domain name updates by calling ddns.sh regularly through cron or a scheduled script.

## Mobile phone related instructions
1. Due to the special permission restrictions and shell path of Android phones, the script needs to be called explicitly when calling, and the script uses an absolute path, such as: `/system/bin/sh ${PWD}/xxx/loop.sh`
2. Because the mobile phone uses openssl and curl in the directory of this project, it is necessary to set environment variables. Under PC linux, system tools are used, and the environment variable PATH does not need to be set:
```
export PATH=$PATH:xxx
```
3. Currently, the mainstream armv8a architecture of Android phones is supported. If other architectures are required, please compile curl and openssl yourself or leave a message

## Known bugs
xxd -r -p will have an alarm and signature failure when processing strings with 00 input

## Acknowledgements

Thanks to dnspod and Tencent: https://cloud.tencent.com/document/api/1427/56158