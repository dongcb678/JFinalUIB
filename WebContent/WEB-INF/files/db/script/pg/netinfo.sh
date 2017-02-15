#!/bin/sh

function network_centos6(){

	cat /proc/net/dev|grep -v 'lo\|Inter\|face'|awk -F ':' '{print $1}'|while read nic_info
	do
		running_info=0
		if [ `ifconfig $nic_info|grep RUNNING|wc -l` -gt 0 ]; then
			running_info=1
		fi
		mac_info=`ifconfig $nic_info|awk '/HWaddr/{print $5}'`
		ip_info=`ifconfig $nic_info|awk '/inet addr/{print $2}'|awk -F: '{print $2}'`
		mask_info=`ifconfig $nic_info|awk -F: '/Mask/{print $4}'`
		broadcast_info=`ifconfig $nic_info|awk '/Bcast/{print $3}'|awk -F: '{print $2}'`
		bond_slavenames=''
		if [ `echo "$nic_info"|grep bond|wc -l` -gt 0  ]; then
			if [ -f /etc/sysconfig/network-scripts/ifcfg-"$nic_info" ];then
				bond_slavenames=`cat /etc/sysconfig/network-scripts/ifcfg-"$nic_info"|awk -F= '/BONDING_SLAVE/{print $2}'`
				bond_mode=`cat /etc/sysconfig/network-scripts/ifcfg-"$nic_info"|awk -F= '/BONDING_OPTS/{print $3}'|awk '{print $1}'`
			fi
		fi
		echo $nic_info'#'$running_info'#'$mac_info'#'$ip_info'#'$mask_info'#'$broadcast_info'#'$bond_slavenames'#'$bond_mode
	done
}

function network_centos7(){

	cat /proc/net/dev|grep -v 'lo\|Inter\|face'|awk -F ':' '{print $1}'|while read nic_info
	do
		running_info=0
		if [ `ifconfig $nic_info|grep RUNNING|wc -l` -gt 0 ]; then
			running_info=1
		fi
		mac_info=`ifconfig $nic_info|awk '/ether/{print $2}'`
		ip_info=`ifconfig $nic_info|awk '/inet/{print $2}'|cut -f2 -d ":"|awk 'NR==1 {print $1}'`
		mask_info=`ifconfig $nic_info|awk '/netmask/{print $4}'`
		broadcast_info=`ifconfig $nic_info|awk '/broadcast/{print $6}'`
		bond_slavenames=''		
		if [ `echo "$nic_info"|grep bond|wc -l` -gt 0  ]; then
			#bond information
			if [ -f /etc/sysconfig/network-scripts/ifcfg-"$nic_info" ];then
				bond_slavenames=`cat /etc/sysconfig/network-scripts/ifcfg-"$nic_info"|awk -F= '/BONDING_SLAVE/{print $2}'`
				bond_mode=`cat /etc/sysconfig/network-scripts/ifcfg-"$nic_info"|awk -F= '/BONDING_OPTS/{print $3}'|awk '{print $1}'`
			fi
			
		fi
		echo $nic_info'#'$running_info'#'$mac_info'#'$ip_info'#'$mask_info'#'$broadcast_info'#'$bond_slavenames'#'$bond_mode
	done
}

cat /etc/redhat-release |grep 7\\..*|grep -i centos > /dev/null
if [ $? -eq 0 ];then
	#centos7
	network_centos7
else
	#centos6
	network_centos6
fi 

exit 0
