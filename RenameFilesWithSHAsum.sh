#!/bin/bash
# We need to check if "dmenu" is installed
RESET='\033[00m'
RED='\033[01;31m'
VAR=$(whereis dmenu)
if [ "$VAR" == "dmenu:" ];then
	echo -e $RED"dmenu is not installed!"$RESET
else
	HASH=$(echo -e "md5sum\nsha1sum\nsha224sum\nsha256sum\nsha384sum\nsha512sum\nshasum" | dmenu -l 6)
	uplo=$(echo -e "UPPERCASE\nlowercase" | dmenu -l 2)
	if [ $uplo = "UPPERCASE" ];then
        for i in *.*;do EXT=$(echo $i | cut -d "." -f2);SHA=$($HASH -b "$i" | cut -d " " -f1);NEWNAME=$(echo "$SHA.$EXT" | tr [:lower:] [:upper:]);mv "$i" $NEWNAME -vn;done
	else
        for i in *.*;do EXT=$(echo $i | cut -d "." -f2);SHA=$($HASH -b "$i" | cut -d " " -f1);NEWNAME=$(echo "$SHA.$EXT" | tr [:upper:] [:lower:]);mv "$i" $NEWNAME -vn;done
	fi
fi
# Alternative Options:
#
# Generate a report of all the files that were renamed!
# for i in *.*;do EXT=$(echo $i | cut -d "." -f2);SHA=$($HASH -b "$i" | cut -d " " -f1);NEWNAME=$(echo "$SHA.$EXT" | tr [:lower:] [:upper:]);mv "$i" $NEWNAME -vn >> REPORT.LOG;done
#
# Generate a CSV file with the sha-sum of all the files
# for i in *.*;do SHA="$(sha1sum -b ${i} | cut -d " " -f1), ${i}";echo "$SHA";done > sha256sum_ouput.csv
