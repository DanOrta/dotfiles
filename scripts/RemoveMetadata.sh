#!/bin/bash
# ##################################################################################################
# MIT License
#
# Copyright (c) 2024 DanOrta
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
# File: RemoveMetada.sh
# Description: Using the tool 'exiftool', this script will allow you to remove the metadata from
# images within a folder (not recursive).
# ##################################################################################################
# Definition of color:
RESET='\033[00m'
RED='\033[01;31m'
GREEN='\033[01;32m'
STATUS=0
# First, we need to check if exiftool is installed!
if command -v exiftool >/dev/null 2>&1;then
    # We start the loop in here
    for i in *.*
        do
            echo -e "${GREEN}Processing file: ${i}${RESET}"
            exiftool -all= -overwrite_original -P $i
            echo
        done
    echo -en "${RESET}"
else
    echo -e "${RED}Exiftool is not installed! Script cannot be executed.\n${RESET}Go to: https://exiftool.org to install it."
fi
