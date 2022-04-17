#!/bin/sh

#mi sposto nella gerarchia corrente
cd $1

nlinee= #numero linee del file 

for i in * 
do 
	if test -f $i -a -r $i
	then 
		nlinee=`wc -l < $i`
		if test $nlinee -ge $2
		then
			if test $nlinee -lt 5
			then 
				>`pwd`/$i.NOquinta
				echo `pwd`/$i.NOquinta >> $3
			else 
				head -5 $i | tail -1 >> `pwd`/$i.quinta
				echo `pwd`/$i.quinta >> $3
			fi
		else 
			>`pwd`/$i.NOquinta
			echo `pwd`/$i.NOquinta >> $3
		fi		
	fi 
done 

#faccio la chiamata ricorsiva 
for i in *
do 
	if test -d $i -a -x $i
	then 
		$0 `pwd`/$i $2 $3
	fi
done
