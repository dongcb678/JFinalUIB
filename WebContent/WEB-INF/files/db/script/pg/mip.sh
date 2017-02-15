#!/bin/sh

# use like this: mip.sh name ip gateway netmask
# eg. mip.sh eth0 10.192.66.192 10.192.66.254 255.255.255.0

filepath='/etc/sysconfig/network-scripts/ifcfg-'"$1"

sed -i "s/IPADDR.*$/IPADDR=$2/g" $filepath
sed -i "s/GATEWAY.*$/GATEWAY=$3/g" $filepath
sed -i "s/NETMASK.*$/NETMASK=$4/g" $filepath

service network restart
if [ $? -ne 0 ]; then
	sleep 5
	exit 0
else
	exit 1
fi
