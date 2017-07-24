#!/bin/sh

#VARIALBE
HOSTS='/etc/hosts'
HOSTS_BK='/etc/hosts.save'

#cleanup HOSTS and rebuild
echo '-------------------HOST Setup Start-------------------------'
sudo cp $HOSTS $HOSTS_BK
sudo echo -e 'localhost\t\t127.0.0.1' > $HOSTS

for ip_address in $(nmap -p 137 192.168.0.0/24 -oG - | grep netbios | awk '{print $2}')
do
        hostname=$(timeout 1 nmblookup -A $ip_address | awk '$2 == "<20>" {print $1}')
        if [ -n "$hostname" ];then
        	sudo echo -e "$hostname\t\t$ip_address" >> $HOSTS
        fi 
done
cat $HOSTS
echo '------------------HOST Setup Over--------------------------'

#env_var export

#source workspace setup

#udev rules release setup

#service re-config

#self-check & launch file selection
