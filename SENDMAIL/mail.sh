#!/bin/bash

## ====
# EXEC CMD
# sh mail.sh --err-msg "ERRMSG" \
# 		--program-name "O2H_fileCheck_and_twsTri"
#		--datetime "20220101"
#		--recipients-path "./recipients.txt"
#		--mail-config-path "./application.properties"
#
# DESC
# only --err-msg argument is required, other arguments will use default
## ====


while [[ $# -gt 0 ]]; do
    key="$1"
    case "$key" in
        --program-name)
        shift
        PROGRAM_NAME=$1
        ;;
        --datetime)
        shift
        LOG_DATE_TIME=$1
        ;;
        --err-msg)
        shift
        ERR_MSG=$1
        ;;
        --recipients-path)
        shift
        REC_PATH=$1
        ;;
        --mail-config-path)
        shift
        MAIL_CONFIG_PATH=$1
        ;;
        *)
        log ERROR "Unknown option ${key}" && exit 1
        ;;
    esac
    # Shift after checking all the cases to get the next option
    shift
done

if [ -z $PROGRAM_NAME ];then
	PROGRAM_NAME="O2H_fileCheck_and_twsTri"
	echo "PROGRAM_NAME: $PROGRAM_NAME"
fi

if [ -z $LOG_DATE_TIME ]; then
	LOG_DATE_TIME=$(date +'%Y-%m-%dT%H:%M:%S')
	echo "LOG_DATE_TIME: $LOG_DATE_TIME"
fi

if [ -z $REC_PATH ];then
	REC_PATH="./recipients.txt"
	echo "REC_PATH: $REC_PATH"	
fi

if [ -z $MAIL_CONFIG_PATH ]; then
	MAIL_CONFIG_PATH="./application.properties"
	echo "MAIL_CONFIG_PATH: $MAIL_CONFIG_PATH"
fi

/opt/athemaster/kafka/mail/kafka-schema-registry-consumer-example-0.0.1-SNAPSHOT.jar \
$PROGRAM_NAME \
$LOG_DATE_TIME \
$ERR_MSG \
$REC_PATH \
$MAIL_CONFIG_PATH

