# 星际魔盒离线检测脚本

脚本实现设备在线检测，离线后，魔盒将自动重启

### 使用方法

1. 使用ssh登录星际魔盒,windows使用putty登录，linux或mac使用下面命令

```
ssh admin@IP地址

```
2. 执行下面命令下载脚本

```
sudo -s
cd /home
mkdir -p checkOnline
cd checkOnline
wget https://raw.githubusercontent.com/WrBug/imtnasOnlineCheck/master/check.sh -O check.sh
```

3. 设置定时任务

```
crontab -e
```
执行后将下面的内容复制到最后一行，然后保存(crtl+x 然后输入y，回车)

`cd /home/checkOnline && sh check.sh`

4. 重启定时任务

```
// 重启定时任务
service cron restart

// 查看定时任务状态
service cron status

// 查看脚本实时运行状态
tail -f /home/checkOnline/checkLog/log.out
```
