#!/bin/sh

ethtool -h > /dev/null
if [ $? -ne 0 ]; then
    echo "please install ethtool"
    exit -1
fi
NETWORKSCRIPTS="/etc/sysconfig/network-scripts"


function create_netcard_script() {
    echo "DEVICE=$1" > "$NETWORKSCRIPTS/ifcfg-$1"
    echo "STARTMODE=onboot" >> "$NETWORKSCRIPTS/ifcfg-$1"
    echo "ONBOOT=yes" >> "$NETWORKSCRIPTS/ifcfg-$1"
    echo "MTU=1500" >> "$NETWORKSCRIPTS/ifcfg-$1"
    echo "BOOTPROTO=$5" >> "$NETWORKSCRIPTS/ifcfg-$1"
    echo "IPADDR=$2" >> "$NETWORKSCRIPTS/ifcfg-$1"
    echo "NETMASK=$3" >> "$NETWORKSCRIPTS/ifcfg-$1"
    echo "GATEWAY=$4" >> "$NETWORKSCRIPTS/ifcfg-$1"
    #hw=`ifconfig $1 | grep ether | awk '{print $2}'`
    #echo "HWADDR=$hw" >> "$NETWORKSCRIPTS/ifcfg-$1"
}

if [[ $1 =~ "bond" ]]; then
    echo "unbonding......"
    if [ ! -f "$NETWORKSCRIPTS/ifcfg-$1" ]; then
        echo "$1 have unbonded!"
        exit 0
    fi
    devname=""
    ipaddr=""
    netmask=""
    gateway=""
    while read line
    do
        if [[ $line =~ "BONDING_SLAVE" ]]; then
            t=`echo $line | cut -d = -f 2`
            rt=`ethtool $t | grep Link | grep -v grep`
            if [[ $rt =~ "yes" ]]; then
                if [[ $devname = "" ]]; then
                    devname=$t
                else
                    create_netcard_script $t "0.0.0.0" "0.0.0.0" "0.0.0.0" "none"
                fi
            else
                create_netcard_script $t "0.0.0.0" "0.0.0.0" "0.0.0.0" "none"
            fi
            #if [[ $line =~ "BONDING_SLAVE0" ]]; then
            #    devname=`echo $line | cut -d = -f 2`
            #else
            #    t=`echo $line | cut -d = -f 2`
            #   create_netcard_script $t "0.0.0.0" "0.0.0.0" "0.0.0.0"
            #fi
        fi
        if [[ $line =~ "IPADDR" ]]; then
            ipaddr=`echo $line | cut -d = -f 2`
        fi
        if [[ $line =~ "NETMASK" ]]; then
            netmask=`echo $line | cut -d = -f 2`
        fi
        if [[ $line =~ "GATEWAY" ]]; then
            gateway=`echo $line | cut -d = -f 2`
        fi
        echo "$devname $ipaddr $netmask $gateway"
    done < $NETWORKSCRIPTS/"ifcfg-bond0"

    create_netcard_script $devname $ipaddr $netmask $gateway "static"
    rm -f $NETWORKSCRIPTS/"ifcfg-$1"
    rt=`/sbin/rmmod bonding`
    ifconfig $devname up
    #reboot
    service network restart
    exit 0
fi

if [ $# -lt 4 ]; then
    echo "Usage: ./bondtool.sh ip netmask eth0 eth1"
    exit 1
fi
t=`ls $NETWORKSCRIPTS | grep ^ifcfg-bond | wc -l`
if [ "$t" -gt 0 ]; then
    echo "The server have bonded."
    exit 0
fi
echo "bondip:$1"
echo "bondnetmask:$2"
echo "bondmode:$3"
#echo "input (y or n):"
#read yn
#if [ $yn = "n" ]; then
#    exit 1
#fi
echo "Start bonding networkcard"


BONDCFG="/etc/sysconfig/network-scripts/ifcfg-bond0"
function create_network_script() {
    echo "DEVICE=$1" >> "$NETWORKSCRIPTS/ifcfg-$1"
    echo "STARTMODE=onboot" >> "$NETWORKSCRIPTS/ifcfg-$1"
    echo "ONBOOT=yes" >> "$NETWORKSCRIPTS/ifcfg-$1"
    echo "MASTER=bond0" >> "$NETWORKSCRIPTS/ifcfg-$1"
    echo "SLAVE=yes" >> "$NETWORKSCRIPTS/ifcfg-$1"
    echo "BOOTPROTO=static" >> "$NETWORKSCRIPTS/ifcfg-$1"
    echo "USERCTL=no" >> "$NETWORKSCRIPTS/ifcfg-$1"
}

function backup_all(){
    for ifcfg in `ls $NETWORKSCRIPTS | grep ^ifcfg- | grep -v ^ifcfg-lo`
    do
        echo "rename $ifcfg"
        mv $NETWORKSCRIPTS/$ifcfg $NETWORKSCRIPTS/.$ifcfg
        echo "rename $ifcfg as .$ifcfg"
    done
}
function bond_all(){
    
    num=0
    while read line
    do
        ((num+=1))
        if [ $num -lt 3 ]; then
            continue
        fi
        ethname=`echo $line | cut -d : -f 1`
        result=`echo $ethname | grep "bond"`
        if [[ $result != "" ]]; then
            ((num-=1))
            continue
        fi
        if [ $ethname != "lo" ]; then
            echo "get network device:$ethname"
            echo "BONDING_SLAVE$((num-3))=$ethname" >> $BONDCFG
            create_network_script $ethname
        fi
    done < /proc/net/dev
}

function backup_one(){
    mv -f $NETWORKSCRIPTS/ifcfg-$1 $NETWORKSCRIPTS/.ifcfg-$1
}

function bond_one(){
    echo "BONDING_SLAVE$1=$2" >> $BONDCFG
    create_network_script $2
}

if [ $# -gt 2 ]; then
    arg_num=0
    for arg in "$@"
    do
        ((arg_num+=1))
        if [ $arg_num -lt 4 ]; then
            continue
        fi
        backup_one $arg
        bond_one $((arg_num-4)) $arg
    done
else
    backup_all
    bond_all
fi

gateway=`route | grep default | grep -v grep | awk '{print $2}' | head -1`
echo "default gateway:$gateway"
echo "DEVICE=bond0" >> $BONDCFG
echo "IPADDR=$1" >> $BONDCFG
echo "NETMASK=$2" >> $BONDCFG
echo "GATEWAY=$gateway" >> $BONDCFG
echo 'MTU=1500' >> $BONDCFG
echo "BONDING_OPTS=\"mode=$3 miimon=1000\"" >> $BONDCFG
echo 'STARTMODE=onboot' >> $BONDCFG
echo 'BONDING_MASTER=yes' >> $BONDCFG
echo 'ONBOOT=yes' >> $BONDCFG
echo 'BOOTPROTO=static' >> $BONDCFG
echo 'USERCTL=no' >> $BONDCFG
service network restart
sleep 3
service network restart
#reboot
exit 0
