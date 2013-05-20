#!/usr/bin/env python
'''#/*=============================================================================
#
# Author: mengdaikun - mengdaikun@gmail.com
#
# QQ : 646978600
#
# Last modified: 2013-04-09 14:24
#
# Filename: server1.py
#
# Description: 
#
#=============================================================================*/'''
#server for python 

import sys,os,socket

host = ''
port = 5566

s = socket.socket(socket.AF_INET,socket.SOCK_STREAM)
s.setsockopt(socket.SOL_SOCKET,socket.SO_REUSEADDR,1)
s.bind((host,port))
s.listen(1)

print "Server is running on port %d;press Ctrl-C to terminate." % port

while 1:
    clientsock,clientaddr = s.accept()
    clientfile = clientsock.makefile('rw',0)
    clientfile.write("Welcome, " + str(clientaddr) + "\n") 
    clientfile.write("Please enter a string:")
    line = clientfile.readline().strip()
    clientfile.write("You enter %d characters.\n" % len(line))
    clientfile.close()
    clientsock.close()
