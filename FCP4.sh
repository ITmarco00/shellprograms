#!/bin/sh

#controllo il numero di parametri 
if test $# -lt 2 
then echo "Errore: passare un numero maggiore o uguale a due di parametri"
	exit 1
fi

#controllo del primo parametro passato 
if test -f $1 -o -d $1
then echo "Errore: il primo parametro deve essere un numero"
	exit 2
else 
	
	if test $1 -lt 1
	then echo "Errore: il primo parametro deve essere un numero strettamente positivo"
		exit 3
	fi 
fi

#salvo il primo parametro passato
n=$1
shift

#controllo gli altri parametri passati 
for i in $*
do 
	case $i in 
	./*);;
	*) echo "Il parametro [$i] deve essere un nome assoluto di directory"
		exit 4;;
	esac
done

#creo il file temporaneo
> /tmp/conta_$$

PATH=`pwd`:$PATH
export PATH

#vado ad esplorare ogni gerarchia passata
for i in $*
do 
	FCR4.sh $i $n /tmp/conta_$$
done

echo `wc -l /tmp/conta_$$`
echo "HO FINITO TUTTO"
rm /tmp/conta_$$
