#!/bin/sh

#controllo il numero di parametri 
case $# in 
0|1) echo "Erroe, passare un numero di parametri maggiore o uguale a 2"
	exit 1;;
	
*);;
esac

#controllo il primo parametri 
C= #variabile che contiene il primo carattere 
case $1 in 
?)C=$1;;
*) echo "Il primo parametro deve essere un singolo carattere"
	exit 2;;
esac

#traslo i parametri 
shift 

#controllo gli altri 
G= #insieme delle gerarchie
for i in $*
do 
	case $i in
	/*) #controllo che sua una directory e che sia traversabie
		if test -d `pwd`$i -a -x `pwd`$i
		then G="$G $i"
		else	echo "Errore, il parametro $i non è directory o non è traversabile"
			exit 4
		fi;;
	*) echo "Il parametro $i deve essere un nome assoluto di directory"
		exit 3;;
	esac
done

#setto la variabile d'ambiente PATH
PATH=`pwd`:$PATH
export PATH

#creo un file temporaneo per salvare le directory trovate
filetmp=/tmp/file_$$
> $filetmp

for i in $G
do 
	FCR14.sh `pwd`$i $C $filetmp 
done

echo "Ecco le directory che ho trovato: "
cat $filetmp
echo "Sono `wc -l < $filetmp`"
rm $filetmp
echo "Ho finito tutto"


