#!/bin/sh

#controllo il numero di parametri passato
case $# in 
2);;
*) echo "Numero parametri errato, passare [dir] [number]"
	exit 1;;
esac

#controllo il primo parametro 
case $1 in 
./*);;
*) echo "Il primo parametro deve essere un nome assoluto di directory"
	exit 2;;
esac

#controllo il secondo parametro 
if test $2 -lt 0
then echo "Il parametro passato deve essere un numero positivo"
	exit 3
fi

#setto la variabile PATH
PATH=`pwd`:$PATH
export PATH

#invoco il file ricorsivo 
FCR3.sh $1 $2
echo "Ho finito"
