#!/bin/sh
case $# in 
1)echo "Numero giusto di parametri";;
*)echo "Numero elevato di parametri"
	exit 1;;
esac 

case $1 in
/*)echo "Percorso assoluto"
	exit 0;;
*/*)echo "Percorso relativo"
	exit 0;;
*) echo "Percorso relativo semplice"
	exit 0;;
esac

