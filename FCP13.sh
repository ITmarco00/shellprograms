#!/bin/sh
#prova del 19 gennaio 2022

#controllo il numero dei parametri 
case $# in 
0|1) echo "Errore, passare almeno due parametri [numd] [nump] [dir]"
	exit 1;;
*);;
esac

#controllo il primo parametro
C= #numero dispari
if test $1 -gt 0
then 
	if test `expr $1 % 2` -eq 0
	then echo "Il primo parametro $1 deve essere un valore dispari"
		exit 3
	else C=$1
	fi
else echo "Errore, passare un valore positivo nella posizione 1"
	exit 2
fi

#controllo il secondo parametro
X= #numero pari
if test $2 -gt 0
then
	if test `expr $2 % 2` -ne 0
	then echo "Il parametro $2 deve essere un valore pari"
		exit 5
	else X=$2
	fi
else echo "Errore, passare un valore positivo nella posizione 2"
	exit 4
fi

#tolgo i primi due valori
shift 
shift

G= #insieme di gerarchie
for i in $*
do
 	case $i in 
	/*) 	#controllo che sia directory e sia traversabile
		if test ! -d `pwd`/$i -a ! -x `pwd`/$i
		then echo "$i non directory o non traversabile"
			exit 7
		else G="$G $i"
		fi
	;;
	*) echo "Il parametro $i deve essere un nome assoluto di directory"
		exit 6;;
	esac
done

PATH=`pwd`:$PATH
export PATH

#creo un file temporaneo per i nomi dei file
filetmp=/tmp/file_tmp$$
> $filetmp


for i in $G
do
	FCR13.sh `pwd`$i $C $X $filetmp 
	
done

echo "Ho trovato `wc -l < $filetmp` file"
rm $filetmp
echo "Ho finito"
