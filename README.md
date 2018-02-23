# 星际魔盒离线检测脚本

脚本实现设备在线检测，离线后，魔盒将自动重启

## 觉得脚本对你有用，欢迎打赏


**0x7D6C23b07E931bA39Bed2DBD885ca9c280946BD5**

## android版钱包。支持IMT

[https://www.token.soy][1]

### 功能

1. 网络离线检测
2. cpu检测


### 使用方法

1. 使用ssh登录星际魔盒,windows使用putty登录，linux或mac使用下面命令

```
ssh admin@IP地址

```
2. 执行下面命令下载脚本

```
sudo -s
//输入admin的密码切换root账户
wget https://raw.githubusercontent.com/WrBug/imtnasOnlineCheck/master/setup.sh -O setup.sh && sh setup.sh
```

等待安装完成即可



### 其他命令

```
// 重启定时任务
service cron restart

// 查看定时任务状态
service cron status

// 查看脚本实时运行状态(安装脚本一分钟后才能显示)
tail -f /usr/checkOnline/checkLog/log.out
```


[1]: https://www.token.soy
