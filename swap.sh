#!/bin/bash
echo -e "\033[33m Your current swap is \033[0m"
free -h
mkdir /SwapDir
cd /SwapDir
dd if=/dev/zero of=/SwapDir/swap bs=1M count=2048
chmod 0600 swap
mkswap /SwapDir/swap 
swapon /SwapDir/swap 
myFile=/etc/fstab.bak 
cd /etc
if [ -f "$myFile" ];then
rm -rf fstab.bak 
else
cp /etc/fstab /etc/fstab.bak 
fi
echo "/SwapDir/swap swap swap defaults 0 0">>/etc/fstab 
echo -e "\033[31m Done\!Congratulation\！System swap add successful\！ \033[0m"
echo -e "\033[33m Your system swap is \: \033[0m"
free -h
