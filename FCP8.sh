#!/bin/sh

#controllo il numero dei parametri
case $# in 
0|1) echo "Numero errato di parametri, passarne almeno 2"
	exit 1;;
*);;
esac

#prendo lultimo parametro e controllo gli altri 
count=1
n= #variabile che contiene l'ultimo parametro numerico
params= #variabile che contiene tutti i parametri tranne l'ultimo  
for i in $*
do 
	if test $count -eq $#
	then
	  	n=`expr $i + 0`
	  	if test $n -ne 2 -a $n -ne 3
	  	then 
			if test $i -le 0
				then echo "$i non strettamente positivo"
				exit 2
				else n=$i
			fi
	 	else 
			echo "$i non numerico"
			exit 3
		fi
	else 
		case $i in 
		/*) echo "parametro ok"
			params="$params $i";;
		*) echo "Il parametro non ha un percorso assoluto";;
		esac
	fi
	
	count=`expr $count + 1`
done

#setto la variabile PATH
PATH=`pwd`:$PATH
export PATH

#creo un file temporaneo per le info 
filetmp=/tmp/conta_$$
> $filetmp

for i in $params
do 
	echo "Esploriamo $i"
	FCR8.sh `pwd`/$i $n $filetmp
done

for i in `cat < $filetmp`
do
	echo "Ho trovato la directory $i"
	cd $i 
	for file in *
	do
		echo "file: `pwd`/$file"
		echo "La cui linea $n-esima è la seguentee:"
		echo "`tail -$n $file | head -1`"
	done
done

echo "Ho finito"
cat $filetmp
rm $filetmp
