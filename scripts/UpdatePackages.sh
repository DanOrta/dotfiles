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
		# We don't verify echo for errors, since is very unlikely that something bad happens with it.
		# If you want an additional check, replace the semi-color for '&&'.
		((echo -e $GREEN"Updating packages lists..."$RESET; apt-get update) && \
		(echo -e $GREEN"\nUpgrading packages..."$RESET; apt-get full-upgrade --fix-missing -y) && \
		(echo -e $GREEN"\nUpgrading distro..."$RESET; apt dist-upgrade -y) && \
		(echo -e $GREEN"\nRemoving unnecessary packages..."$RESET; apt autoremove -y)) || \
		echo -e $RED"Something went wrong!"$RESET
    else
		echo -n -e $RED"You are not root! Please use sudo to run this script!!\a"$RESET
	fi
fi
