#!/bin/sh
cd $1

for i in *
do 
	if test -f $i -a -r $i -a -w $i 
	then
		case $i in 
		$2.txt) echo `wc -c < $i` `pwd`/$i >>$3;;
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
