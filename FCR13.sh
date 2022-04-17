#!/bin/sh
# file ricorsivo del 19 gennaio 2022
cd $1

trovato=false
for i in *
do 
	if test -f $i -a -r $i 
	then 
		ncaratteri=`wc -c < $i`
		if test `expr $ncaratteri` -eq $3
		then
			if test `expr $ncaratteri % $2` -eq 0
			then
				echo "`pwd`/$i" >> $4
				trovato=true
			fi
		fi

	fi

done

if test $trovato = true
then
	echo "`pwd`"
fi

for i in *
do 
	if test -d $i -a -x $i
	then 
		$0 `pwd`/$i $2 $3 $4
	fi
done
