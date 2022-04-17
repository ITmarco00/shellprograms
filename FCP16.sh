#!/bin/sh

case $# in 
0|1) echo "Errore, passare un numero di parametri maggiore o uguale a 2"
	exit 1;;
*);;
esac


G= #variabile che contiene l'insieme delle gerarchie
contparametri=1
for i in $*
do 
	if test $contparametri -eq `expr $# - 1` #controllo se sono al penultimo valore
	then H=$i
	else 
		if test $contparametri -eq $# #controllo se sono all'ultimo valore 
		then M=$i
		else 
				#controllo se il parametro è un nome assoluto di directory 
			case $i in 
			/*) 	#controllo se è una directory e se è traversabile
				if test -d `pwd`$i -a -x `pwd`$i
				then G="$G $i"
				else echo "Il parametro $i non è dir o non è traversabile"
					exit 3
				fi
				;;
			*) echo "Errore, il parametro $contparametri $i deve essere un nome assoluto di directory"
				exit 2;;
			esac
		fi
	fi
	contparametri=`expr $contparametri + 1` #incremento il contatore 
done

#controllo che gli ultimi due numeri siano strettamente positivi 
if test $H -lt 1
then echo "Il penultimo parametro $H deve essere un numero strettamente positivo"
	exit
fi

if test $M -lt 1
then echo "l'ultimo parametro $M deve essere un numero strettamente positivo"
	exit
fi

#setto la variabile d'ambiente e ne faccio export
PATH=`pwd`:$PATH
export PATH

#creo un file temporaneo
filetmp=/tmp/filetmp_$$
> $filetmp



for i in $G
do 
	echo "Gerarchia di $i"
	FCR16.sh `pwd`$i $H $M $filetmp
done

echo "Ho trovato `wc -l < $filetmp` drectory"
rm $filetmp
echo "Ho finito tutto"











