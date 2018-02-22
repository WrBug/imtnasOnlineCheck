cd /home
mkdir -p checkOnline
cd checkOnline
wget https://raw.githubusercontent.com/WrBug/imtnasOnlineCheck/master/check.sh -O check.sh
echo '*/1 * * * *  root cd /home/checkOnline && sh check.sh' >> /etc/crontab
service cron restart
