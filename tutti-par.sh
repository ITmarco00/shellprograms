#!/bin/sh
case $# in 
1) echo "Numero errato, inserire più di un parametro"
	exit 1;;
*) echo "Ora stamperemo i parametri";;
esac

for i 
do 
	echo "$i è un parametro che hai passato"
done
