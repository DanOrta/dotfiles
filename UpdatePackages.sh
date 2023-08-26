#!/bin/bash
userName=$(whoami)
if [ $userName = "root" ];then
	echo -e "Updating packages list..."
	apt-get update
	echo -e "\nUpgrading packages..."
	apt-get full-upgrade --fix-missing -y
	echo -e "Distro Upgrade..."
	apt dist-upgrade -y
	echo -e "\nRemoving unnecessary packages..."
	apt autoremove -y
else
	echo -n -e "You are not root! Please use sudo to run this script!!\a"
fi
