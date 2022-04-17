#!/bin/sh
c=0
for i in `cat $1`
do 
	c=`expr $c + 1`
	if test `expr $c % 2` -eq 1
	then 
		echo "elemento dispari, quindi nome di file $i"
		if test -f $i
		then cat $i
		fi
	else 
		echo "Elemento pari, quindi lunghezza in linee del file appena visualizzato"
	fi
done
