#!/bin/sh
#dir filetmp 

#mi sposto nella directory 

cd $1

for i in *
do 
	if test -d `pwd`/$i -a -x `pwd`/$i
	then
		echo "Stiamo entrando in $i"
		echo "`pwd`/$i" >> $2
		$0 `pwd`/$i $2 
	fi
done 
