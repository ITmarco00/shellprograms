#!/bin/sh

#controllo nro parametri (stretto)
case $# in
0|1|2) echo "Pochi parametri $# ==> $*"
       echo Usage is: $0 ./DIR.sh
	exit 1;;
3) echo "Numero giusto di parametri $# ==> $*";;
*) echo "Troppi parametri $# ==> $*"
   echo Usage is: $0
	exit 2;;
esac 
 
