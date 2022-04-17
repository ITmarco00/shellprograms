#!/bin/sh

#controllo il numero dei parametri 
case $# in 
0|1) echo "Errore, passare un numero maggiore o ugulale a due di parametri"
	exit 1;;
*);;
esac
laststringa=0
#prendo l'ultimo parametro 
count=1 #contatore per l'ultimo parametro 

for i in $*
do 	
	if test $count -eq $#
	then 
		laststringa=$i #prendo l'ultimo parametro
	else
		case $i in 
		/*);;
		*) echo "il $count parametro non è un nome assoluto di directory"
			exit 2;; 
		esac
	fi
	count=`expr $count + 1`
done

PATH=`pwd`:$PATH
export PATH

#creao il file temporaneo per salvare le info 
filetemp=/tmp/filetemp_$$
>$filetemp

count=1
for i in $*
do
	if test $count -eq $#
	then echo "Ho finito tutto"
	else 
		echo ""
		echo "===== $i ===="
		FCR6.sh `pwd`/$i $laststringa $filetemp
	fi
	count=`expr $count + 1`
done

#cat $filetmp
cat $filetemp
count=1
for i in `cat  $filetemp`
do
	if test `expr $count % 2` -eq 0
	then 
		echo "Vuoi ordinare il file:  $i ?"
		read risposta
		case $risposta in 
		Y*|y*) echo "Riordino il file"
			echo `sort -f<$i`>$i  
			echo "====="
			cat $i
			echo "=====";;
		N*|n*) echo "Non riordinerò il file";;
		esac
	fi
	count=`expr $count + 1` 
done
rm $filetemp
