#!/bin/bash

#VARIALBE
HOSTS='/etc/hosts'
HOSTS_BK='/etc/hosts.save'

# dependency check
function pkg_check(){
	pkg=$1;
	pkg_status=$(dpkg-query -l $pkg | awk '($1=="rc") {print "N"}')
	if [ -n "$pkg_status" ];then
		echo '[PENDING]' $pkg
 		sudo apt-get install -y $pkg 1> /dev/null
 		echo '[INSTALLED]' $pkg
 	else
 		echo '[INSTALLED]' $pkg
 	fi
}
echo '----------------Dependency Check Start----------------------'
pkg_check "samba"
echo '-----------------Dependency Check Over----------------------'

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
