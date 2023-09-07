#!/bin/bash
userName=$(whoami)
APT_STATUS=$(whereis apt)
# COLORS
RESET='\033[00m'
RED='\033[01;31m'
GREEN='\033[01;32m'
if [ "$APT_STATUS" == "apt:" ];then
    echo -e $RED"You are not using a debian based distro!"$RESET
else
    if [ $userName = "root" ];then
		echo -e $GREEN"Updating packages lists..."$RESET
		apt-get update
		echo -e $GREEN"\nUpgrading packages..."$RESET
		apt-get full-upgrade --fix-missing -y
		echo -e $GREEN"\nUpgrading distro..."$RESET
		apt dist-upgrade -y
		echo -e $GREEN"\nRemoving unnecessary packages..."$RESET
		apt autoremove -y
    else
		echo -n -e $RED"You are not root! Please use sudo to run this script!!\a"$RESET
	fi
fi
