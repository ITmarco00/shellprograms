#!/bin/sh

c= #variabile del primo carattere
#controllo del numero di parametri passati 
case $# in 
0|1) echo "Errore: passare due o più parametri"
	exit 1;;
*);;
esac

#controllo il primo carattere 
case $1 in 
?)c=$1;;
*) echo "Il primo parametro deve essere un carattere singolo"
	exit 2;;
esac

shift 

for i in $*
do 
	case $i in 
	/*);;
	*) echo "Il parametro [$i] deve essere un nome assoluto di directory"
		exit 3;;
	esac
done

PATH=`pwd`/$PATH
export PATH

filetemp=/tmp/filetemp_$$
>$filetemp

for i in $*
do
	echo "=== Esploriamo la gerarchia: $i ==="
	FCR7.sh `pwd`/$i $c $filetemp
done

echo "Ho finito"
rm $filetemp
