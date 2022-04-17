#!/bin/sh
case $# in 
1)echo "Numero giusto di parametri";;
*)echo "Numero elevato di parametri"
	exit 1;;
esac 

case $1 in
/*)echo "Percorso assoluto"
	if test -f $1 
	then  echo "il parametro è un file "
        else if test -d $1 -a -x $1 
		then echo "è una directory ed è traversabile"
		else "non è file o directory"
		fi
	fi
	exit 0;; 
*/*)echo "Percorso relativo"
	exit 0;;
*) echo "Percorso relativo semplice"
	exit 0;;
esac

