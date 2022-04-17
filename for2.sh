#!/bin/sh
for i in *
do 
	echo "elemento corrente in $i"
	if test -f $i
	then 
		echo "visualizzazione di $i"
		echo "=="
		cat $i
		echo "=="
	else echo "$i è una directory"
	fi
done 

