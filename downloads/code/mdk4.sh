#!/bin/bash - 
#===============================================================================
#
#          FILE: mdk4.sh
# 
#         USAGE: ./mdk4.sh 
# 
#   DESCRIPTION: view the url page
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: mengdaikun (), 
#  ORGANIZATION: 
#       CREATED: 2013Äê05ÔÂ18ÈÕ 13ʱ44·Ö32Ãë CST
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error

echo "the view page:"

cat access.log | awk '{print $8}' | sort | uniq -c | sort -nr | head -n 20
