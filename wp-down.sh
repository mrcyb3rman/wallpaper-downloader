#!/bin/bash

site1="coders"
site2="access"

if [[ $1 == "" ]]
then
	echo
	echo "<--- WallPaper Download: alphacoders.com, wallpaperaccess.com --->"
	echo
	echo "[!] Usage   : ./wp-coder.sh <URL>"
	echo "[!] Exemple : ./wp-coder.sh https://wall.alphacoders.com/search.php?search=batman"
elif [[ $1 == *$site1* ]]
then
	echo
	echo "[+] Target     : $1"
	echo "[+] Start Time : $(date)"
	echo
	
	name=`echo $1 | cut -d '=' -f2`
    mkdir $name && cd $name
    
	echo "[+] Getting Links..."
	echo "[+] Downloading..."
	echo
	
	for i in $(curl -s $1 | grep "big.php" | cut -d '"' -f2)
	do 
		for a in $(curl -s "https://wall.alphacoders.com/"$i | grep -e "$(echo $i | cut -d '=' -f2).jpg" -e "$(echo $i | cut -d '=' -f2).png" | sed '1,3d' | head -n 1 | cut -d '"' -f2)
		do
			wget -nv $a
		done
	done
elif [[ $1 == *$site2* ]]
then
	echo
    echo "[+] Target     : $1"
    echo "[+] Start Time : $(date)"
    echo
    
    name=`echo $1 | cut -d '/' -f4`
    mkdir $name && cd $name
    
    echo "[+] Getting Images..."
    
    len=$(curl -A 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:75.0) Gecko/20100101 Firefox/75.0' -s $1 | grep '/download/' | grep 'href' | cut -d '"' -f2 | sort | uniq | wc -l)
    
    echo "[+] $len Image found"
    echo "[+] Downloading Images..."
    echo
    
    for image in $(curl -A 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:75.0) Gecko/20100101 Firefox/75.0' -s $1 | grep '/download/' | grep 'href' | cut -d '"' -f2 | sort | uniq)
    do 
    	echo '[+] Getting Image '$(echo $image | cut -d '/' -f3); curl -OJL -s 'https://wallpaperaccess.com'$image
    done
else
	echo "[!] Only Support [1] alphcoders.com & [2] wallpaperaccess.com"
fi	
    	
    	
    	
    	
    	
    	
    	
    	
    	
    	
    	
    	
    	
    	
    	
