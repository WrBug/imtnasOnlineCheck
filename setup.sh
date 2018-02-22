echo '星际魔盒离线检测脚本'
cd /home
mkdir -p checkOnline
cd checkOnline
echo '正在获取最新脚本'
wget https://raw.githubusercontent.com/WrBug/imtnasOnlineCheck/master/check.sh -O check.sh
echo '*/1 * * * *  root cd /home/checkOnline && sh check.sh' >> /etc/crontab
service cron restart
echo '脚本配置成功'
