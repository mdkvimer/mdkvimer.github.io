#!/bin/bash - 
#===============================================================================
#
#          FILE: check_srv_status.sh
# 
#         USAGE: ./check_srv_status.sh 
# 
#   DESCRIPTION: 检查srv的状态 如果srv不可用heartbeat vip转换
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: mengdaikun (), 
#  ORGANIZATION: 
#       CREATED: 02/06/2014 09:38:28 PM CST
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error

srv="http://192.168.6.107"

HTTP_CODE=`curl -o /dev/null -s -w "%{http_code}" "${srv}"`

[ -f /var/log/mdk ] && echo "The file has." || touch /var/log/mdk

function_ha_standby(){
    /etc/init.d/heartbeat standby >> /var/log/mdk
    echo  `date +"%Y-%m-%d  %H:%M:%S"`  httpd switched to slave!  >> /var/log/mdk
    /etc/init.d/heartbeat start >> /var/log/mdk
    /etc/init.d/httpd start >> /var/log/mdk
}

/sbin/ifconfig | grep eth0:0 >/dev/null 2>&1

if [[ $? -eq 0 ]];then
   if [[ $HTTP_CODE -ne 200 ]];then
        echo  `date +"%Y-%m-%d  %H:%M:%S"`  httpd haved stop>> /var/log/mdk
        echo "mdk"
	function_ha_standby
   fi
fi
