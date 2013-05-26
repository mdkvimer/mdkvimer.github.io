#!/bin/bash
#/*=============================================================================
#
# Author: mengdaiku - mengdaikun@gmail.com
#
# QQ : 646978600
#
# Last modified: 2013-05-26 21:12
#
# Filename: CheckPort.sh
#
# Description: 检查端口是否监听,利用netstat检验 函数调用 Listening
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

isListen=`Listening $1`

if [ $isListen -eq 1 ]
then
{
    echo "The port is listening"
}
else
{
    echo "The port is not listening"
}
fi
