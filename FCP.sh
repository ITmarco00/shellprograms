#!/bin/sh

#controllo il numero di parametri passati
case $# in 
1);;
*) echo "Passare solo un parametro per il comando: $0 [dir]"
	exit 1;;
esac

#controllo il tipo di parametri passati 
case $1 in 
./*);;
*) echo "Il parametro deve essere il nome assoluto di una dir"
	exit 2;;
esac

if test ! -x $1
then 
	echo "Directory non traversabile"
	exit 3 
fi

file-dir.sh $1
