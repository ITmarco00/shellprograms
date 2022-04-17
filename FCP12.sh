#!/bin/sh
#controllo il numero dei parametri 
case $# in 
0|1) echo "Errore, passare almeno 2 parametri"
	exit 1;;
*);;
esac

#controllo del primo parametro 
case $1 in 
/*)
	#controllo che sia directory e traversabile 
	if test ! -d `pwd`$1 -a ! -x `pwd`$1
	then
		echo "Il parametro $1 non è dir o non è traversabile"
		exit 3
	fi
;; 
*) echo "Errore, passare un nome assoluto di directori"
	exit 2;;
esac

#memorizzo la gerarchia
G=$1
shift 

C= #insieme dei caratteri
#controllo gli altri parametri 
for i in $*
do 
	case $i in 
	?)C="$C $i";;
	*) echo "Il parametro $i deve essere un singolo carattere"
	esac
done

#setto la variabile d'ambiente
PATH=`pwd`:$PATH
export PATH

filetmp=/tmp/file_tmp$$
> $filetmp #creo un file temporaneo per i percorsi di tutti i file

FCR12.sh `pwd`/$G $filetmp $C

echo "Ecco i file che ho trovato:"
cat $filetmp 
rm $filetmp
echo "Ho finito"


