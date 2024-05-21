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
# File: RenameFilesWithSHAsum.sh
# Description: With this script in conjuction with the "dmenu" tool, you can select a specifi hash
# and change the file name with it. Available hashes:
# MD5*
# SHA1*
# SHA224
# SHA256
# SHA384
# SHA512
# * Use these hashes with precaution, since they aren't secure and are known to have collisions.
# ##################################################################################################
# We need to check if "dmenu" is installed
# Colors:
RESET='\033[00m'
RED='\033[01;31m'
# Available hashes:
AVAILABLE_HASHES="md5sum\nsha1sum\nsha224sum\nsha256sum\nsha384sum\nsha512sum"

if command -v dmenu >/dev/null 2>&1;then
	HASH=$(echo -e "${AVAILABLE_HASHES}" | dmenu -b)
	CASE=$(echo -e "lowercase\nUPPERCASE" | dmenu -b)
	if [ "${CASE}" = "UPPERCASE" ]; then
		# Be careful here: we only look for files with an extension and no dots in its name.
		# If your file doesn't match the pattern, feel free to adapt it.
       if [ "${1}" = "" ];then
            for i in *.*
	    		do
		    		EXT=$(echo -e $i | tail -c 4 | cut -d "." -f2)
			    	SHA=$($HASH -b "${i}" | cut -d " " -f1)
				    NEWNAME=$(echo -e "${SHA}.${EXT}" | tr [:lower:] [:upper:])
    				mv "${i}" $NEWNAME -vn
	            done
        else
            EXT=$(echo -e $1 | tail -c 4 | cut -d "." -f2)
            SHA=$($HASH -b "${1}" | cut -d " " -f1)
            NEWNAME=$(echo -e "${SHA}.${EXT}" | tr [:lower:] [:upper:])
            mv -vn "${1}" $NEWNAME
        fi
	else
        if [ "${1}" = "" ];then
            for i in *.*
			    do
				    EXT=$(echo -e $i | tail -c 4 | cut -d "." -f2)
    				SHA=$($HASH -b "${i}" | cut -d " " -f1)
	    			NEWNAME=$(echo -e "${SHA}.${EXT}" | tr [:upper:] [:lower:])
		    		mv "${i}" $NEWNAME -vn
		        done
        else
            EXT=$(echo -e $1 | tail -c 4 | cut -d "." -f2)
            SHA=$($HASH -b "${1}" | cut -d " " -f1)
            NEWNAME=$(echo -e "${SHA}.${EXT}" | tr [:upper:] [:lower:])
            mv -vn "${1}" $NEWNAME
        fi
	fi
else
	echo -e "${RED}dmenu is not installed!${RESET}"
fi

# ##################################################################################################
# Alternative Options:
#
# Generate a report of all the files that were renamed!
# for i in *.*
# 	do
# 		EXT=$(echo -e $i | cut -d "." -f2)
# 		SHA=$($HASH -b "$i" | cut -d " " -f1)
# 		NEWNAME=$(echo -e "$SHA.$EXT" | tr [:lower:] [:upper:])
# 		mv "$i" $NEWNAME -vn >> REPORT.LOG
# done
#
# Generate a CSV file with the sha-sum of all the files
# for i in *.*
# 	do
# 		SHA="$(sha1sum -b ${i} | cut -d " " -f1), ${i}"
# 		echo -e "$SHA"
# done > sha256sum_ouput.csv
