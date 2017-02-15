#!/bin/sh
#coding=utf-8

#testip 10.192.83.14
echo '--------time synchronize script execute start---------------'		

#ntpdate write
/usr/sbin/ntpdate $1 && /sbin/hwclock -w
if [ $? -ne 0 ];then
	exit 1
fi

#close centos7's chronyd service
cat /etc/redhat-release |grep 7\\..*|grep -i centos > /dev/null
if [ $? -eq 0 ];then
	systemctl stop chronyd.service
	systemctl disable chronyd.service
fi

#set crontab
if [ -a /var/spool/cron/root ]; then
	sed -i "/^.*ntpdate.*$/d" /var/spool/cron/root
fi
echo "0 */$2 * * * (/usr/sbin/ntpdate $1 && /sbin/hwclock -w) > /dev/null 2>&1" >> /var/spool/cron/root
service crond status 1>/dev/null 2>&1
if [ $? -ne 0 ]; then
	service crond start
else
	service crond restart
fi
	
echo '--------time synchronize script execute end-----------------'	
exit 0
