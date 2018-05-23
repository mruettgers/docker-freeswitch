#!/bin/sh

ARGS=${ARGS:-""}

CONFIG_DIR=${CONFIG_DIR:-"/config"}
DATA_DIR=${DATA_DIR:-"/data"}
LOG_DIR=${LOG_DIR:-"/log"}

if [ ! -z "${NAT}" ]; then
	if [ "${NAT}" = "0" ]; then
  		ARGS=$ARGS" -nonat"
  	fi
fi

freeswitch -conf ${CONFIG_DIR} -db ${DATA_DIR} -log ${LOG_DIR} -c $ARGS