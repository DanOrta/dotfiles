#!/bin/bash
# ##################################################################################################
# MIT License
#
# Copyright (c) 2023 DanOrta
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.
# ##################################################################################################
# File UpdatePackages.sh
# Description: A simple file to update software packages in a Debian based distro.
# ##################################################################################################
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
		# We don't verify echo for errors, since is very unlikely that something bad happens with
		# it. If you want an additional check, replace the semi-color for '&&'.
		((echo -e $GREEN"Updating packages lists..."$RESET; apt-get update) && \
		(echo -e $GREEN"\nUpgrading packages..."$RESET; apt-get full-upgrade --fix-missing -y) && \
		(echo -e $GREEN"\nUpgrading distro..."$RESET; apt dist-upgrade -y) && \
		(echo -e $GREEN"\nRemoving unnecessary packages..."$RESET; apt autoremove -y)) || \
		echo -e $RED"Something went wrong!"$RESET
    else
		echo -n -e $RED"You are not root! Please use sudo to run this script!!\a"$RESET
	fi
fi

