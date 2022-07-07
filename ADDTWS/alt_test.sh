pwd=
tws_log_path="/tmp/tws_log_$(date +"%Y%m%d%H%M%S")"
echo "======================================================================" >> ./tws_tri_tuser_test_01.log

sshpass -p ${pwd} ssh twsuser@172.19.250.22 /bin/bash <<END_SCRIPT &>> ./tws_tri_tuser_test_01.log
conman "altpri FODSETL#F2H_MOMO_ORDER_D(1800 06/30/22);pri=30;noask" &>> $tws_log_path
END_SCRIPT

tws_returncd=$?
echo "tws return code: $tws_returncd"

sshpass -p ${pwd} ssh twsuser@172.19.250.22 /bin/bash <<END_SCRIPT &>> ./tws_tri_tuser_test_01.log
cat $tws_log_path
END_SCRIPT