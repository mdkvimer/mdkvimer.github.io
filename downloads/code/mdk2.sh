#!/bin/bash - 
#===============================================================================
#
#          FILE: mdk2.sh
# 
#         USAGE: ./mdk2.sh 
# 
#   DESCRIPTION: check total in tcp port 80 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: mengdaikun (), 
#  ORGANIZATION: 
#       CREATED: 2013Äê05ÔÂ18ÈÕ 13ʱ32·Ö42Ãë CST
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error

total=`netstat -tan | grep "ESTABLISHED" | grep ":80" | wc -l`

echo "the total connect in tcp port 80 have $total"
