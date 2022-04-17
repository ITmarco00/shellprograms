#!/bin/sh

#controllo il numero di parametri 
case $# in 
1) echo "Numero di parametri corretto $#"
	if test -f $1
	then  cat >> $1 
	else echo "Il parametro non è un file"; exit 1
	fi	

;;
2) echo "Numero di  paraetri corretto $#"
	if test -f $1 -a -f $2
	then 
		cat < $1 >> $2
		echo "Ho messo il contenuto di $1 in $2"
	else echo "Non sono due file"; exit 1
	fi
;;
*) echo "Passare solo due parametri"
	exit 1;;
esac

