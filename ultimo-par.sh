#!/bin/sh 
count=0

for i 
do
	count=`expr $count + 1`
	if test $count -ne $#
	then
		LIST="$LIST $i"
	else 
		LAST=$i
	fi
done

echo "Utlimo parametro: $LAST"
echo "Lista senza l'ultimo: $LIST"
