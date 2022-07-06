#!/bin/bash
log_path=tws_sub_test.log
pwd=


echo "======== TEST CASE 1: SHOULD SUCCESS ===========" >> $log_path
sshpass -p $pwd ssh twsuser@172.19.250.22 <<END_SCRIPT &>>$log_path
	conman "sbs FODSETL#F2H_BS01_O;schedtime=1800 06/30/22;pri=30;noask" & echo "TWS_SUB_STS: $?"
END_SCRIPT
echo ""
echo "TEST 1 RETURN CODE: $?"
echo "======== TEST CASE 1 END ===========" >> $log_path
echo ""
echo ""


echo "======== TEST CASE 2: JOB_NAME NOT EXISTS ===========" >> $log_path
sshpass -p $pwd ssh twsuser@172.19.250.22 <<END_SCRIPT &>>$log_path
	conman "sbs FODSETL#F2H_BS01_Oxxx;schedtime=1800 06/30/22;pri=30;noask" & echo "TWS_SUB_STS: $?"
END_SCRIPT
echo ""
echo "TEST 2 RETURN CODE: $?"
echo "======== TEST CASE 2 END ===========" >> $log_path
echo ""
echo ""


echo "======== TEST CASE 3: DT format Error ===========" >> $log_path
sshpass -p $pwd ssh twsuser@172.19.250.22 <<END_SCRIPT &>>$log_path
	conman "sbs FODSETL#F2H_BS01_O;schedtime=1800 22/06/30;pri=30;noask" & echo "TWS_SUB_STS: $?"
END_SCRIPT
echo ""
echo "TEST 3 RETURN CODE: $?"
echo "======== TEST CASE 3 END ===========" >> $log_path
echo ""
echo ""


echo "======== TEST CASE 4: PRI CODE ERROR ===========" >> $log_path
sshpass -p $pwd ssh twsuser@172.19.250.22 <<END_SCRIPT &>>$log_path
	conman "sbs FODSETL#F2H_BS01_O;schedtime=1800 06/30/22;pri=300;noask" & echo "TWS_SUB_STS: $?"
END_SCRIPT
echo ""
echo "TEST 4 RETURN CODE: $?"
echo "======== TEST CASE 4 END ===========" >> $log_path
echo ""
echo ""

pwd=${pwd}xxx
echo "======== TEST CASE 5: TWS connection ERROR (pswnotcorrect) ===========" >> $log_path
sshpass -p $pwd ssh twsuser@172.19.250.22 <<END_SCRIPT &>>$log_path
	conman "sbs FODSETL#F2H_BS01_O;schedtime=1800 06/30/22;pri=30;noask" & echo "TWS_SUB_STS: $?"
END_SCRIPT
echo ""
echo "TEST 5 RETURN CODE: $?"
echo "======== TEST CASE 5 END ===========" >> $log_path
echo ""
echo ""