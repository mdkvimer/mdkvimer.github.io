#!/bin/bash - 
#===============================================================================
#
#          FILE: mdk1.sh
# 
#         USAGE: ./mdk1.sh 
# 
#   DESCRIPTION: the total process apache or nginx
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: mengdaikun (), 
#  ORGANIZATION: 
#       CREATED: 2013Äê05ÔÂ18ÈÕ 13ʱ22·Ö00Ãë CST
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error

# for httpd
total1=`ps aux | grep httpd | grep -v grep | wc -l`
#for apache
total2=`ps aux | grep apache | grep -v grep | wc -l`
#for nginx 
total3=`ps aux | grep nginx | grep -v grep | wc -l`

echo "the total process is : httpd:$total1  apache : $total2 nginx : $total3"
