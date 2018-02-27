PUBLIC_IP=$(wget -t 3 -T 15 -qO- http://whatismyip.akamai.com)
PRIVATE_IP=$(ip -4 route get 1 | awk '{print $NF;exit}')
TIME=$(date +%Y.%m.%d\(%H.%M.%S\))
EXCEPTION_LOG_FILE=${TIME}'重启.txt'
NORMAL_LOG_FILE='log.out'
LOG_DIR='/home/admin/checkLog'
mkdir -p ${LOG_DIR}
if [ -z "${PUBLIC_IP}" ]; then
  echo '无网络，重启' > ${LOG_DIR}/${EXCEPTION_LOG_FILE}
  shutdown -r now
  exit
fi
result=$(python checkCpu.py)
if [ $result == 'Cpu' ]; then
  echo 'cpu使用过多，重启' > ${LOG_DIR}/${EXCEPTION_LOG_FILE}
  shutdown -r now
  exit     
fi
if [ $result == 'Cpu' ]; then
  echo 'sleepingTask 过多，重启' > ${LOG_DIR}/${EXCEPTION_LOG_FILE}
  shutdown -r now
  exit     
fi
echo '--------------------'>>  ${LOG_DIR}/${NORMAL_LOG_FILE}
echo '检查时间：'${TIME} >>  ${LOG_DIR}/${NORMAL_LOG_FILE}
echo '公网IP:'${PUBLIC_IP} >> ${LOG_DIR}/${NORMAL_LOG_FILE}
echo '内网IP：'$PRIVATE_IP >> ${LOG_DIR}/${NORMAL_LOG_FILE}
echo 'cpu正常' >> ${LOG_DIR}/${NORMAL_LOG_FILE}
