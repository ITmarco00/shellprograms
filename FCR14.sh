#!/bin/sh
#comando dir char filetmp
cd $1
C=$2
filetmp=$3

for i in *
do 
	if test -d `pwd`/$i
	then
		case $i in 
		?$C?)
			pwd >> $filetmp;; 
		*);;
		esac
	fi
done


for i in *
do 
	if test -d $i -a -x $i
	then
		echo "Stiamo esplorando $i"
		$0 `pwd`/$i $C $filetmp
	fi
done
