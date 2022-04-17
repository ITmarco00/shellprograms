#!/bin/sh

#controllo il numero di parametri e il tipo
case $# in 
1) 
	#controllo se è nome assoluto 
	case $1 in 
	/*)	#controllo se è directory e se è traversabile 
		if test ! -d `pwd`$1 -a ! -x `pwd`$1
		then echo "Il parametro non è directory o non è traversabile"
			exit 3 
		fi
		;;
	*) echo "Errore, il parametro $1 deve essere nome assoluto di directory"
		exit 2;;
	esac;;
*) echo "Errore, passare solo un parametro [dir]"
	exit 1;;
esac

#setto la variabile d'ambiente 
PATH=`pwd`:$PATH
export PATH

#creo un file temporaneo per le directory
filetmp=/tmp/file_tmp$$
> $filetmp

pwd >> $filetmp #scrivo la radice 

FCR11.sh `pwd`/$1 $filetmp

echo -n "La gerarchia ha: "

numlivelli=`wc -l < $filetmp`
echo "$numlivelli livelli"

echo -n "Inserire un valore pari: "
read val 

if test `expr $val % 2` -eq 0
then 
	if test $val -lt $numlivelli
	then 
		dir=`head -$val < $filetmp | tail -1`
		ls -l $dir		
	fi 
else echo "Numero non pari"
fi

rm $filetmp

