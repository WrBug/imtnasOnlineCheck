echo '星际魔盒离线检测脚本\n'
echo '\n'
echo '项目地址： https://github.com/WrBug/imtnasOnlineCheck\n'
echo '\n'
echo 'Android版钱包,支持IMT：https://www.token.soy\n\n'
echo '\n'
echo '\n'
cd /usr
mkdir -p checkOnline
rm -rf /home/checkOnline
cd checkOnline
echo '正在获取最新脚本'
wget https://raw.githubusercontent.com/WrBug/imtnasOnlineCheck/master/check.sh -O check.sh
wget https://raw.githubusercontent.com/WrBug/imtnasOnlineCheck/master/checkCpu.py -O checkCpu.py
txt=$(cat /etc/crontab)

if [[ ${txt} == *'/home/checkOnline'* ]]; then
echo '检测到旧版本数据，请编辑 /etc/crontab文件。  删除 */1 * * * *  root cd /home/checkOnline && sh check.sh 这一行'
echo '\n'
echo '\n'
fi
if [[ ${txt} == *'/usr/checkOnline'* ]]; then
echo '定时任务已存在，跳过'
else
echo '正在配置定时任务'
echo '*/1 * * * *  root cd /usr/checkOnline && sh check.sh' >> /etc/crontab
fi
service cron restart
echo '脚本配置成功,服务已启动'
echo '一分钟后可以通过命令：tail -f /home/admin/checkLog/log.out  查看运行状态'
