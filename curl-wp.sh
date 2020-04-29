#!/bin/bash

if [ "$1" == "" ]
then
    echo "<---Download Image: wallpaperaccess.com --->"
    echo "[!] Usage: ./wallpaperaccess.sh <URL>"
    echo "[+] Exemple: ./wallpaperaccess.sh https://wallpaperaccess.com/mr-robot"
else
    echo "<---Download Image: wallpaperaccess.com --->"
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
    for image in $(curl -A 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:75.0) Gecko/20100101 Firefox/75.0' -s $1 | grep '/download/' | grep 'href' | cut -d '"' -f2 | sort | uniq); do echo '[+] Getting Image '$(echo $image | cut -d '/' -f3); curl -OJL -s 'https://wallpaperaccess.com'$image; done
fi
