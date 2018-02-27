# 星际魔盒离线检测脚本

脚本实现设备在线检测，离线后，魔盒将自动重启

## 觉得脚本对你有用，欢迎打赏


**0x7D6C23b07E931bA39Bed2DBD885ca9c280946BD5**

## android版钱包。支持IMT

[https://www.token.soy][1]

## 2018/2/27更新
增加sleepingTask检测
调整cpu超过70%重启
将日志文件移到/home/admin/checkLog目录。使用云搬家app可以看到日志文件

### 功能

1. 网络离线检测
2. cpu检测(超过70%重启)



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
tail -f /home/admin/checkLog/log.out

// 同步时间
ntpdate 1.cn.pool.ntp.org

// 查看系统时间
date

// 同步时间 命令运行出现（the NTP socket is in use, exiting）时 运行
ps aux | grep ntpd
//然后找到ntp       xxxx  0.0  0.2   5072  1544 ?        Ss   12:00   0:01 /usr/sbin/ntpd -p /var/run/ntpd.pid -g -u 102:107这一行,找到xxxx代表的值。执行：
kill -9 xxxx

```


[1]: https://www.token.soy
