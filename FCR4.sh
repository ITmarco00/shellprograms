#!/bin/sh

#mi sposto nella directory corrente
cd $1

count= #contatore che contiene i file che soddisfano
n= #numero di linee
for i in *
do 
	if test -f $i
	then 
		echo "Trovato file $i"
		n=`grep 't' $i| wc -l`
		echo "Numero linee di $i : $n"
		if test $n -eq $2
		then echo `pwd`/$i >> $3 
		fi  
	fi
done


#eseguo la chiamata ricorsiva 
for i in *
do 
	if test -d $i -a -x $i
	then
		echo "Visualizziamo $i"
		$0 `pwd`/$i $2 
	fi
done
