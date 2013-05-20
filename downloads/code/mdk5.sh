#!/bin/bash - 
#===============================================================================
#
#          FILE: mdk5.sh
# 
#         USAGE: ./mdk5.sh 
# 
#   DESCRIPTION: tcpdump
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: mengdaikun (), 
#  ORGANIZATION: 
#       CREATED: 2013Äê05ÔÂ18ÈÕ 13ʱ48·Ö15Ãë CST
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error

echo "the port 80 in tcpdump"

tcpdump -i eth0 -tnn dst port 80 -c 1000 | awk -F . '{print $1"."$2"."$3"."$4}' | sort | uniq -c | sort -rn | head -n 20 
