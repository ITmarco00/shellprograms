#!/bin/sh
cd $1

filetmp=$2

#sposto tutti i parametri 
shift 
shift


occorrenza=true #contatore per il numero di file 

#scorro tutti gli elementi della directory
for i in *
do 
	if test -f $i -a -r $i #se trovo un file ed è leggibile
	then
		for j in $* #scorro tutti i caratteri 
		do 
			noccorrenze=`grep -o $j < $i | wc -l` #contro le occorenze del carattere
						
			if test $noccorrenze -lt 1
			then occorrenza=false #se trovo anche solo una occrenza minore di uno 
			fi
		done

		if test $occorrenza = true
		then
			echo "`pwd`/$i" >> $filetmp
		fi
	fi
	occorrenza=true
done

#eseguo l'invocazione ricorsiva
for i in *
do 
	if test -d $i -a -x $i #controllo se è una directpry e se è traversabile
	then
		$0 `pwd`/$i $filetmp $*
	fi
done
