#!/bin/sh

num= #variabile che contiene il primo parametro

#controllo del numero dei parametri 
case $# in 
0|1) echo "Passare due o più parametri [num] [G1 G2 ... Gn]"
	exit 1;;
*);;
esac


#controllo il primo parametro 
if test $1 -lt 1
then echo "Inserire un numero intero positivo come primo parametro"
	exit 2
fi

num=$1
shift #tolgo il primo parametro e controllo le gerarchie 

#controllo i restanti parametri passati 
for i in $*
do 
	case $i in 
	./*) if test ! -d $i -a ! -x $i
		then echo "Non è una cartella traversabile"
	 	fi;;
	*) echo "Per il parametro $i bisogna specificare un nome assoluto"
		exit 3;;
	esac	
done 

PATH=`pwd`:$PATH
export PATH

#creo il file temporaneo

filetemp=/tmp/filetemp_$$
> $filetemp

for i in $*
do
	echo "========= $i ========" 
	FCR5.sh $i $num $filetemp
done

echo "Ho finito"
cat < $filetemp
rm $filetemp

