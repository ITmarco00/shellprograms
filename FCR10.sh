#!/bin/sh
#file di prova 2 FRC.sh
#directory nomefile numlinee filetmp
cd $1 #mi sposto nella directory corrente

nlinee= #variabile per il numero linee
for i in *
do 
	if test -f $i -a -r $i #se ho trovato un file ed è leggibile
	then
		case $i in
		$2)
			nlinee=`wc -l < $i`
			if test $nlinee -gt $3
			then
				echo "`pwd`/$i $nlinee" >> $4 #scrivo il file 
			fi
		;;
		*);; 
		esac
	fi
done	

#invoco la chiamata ricorsiva per ogni directory 
for i in *
do 
	if test -d $i -a -x $i
	then
		echo "Stiamo per espolare $i"
		$0 `pwd`/$i $2 $3 $4
	fi
done
