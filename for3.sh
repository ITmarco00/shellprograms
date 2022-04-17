#!/bin/sh

for i in p*
do 
	echo "ELEMENTO CORRENTE: $i"
	if test -f $i
	then 
		echo "Visualizzazione di $i"
		echo "==="
		cat $i
		echo "==="
	else 	
		echo "Il file è una directory"
	fi
done
