#!/bin/sh
cd $1


file= #contengo tutti i file trovati
n= #numero delle linee del file 
for i in *
do 
	if test -f $i
	then 
		n=`wc -l < $i`
		if test $n -eq $2
		then
		 	cat "file">>$HOME/filetrovati.txt
		fi
	fi
done

#for i in $file
#do 
#	echo "Inserire un valore numerico"
#	read num 
#	echo "Hai inserito: 
#$i $num"
#done

for i in *
do 
	if test -d $i -a -x $i
	then 
		echo "Stiamo per esplorare la directory `pwd`/$i"
		$0 `pwd`/$i $2
	fi
done
