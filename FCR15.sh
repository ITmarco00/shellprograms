#!/bin/sh
#comando dir stringa filetmp
cd $1 #mi sposto nella directory corrente 

S=$2
filetmp=$3

for i in *
do
	if test -f $i -a -r $i
	then
		
		nocc=`grep -o $S < $i | wc -l`
		echo "Numero occ per $i: $nocc"
		if test $nocc -gt 0
		then
			echo "`pwd`/$i" >> $filetmp
		fi
	fi 
done

for i in *
do 
	if test -d $i -a -x $i 
	then
		echo "Stiamo entrando in $i"
		$0 `pwd`/$i $S $filetmp
	fi
done
