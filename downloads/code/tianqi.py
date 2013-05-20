#!/usr/bin/env python
#coding:utf-8
'''/*=============================================================================
#
# Author: mengdaiku - mengdaikun@gmail.com
#
# QQ : 646978600
#
# Last modified: 2013-05-20 16:11
#
# Filename: tianqi.py
#
# Description: 网络抓取网页天气预报并利用split整合发短信通知(发信脚本略) 
#
=============================================================================*/'''


import sys, re, urllib2, datetime
from HTMLParser import HTMLParser

class main(HTMLParser):
    def __init__(self):
        HTMLParser.__init__(self)
        self.tarsum = ['td','th','br']
        self.readingtitle = 0
        self.curtag = None
        self.curattrs = 0
        self.marktag = None
        self.result = {}
        self.timeclock = 0 
        for i in range(0,7):
            self.result[datetime.date.today() + datetime.timedelta(days=i)] = []
    def handle_starttag(self,tag,attrs):
        self.curtag = tag
        self.curattrs = len(attrs)
        if tag == 'table' and len(attrs) == 7:
            self.readingtitle = 1
            self.marktag = tag
        if self.readingtitle == 1:
            if tag == self.marktag:
                self.timeclock = -2
            elif tag == 'td':
                self.timeclock += 1
    def handle_data(self,data):
        if self.curtag in self.tarsum and self.curattrs == 0 and self.readingtitle == 1:
            days = datetime.date.today() + datetime.timedelta(days=self.timeclock)
           # self.result[days].append(data.strip())
            self.result[days].append(data.strip()) 
    def handle_endtag(self,tag):
        if tag == self.marktag:
            self.readingtitle = 0
    def getvalue(self):
        return self.result

if __name__ == '__main__':
    url = urllib2.urlopen('http://qq.ip138.com/weather/zhejiang/HangZhou.htm')
    page = url.read()
    page = unicode(page,'gb2312','ignore').encode('utf-8','ignore')
    line = main()
    line.feed(page)
    for key,value in line.getvalue.items():
        print key,
        for a in value:
            print a,
        print 
    


