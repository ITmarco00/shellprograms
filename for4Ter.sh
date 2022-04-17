#!/bin/sh

#controllo del numero di parametri passati
case $# in 
1);;
*) echo "Per $0 passare un solo parametro"
	exit 1;;
esac

#controllo sul tipo di parametro passato 
if test -f $1
then	
	#controllo sul tipo di parametro passato 
	case $1 in
	*/*) echo "Il nome del file deve essere relativo semplice"
		exit 2;;
	*);;
	esac

else 	echo "Non è un file"
fi

echo "Eseguo il For4Bis.sh su  $1"
`pwd`/for4Bis.sh $1
