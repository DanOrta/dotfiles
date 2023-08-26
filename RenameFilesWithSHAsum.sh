#!/bin/bash
# We need to check if "dmenu" is installed
var=$(apt list --installed | grep "suckless-tools" | cut -d "/" -f1)
if [ $var = "" ];then
	echo "dmenu is not installed!"
else
	sha=$(echo -e "sha1sum\nsha224sum\nsha256sum\nsha384sum\nsha512sum\nshasum" | dmenu -l 6)
	uplo=$(echo -e "UPPERCASE\nlowercase" | dmenu -l 2)
	if [ $uplo = "UPPERCASE" ];then
		for i in *.*; do newName="$($sha -b $i | cut -d " " -f1).$(echo $i | cut -d "." -f2)"; newName=$(echo -n $newName | tr [:lower:] [:upper:]);  mv $i $newName -vn; done
	else
		for i in *.*; do newName="$($sha -b $i | cut -d " " -f1).$(echo $i | cut -d "." -f2)"; newName=$(echo -n $newName | tr [:upper:] [:lower:]);  mv $i $newName -vn; done
	fi
fi
#for i in *.*; do newName="$(sha1sum -b $i | cut -d " " -f1).$(echo $i | cut -d "." -f2)"; newName=$(echo -n $newName | tr [:lower:] [:upper:]);  mv $i $newName -vn; done
# Generate a report of all the files that were renamed!
# for i in *.*; do newName="$(sha1sum $i | cut -d " " -f1).$(echo $i | cut -d "." -f2)"; newName=$(echo -n $newName | tr [:lower:] [:upper:]);  mv $i $newName -vn >> REPORT.LOG; done
# Generate a CSV file with the sha-sum of all the files
# for i in *.*; do j="$(sha256sum $i | cut -d " " -f1), $i"; echo $j; done > sha256out.csv
