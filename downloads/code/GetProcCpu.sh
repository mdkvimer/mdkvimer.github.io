#!/bin/bash
#/*=============================================================================
#
# Author: mengdaiku - mengdaikun@gmail.com
#
# QQ : 646978600
#
# Last modified: 2013-05-26 21:22
#
# Filename: GetProcCpu.sh
#
# Description: 检查某进程CPu的使用率是否超过80% 两个函数调用看function.inc
#
#=============================================================================*/

. ./function.inc

if [ $# -ne 2 ]
then
{
	echo "Need the user name and process parameters"
	exit 0;
}
fi
	
PID=`GetPID $1 $2`

if [ "-$PID" == "-" ]
then
{
    echo "The process is not found"
}
else
{
    CheckCpu $PID
}
fi
