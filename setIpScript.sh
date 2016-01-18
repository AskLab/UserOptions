#!/bin/bash

# $1 - interface eth0, eth1
# $2 - admin/user

FILE=/home/root/usr/DefaultRepo/ipDatabase.txt
SUBNET=192.156.100

for I in {0..255}
do
	echo I
	IP="$SUBNET.$I"	
	
	if grep -Fxq "$IP" $FILE
	then
	else
		ifconfig $1 $IP netmask 255.255.255.0
		echo $IP >> $FILE
	fi
done