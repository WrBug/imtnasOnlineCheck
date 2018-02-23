echo '星际魔盒离线检测脚本'
echo '项目地址： https://github.com/WrBug/imtnasOnlineCheck'
echo 'Android版钱包,支持IMT：https://www.token.soy'
cd /usr
mkdir -p checkOnline
cd checkOnline
echo '正在获取最新脚本'
wget https://raw.githubusercontent.com/WrBug/imtnasOnlineCheck/master/check.sh -O check.sh
get https://raw.githubusercontent.com/WrBug/imtnasOnlineCheck/master/checkCpu.py -O checkCpu.py
txt=$(cat /etc/crontab)
if [[ ${txt} == *'/usr/checkOnline'* ]]; then
echo '定时任务已存在，跳过'
else
echo '正在配置定时任务'
echo '*/1 * * * *  root cd /usr/checkOnline && sh check.sh' >> /etc/crontab
fi
service cron restart
echo '脚本配置成功,服务已启动'
