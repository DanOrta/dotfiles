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
RESET='\033[00m'
RED='\033[01;31m'
GREEN='\033[01;32m'
CYAN='\033[01;36m'

# TODO: Implement the script to accept several files as input
INPUT=$1

InvalidOption() {
    echo -e "${RED}Invalid option! Try again.${RESET}"
}

RenameFileName() {
    SelectCase
    CASE=${?}

    for i in *.*
        do
            EXT=$(echo -n ${i} | tail -c 4 | cut -d "." -f2)
            SHA=$(${1} -b "${i}" | cut -d " " -f1)

            if [ "${CASE}" = 1 ];then
                NEWNAME=$(echo -n "${SHA}.${EXT}" | tr [:upper:] [:lower:])
            else
                NEWNAME=$(echo -n "${SHA}.${EXT}" | tr [:lower:] [:upper:])
            fi

            echo -en "${CYAN}"
            mv -vn "${i}" ${NEWNAME}
            echo -en "${RESET}"
        done
}

SelectCase() {
    echo -e "${GREEN}\nSelect if you want to rename your file(s) with uppercase or lowercase:${RESET}"

    select CASE in lowercase UPPERCASE

    do
        case $CASE in
            "lowercase")
                return 1;;
            "UPPERCASE")
                return 2;;
            *)
                InvalidOption;;
        esac
    done
}

# ##################################################################################################
echo -e "${GREEN}Select the hash:${RESET}"

select OPT in MD5 SHA1 SHA224 SHA256 SHA384 SHA512

do
    case $OPT in
        "MD5")
            RenameFileName md5sum
            break;;
        "SHA1")
            RenameFileName shasum
            break;;
        "SHA224")
            RenameFileName sha224sum
            break;;
        "SHA256")
            RenameFileName sha256sum
            break;;
        "SHA384")
            RenameFileName sha384sum
            break;;
        "SHA512")
            RenameFileName sha512sum
            break;;
        *)
            InvalidOption;;
    esac
done

# ##################################################################################################
# Alternative Options:
#
# Generate a report of all the files that were renamed!
# for i in *.*
#   do
#       EXT=$(echo -e ${i} | cut -d "." -f2)
#       SHA=$(${1} -b "${i}" | cut -d " " -f1)
#       NEWNAME=$(echo "${SHA}.${EXT}" | tr [:lower:] [:upper:])
#       mv "${i}" ${NEWNAME} -vn >> REPORT.LOG
# done
#
# Generate a CSV file with the sha-sum of all the files
# for i in *.*
#   do
#       SHA="$(sha1sum -b ${i} | cut -d " " -f1), ${i}"
#       echo -e "${SHA}"
# done > sha256sum_ouput.csv
