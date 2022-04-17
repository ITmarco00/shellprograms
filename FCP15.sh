#!/bin/sh

#controllo il numero dei parametri iniziale
case $# in 
0|1) echo "Errore, passare almento due parametri"
	exit 1;;
*);;
esac

#memorizzo la prima stringa 
S=$1
shift 

#controllo gli altri parametri
G= #insieme delle gerarchie  
for i in $*
do
	case $i in 
	/*) #controllo che sia directory e che sia traversabile
		if test ! -d `pwd`$i -a ! -x `pwd`$i 
		then echo "Errore, il parametro $i non è directory o non è traversabile"
			exit 3
		else G="$G $i"
		fi 
	;;
	*) echo "Errore, il parametro $i deve essere un nome assoluto di directory"
		exit 2;;
	esac
done

#vado a settare la variabile d'ambinte
PATH=`pwd`:$PATH
export PATH

filetmp=/tmp/file$$
> $filetmp

for i in $G
do 
	FCR15.sh `pwd`/$i $S $filetmp
done

cat $filetmp
echo "Ho trovato `wc -l < $filetmp` file che contengono la stringa"
rm $filetmp
echo "Ho finito"


