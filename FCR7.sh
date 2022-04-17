#!/bin/sh
cd $1

for i in *
do 
	if test -d $i
	then
		case $i in 
		$2?$2) echo `pwd`/$i >> $3;;
		*);;
		esac
	fi
done 

for i in *
do 
	if test -d $i -a -x $i
	then 
	$0 `pwd`/$i $2 $3
	fi

done
