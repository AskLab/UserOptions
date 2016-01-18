#!/bin/bash
FILE=/home/root/usr/DefaultRepo/ipDatabase.txt
SUBNET=192.156.100
MASK=255.255.255.0

for iter in $(seq 0 255);
do
	IP="$SUBNET.$iter"
	if grep -Fxq "$IP" $FILE
	then
		echo "$IP busy"
	else
		#echo "" >> /etc/network/interfaces
		echo "auto $1" >> /etc/network/interfaces
		#echo "" >> /etc/network/interfaces
		echo "iface $1 inet static" >> /etc/network/interfaces
		#echo "" >> /etc/network/interfaces
		echo "address $IP" >> /etc/network/interfaces
		#echo "" >> /etc/network/interfaces
		echo "netmask $MASK" >> /etc/network/interfaces
		echo $IP >> $FILE
		ifdown $1
		ifup $1
		break
	fi
done
