#!/bin/bash
#/*=============================================================================
#
# Author: mengdaikun - mengdaikun@gmail.com
#
# QQ : 646978600
#
# Last modified: 2013-05-26 21:15
#
# Filename: CheckTCPPortStat.sh
#
# Description:检查TCP端口是否正常 函数Chch_Tcp_Server_Port_stat  
#
#=============================================================================*/

. ./function.inc

if [ $# -ne 1 ]
then
{
	echo "Need input the port"
	exit 0;
}
fi

output=`Chech_Tcp_Server_Port_Stat $1`

echo $output
