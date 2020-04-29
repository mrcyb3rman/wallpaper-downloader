#!/bin/bash

if [ "$1" == "" ]
then
	echo "<---Download Image: alphacoders.com --->"
	echo "[!] Usage   : ./wp-coder.sh <URL>"
	echo "[!] Exemple : ./wp-coder.sh https://wall.alphacoders.com/search.php?search=batman"
else
	echo "<---Download Image: alphacoders.com --->"
	echo
	echo "[+] Target     : $1"
	echo "[+] Start Time : $(date)"
	echo
	name=`echo $1 | cut -d '=' -f2`
        mkdir $name && cd $name
	echo "[+] Getting Links..."
	sleep 2
	echo "[+] Downloading..."
	echo
	for i in $(curl -s $1 | grep "big.php" | cut -d '"' -f2); do for a in $(curl -s "https://wall.alphacoders.com/"$i | grep -e "$(echo $i | cut -d '=' -f2).jpg" -e "$(echo $i | cut -d '=' -f2).png" | sed '1,3d' | head -n 1 | cut -d '"' -f2); do wget -nv $a; done; done
fi
