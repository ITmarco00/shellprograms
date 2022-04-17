#!/bin/sh

case $# in 
0) echo "$# non sono il numero giusto di parametri, usa: $0 file1 [file2 file3 file4]"
	exit 1;;
1) echo "$# non sono il numero giusto di parametri, usa: $0 file1 [file2 file3 file4]"
	exit 1;;
*);;
esac

for i 
do 
	if test ! -f $1 -o ! -r $1
	then echo "Errore: $1 non file oppure non leggibile"
		exit 2
	fi 

	echo -n "Vuoi visualizzare $i ?" > /dev/tty
	read risposta 
	
	case $risposta in 
	S* | s*) ls -la $i; cat $i;;
	N*|n*) echo "Niente stampa di $i";;
	esac
done 


