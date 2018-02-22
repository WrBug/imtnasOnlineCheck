echo '星际魔盒离线检测脚本'
cd /home
mkdir -p checkOnline
cd checkOnline
echo '正在获取最新脚本'
wget https://raw.githubusercontent.com/WrBug/imtnasOnlineCheck/master/check.sh -O check.sh
txt=$(cat /etc/crontab)
if [[ ${txt} == *'checkOnline'* ]]; then
echo '定时任务已存在，跳过'
else
echo '正在配置定时任务'
echo '*/1 * * * *  root cd /home/checkOnline && sh check.sh' >> /etc/crontab
fi
service cron restart
echo '脚本配置成功'
