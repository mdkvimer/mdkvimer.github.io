#!/bin/bash - 
#===============================================================================
#
#          FILE: mdk3.sh
# 
#         USAGE: ./mdk3.sh 
# 
#   DESCRIPTION: total the ip address
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: mengdaikun (), 
#  ORGANIZATION: 
#       CREATED: 2013Äê05ÔÂ18ÈÕ 13ʱ41·Ö24Ãë CST
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error

echo "the total ipddress is:"

cat access.log | awk '{print $1}' | sort | uniq -c | sort -nr 
