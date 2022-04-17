#!/bin/sh
#mi sposto nella directory
cd $1

NL= #numero linee
NN= #numero linee con un numero
file= #stringa con i file che soddisfano

for i in *
do 
	if test -f $i -a -r $i #controllo se è un file ed è leggibile 
	then
		NL=`wc -l < $i` #metto il numero di linee
		NN=`grep '[0-9]' $i | wc -l`
		if test $NL -eq $2 -a $NL -eq $NN
		then
			file="$file $i" 
		fi
	fi	
done

if test "$file"
then
	echo "Devo chiamare la parte in c?"
	read risposta
	case $risposta in 
	Y) echo "Ecco i file: $file";;
	*) echo "COntinuo";;
	esac
fi

#chiamata ricorsiva
for i in *
do 
	if test  -d $i -a  -x $i
	then 
		echo "Stiamo per esplorare la directory: `pwd`/$i"
		$0 `pwd`/$i $2
	fi
done

