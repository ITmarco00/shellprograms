#!/bin/sh
#file di prova 2 FCP.sh

#controllo numero dei parametri 
case $# in 
0|1) echo "Errore, passare un numero di parametri maggiore o uguale a 2"
	exit 1;;
*);;
esac

F= #variabile che contiene il primo parametro
#controllo il primo parametro 
case $1 in 
*/*|/*)echo "Il parametro deve essere un nome relativo semplice"
	exit 2;;
*) F=$1;; #prendo il primo parametro
esac

shift  #sposto i valori 

G= #insieme di gerarchie
#controllo le altre gerarchie 
for i in $*
do
	case $i in 
	/*)
		if test -d `pwd`$i #controllo che sia directory e che sia traversabile
		then G="$G $i"
		else echo "$i non directory o non traversabile"
			exit 4
		fi
		;;
	*) echo "Il parametro $i deve essere nome assoluto di directory"
		exit 3;;
	esac
	
done

#setto la variabile d'ambiente 
PATH=`pwd`:$PATH
export PATH

#creo un file temporaeno
filetmp=/tmp/filetmp_$$
> $filetmp

for i in $G
do 
	FCR.sh `pwd`/$i $F 4 $filetmp #chiamo il fire ricorsivo con la gerarchia e le linee
done

echo "Abbiamo trovato `wc -l < $filetmp` file"

cont=0	#contatore per i file
filename= #file del numero
for i in `cat $filetmp`
do 
	if test `expr $cont % 2` -eq 0
	then 
		echo "File: $i"
		filename=$i
	else
		echo "Inserire un valore numerico: "
		read risposta
		if test $risposta -lt $i
		then
			echo "La riga del file: `head -$risposta < $filename | tail -1`" 
		fi 
	fi
	cont=`expr $cont + 1`
done
cat $filetmp
rm $filetmp
echo "Ho finito tutto"
