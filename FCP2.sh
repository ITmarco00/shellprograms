#!/bin/sh

#controllo il numero dei parametri
case $# in 
2);;
*) echo "Numero parametri errato, $0 [dir] number"
	exit 1;;
esac

#controllo il primo parametro 
case $1 in
./*);;
*) echo "Il parametro [dir] deve contenere un nome assoluto"
	exit 2;;
esac

#controllo il secondo parametro
if test ! -d $2 -a ! -f $2
then
		if test $2 -lt 0
		then echo "Il parametro [number] deve essere intero positivo"
		exit 3
		fi
else 
	echo "Il secondo parametro deve essere un numero intero positivo"
fi

PATH=`pwd`:$PATH
export PATH

FCR2.sh $1 $2
