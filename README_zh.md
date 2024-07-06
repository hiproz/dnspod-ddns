# dnspod-shell-tcapi
[中文](./README_zh.md) | [English](./README.md)

在安卓手机上，通过纯shell方式实现dnspod域名记录的动态更新，将手机变成ddns客户端，此项目依赖腾讯api3.0。

## 说明
1. 目前比较流行的https://github.com/rehiy/dnspod-shell ，发现在安卓手机pixel3中跑不起来，手机会重启。
2. 腾讯api3.0对dnspod域名服务已经提供完整的多语言sdk，支持对域名的动态解析更新，但是选择纯shell是为了减少依赖，以便在资源受限的设备环境下也能正常工作，比如AOSP设备或者一些小的嵌入式linux设备。

## 使用
1. 参考loop.sh，编写自己的调用入口文件，注意要设置环境变量PATH，使用绝对路径。
1. 编辑key文件，配置自己的实际腾讯api secret，参考https://console.cloud.tencent.com/capi。
2. 参考dnspod.sh，配置自己要更新的域名信息。
```shell
. dnspodrec domain.com test A
. dnspodrec domain.com testv6 AAAA
```
3. 通过cron或者定时脚本来定时调用 ddns.sh就可以实现实时ddns 域名更新了。

## 手机相关说明
1. 因为安卓手机特殊的权限限制和shell路径，脚本调用时，需要显式调用，并且脚本使用绝对路径，比如：`/system/bin/sh ${PWD}/xxx/loop.sh`
2. 因为手机使用的是本工程目录下的openssl,curl，所以需要设置环境变量，PC linux下使用的是系统工具，可以不用设置环境变量PATH：
```
export PATH=$PATH:xxx
```
3. 目前支持的是安卓手机主流的armv8a架构，如果需要其他架构支持，请自行编译curl和openssl或者留言

## 已知bug
xxd -r -p对处理有00输入的字符串时，会有告警和签名失败

## 致谢

感谢dnspod和腾讯：https://cloud.tencent.com/document/api/1427/56158

