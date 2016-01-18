#!/bin/bash
FILE=/home/root/usr/DefaultRepo/ipDatabase.txt
SUBNET=192.156.100

for iter in $(seq 0 255);
do
	IP="$SUBNET.$iter"
	if grep -Fxq "$IP" $FILE
	then
		echo "$iter Busy"
	else
		ifconfig $1 $IP netmask 255.255.255.0
		echo $IP >> $FILE
		break
	fi
done
