PUBLIC_IP=$(wget -t 1 -T 5 -qO- http://whatismyip.akamai.com)
PRIVATE_IP=$(ip -4 route get 1 | awk '{print $NF;exit}')
TIME=$(date +%Y.%m.%d\(%H.%M.%S\))
NO_NETWORK_LOG_FILE=${TIME}'.txt'
NORMAL_LOG_FILE='log.out'
LOG_DIR='checkLog'
mkdir -p ${LOG_DIR}
if [ -z "${PUBLIC_IP}" ]; then
  echo '无网络，重启' > ${LOG_DIR}/${NO_NETWORK_LOG_FILE}
  shutdown -r now
  exit
fi
echo '--------------------'>>  ${LOG_DIR}/${NORMAL_LOG_FILE}
echo '检查时间：'${TIME} >>  ${LOG_DIR}/${NORMAL_LOG_FILE}
echo '公网IP:'${PUBLIC_IP} >> ${LOG_DIR}/${NORMAL_LOG_FILE}
echo '内网IP：'$PRIVATE_IP >> ${LOG_DIR}/${NORMAL_LOG_FILE}
