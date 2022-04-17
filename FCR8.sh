#!/bin/sh
#comando directory numero file_tmp
cd $1

contl=0 #contatorie eche valuta se ci sono directory
dir=false #contatore dei file 
trovato=true #contatore dei file che soddisfano le specifiche 

for i in *
do 
	if test -d $i 
	then
		dir=true 
	else 
	
		if test -f $i -a -r $i
		then
			contl=`wc -l < $i`
			if test $contl -lt $2
			then trovato=false
			fi	
		fi
	fi
done

#ciclo for per controllare se ci sono direc
if test $trovato = true -a $dir = false
then pwd >> $3
fi
 
#chiamata ricorsiva
for i in *
do 
	if test -d $i -a -x $i
	then
		echo "Entriamo in $i"
		$0 `pwd`/$i $2 $3 
	fi
done

