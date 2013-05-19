#!/bin/bash - 
#===============================================================================
#
#          FILE: mdk6.sh
# 
#         USAGE: ./mdk6.sh 
# 
#   DESCRIPTION: up address view page
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: mengdaikun (), 
#  ORGANIZATION: 
#       CREATED: 2013Äê05ÔÂ18ÈÕ 13ʱ54·Ö58Ãë CST
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error

awk '{++s[$1]} END {for ( i in s) print i,s[i]}' access.log
