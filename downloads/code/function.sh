#*=============================================================================
#
# Author: mengdaiku - mengdaikun@gmail.com
#
# QQ : 646978600
#
# Last modified: 2013-05-26 22:19
#
# Filename: function.inc
#
# Description: 系统监控shell函数库调用(../function.inc) 收集来自互联网
#
#=============================================================================
function GetPID #PsUser #PsName
{
    PsUser=$1
    PsName=$2
    pid=`ps -u $PsUser|grep $PsName|grep -v grep|grep -v vi|grep -v dbx|grep -v tail|grep -v start|grep -v stop |sed -n 1p |awk '{print $1}'`
    echo $pid
}

function GetCpu
{
    CpuValue=`ps -p $1 -o pcpu |grep -v CPU | awk '{print $1}' | awk -F. '{print $1}'`
    echo $CpuValue
}

function CheckCpu
{
    cpu=`GetCpu $1`

    echo "The CPU is $cpu"

    if [ "-$cpu" == "-" ]
    then
    {
        echo "The process is not found"
        return 1;
    }
    fi

    if [ $cpu -gt 80 ]
    then
    {
        echo "The usage of cpu is larger than 80%"
    }   
    else
    {  
        echo "The usage of cpu is normal"
    }
    fi
}

function GetMem
{
    MEMUsage=`ps -o vsz -p $1|grep -v VSZ`
    (( MEMUsage /= 1000))
    echo $MEMUsage
}

function GetDes
{
    DES=`ls /proc/$1/fd | wc -l`
    echo $DES
}

function GetSysCPU
{
   CpuIdle=`vmstat 1 5 |sed -n '3,$p' |awk '{x = x + $15} END {print x/5}' |awk -F. '{print $1}'`
   CpuNum=`echo "100-$CpuIdle" | bc`
   echo $CpuNum
}

function Listening
{
    TCPListeningnum=`netstat -an | grep ":$1 " | awk '$1 == "tcp" && $NF == "LISTEN" {print $0}' | wc -l`
    UDPListeningnum=`netstat -an|grep ":$1 " |awk '$1 == "udp" && $NF == "0.0.0.0:*" {print $0}' | wc -l`
    (( Listeningnum = TCPListeningnum + UDPListeningnum ))
    if [ $Listeningnum == 0 ]
    then
    {
        echo "0"
    }
    else
    {
       echo "1"
    }
    fi
}

function GetDiskSpc
{
    if [ $# -ne 1 ]
    then
        return 1
    fi

    Folder="$1$"
    DiskSpace=`df -k |grep $Folder |awk '{print $5}' |awk -F% '{print $1}'`
    echo $DiskSpace
}

function Chech_Tcp_Server_Port_Stat
{
    count_result=0
    stat_num=`netstat -an|egrep $1 |awk '$6 == "LISTEN" && $1 == "tcp" {print $0}' |wc -l`
    if [ $stat_num -ge 1 ]
    then
    {
        count_result=0
        echo "$1 port is normal!"
    }
    else
    {
        echo "$1 port is abnormal, please check"
    }
    fi
    return 0
}
