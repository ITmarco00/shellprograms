#!/bin/sh

#controllo del numero di parametri
case $# in 
2) echo "Numero parametri ok $#";;
*) echo "Numero parametri errato, passarne 2"
	 exit 1;;
esac


#controllo del tipo dei parametri 
for i in $*
do 
	case $i in 
	*/*) echo "Il nome di $i dev'essere relativo semplice"
		exit 2;;
	*) echo "Parametro $i ok";;
	esac
done

if test -f $1 -a -r $1
	then
 
		if test -f $2 
			then
				if test -w $2
				then echo "Il secondo file è scrivibile" 
				else 
					if test -w `pwd`
					then echo "La direectory corrente è scrivibile"
					else echo "La directory corrente non è scrivibile"
					fi 
				fi
 
		else echo "il secondo file non esiste"
			exit 4
		fi

else "il file non esiste o non è leggibile"
	exit 3
fi

