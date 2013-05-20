#/*=============================================================================
#
# Author: mengdaikun - mengdaikun@gmail.com
#
# QQ : 646978600
#
# Last modified: 2013-04-09 15:37
#
# Filename: server2.py
#
# Description: 
#
#=============================================================================*/
#!/usr/bin/env python
# basic server by python 

import os , sys , socket

host = ''
port = 5566

s = socket.socket(socket.AF_INET,socket.SOCK_STREAM)
s.setsockopt(socket.SOL_SOCKET,socket.SO_REUSEADDR,1)
s.bind((host,port))
print "Waiting for connecting..."
s.listen(5)

while 1:
    clientsock , clientaddr = s.accept()
    print "Got connect from",clientsock.getpeername()
    clientsock.close()
