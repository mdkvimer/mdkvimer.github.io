#!/bin/bash - 
#===============================================================================
#
#          FILE: deal_nginx_log1.sh
# 
#         USAGE: ./deal_nginx_log1.sh 
# 
#   DESCRIPTION: shell 分析处理 nginx 日志 构建高可用linux服务器 nginx 作为最前端的负载均衡器 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: mengdaikun (), 
#  ORGANIZATION: 
#       CREATED: 06/04/13 12:24:07 CST
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error

if [ $# -eq 0 ]
then
  echo "Error:please specify logfile."
  exit 0
else
  LOG=$1
fi

if [ ! -f $1 ]
then
  echo "Sorry,sir,I can't find yhis apache log file,please try again!"
  exit 0
fi

###############################################################################
echo "Most of the ip:"
echo "------------------------------------------------------------------------"
awk '{print $1}' $LOG | sort | uniq -c | sort -nr | head -10
echo
echo

###############################################################################
echo "Most of the time:"
echo "-------------------------------------------------------------------------"
awk '{print $4}' $LOG | cut -c 14-18 | sort | uniq -c | sort -rn | head -10
echo
echo
###############################################################################
echo "Most of the page"
echo "--------------------------------------------------------------------------"
awk '{print $11}' $LOG | sed 's/^.*\\(.cn*\\)\"/\\1/g' | sort | uniq -c | sort -nr | head -10
echo 
echo
###############################################################################
echo "Most of the time / Most of the ip:"
echo "--------------------------------------------------------------------------"
awk '{print $4}' $LOG | cut -c 14-18 | sort -n | uniq -c | sort -rn | head -10 > timelog

for i in `awk '{print $2}' timelog`
do
  num=`grep $i timelog | awk '{print $1}'`
  echo "$i $num"
  ip=`grep $i $LOG | awk '{print $1}' | sort -n | uniq -c | sort -rn | head -10`
  echo "$ip"
  echo
done

rm -rf timelog
