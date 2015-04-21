#!/bin/bash

#############################################################
#Shell script to scan ssh ports for the machines in the senior lab
#(C) 2015 Benjamin Hugo
############################################################
yellow='\033[1;44;33m'
red='\033[1;33;41m'
green='\033[0;30;42m'
nc='\033[0m' # no color
echo -e "${yellow} Starting ssh port scan... ${nc}"
for i in {0..200};
do
	machine_name=sl-dual-$i.cs.uct.ac.za
	#echo checking machine $machine_name
	if `nc -w 1 -z $machine_name 22 2> /dev/null`; then 
		echo -e "${green}Machine ${machine_name} is online${nc}" 
	else 
		echo -e "${red}Machine ${machine_name} is offline${nc}"
	fi 
done
echo -e "${yellow}SSH port scan complete!!!${nc}"
