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
INPUT=$1
HASH=md5sum

InvalidOption() {
    echo -e "Invalid Option! Try again."
}

RenameFileName() {
    SelectCase
    CASE=$?

    for i in *.*
        do
            EXT=$(echo ${i} | tail -c 4 | cut -d "." -f2)
            SHA=$($HASH -b "${i}" | cut -d " " -f1)

            if [ "$CASE" = 1 ];then
                NEWNAME=$(echo "${SHA}.${EXT}" | tr [:upper:] [:lower:])
            else
                NEWNAME=$(echo "${SHA}.${EXT}" | tr [:lower:] [:upper:])
            fi

            mv -vn "${i}" ${NEWNAME}
        done
}

SelectCase() {
    echo -e "\nSelect if you want to rename your file(s) with uppercase or lowercase:"

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

echo "Select the hash:"

select OPT in MD5 SHA1 SHA224 SHA256 SHA384 SHA512

do
    case $OPT in
        "MD5")
            HASH=md5sum
            RenameFileName $OPT
            break;;
        "SHA1")
            HASH=shasum
            RenameFileName $OPT
            break;;
        "SHA224")
            HASH=sha224sum
            RenameFileName $OPT
            break;;
        "SHA256")
            HASH=sha256sum
            RenameFileName $OPT
            break;;
        "SHA384")
            HASH=sha384sum
            RenameFileName $OPT
            break;;
        "SHA512")
            HASH=sha512sum
            RenameFileName $OPT
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
#      do
#              EXT=$(echo -e $i | cut -d "." -f2)
#              SHA=$($HASH -b "$i" | cut -d " " -f1)
#              NEWNAME=$(echo -e "$SHA.$EXT" | tr [:lower:] [:upper:])
#              mv "$i" $NEWNAME -vn >> REPORT.LOG
# done
#
# Generate a CSV file with the sha-sum of all the files
# for i in *.*
#      do
#              SHA="$(sha1sum -b ${i} | cut -d " " -f1), ${i}"
#              echo -e "$SHA"
# done > sha256sum_ouput.csv
