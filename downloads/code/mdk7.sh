#!/bin/bash - 
#===============================================================================
#
#          FILE: mdk7.sh
# 
#         USAGE: ./mdk7.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: mengdaikun (), 
#  ORGANIZATION: 
#       CREATED: 2013Äê05ÔÂ18ÈÕ 15ʱ02·Ö06Ãë CST
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error

sleep 10&

id=$!

char=("-" "/" "|" "\\")

n=0

while ps aux | grep "^[[:space:]]*id" > /dev/null
do
	echo -ne "\rwaiting...${char[$n]}"
	n=$(( (n+1)%4 ))
	sleep 1
done

echo OK.
