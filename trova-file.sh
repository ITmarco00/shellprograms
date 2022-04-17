#!/bin/sh
#controllo numero parametri
if test $# -ne 1 #se non è uguale a 1
	then echo "hai passato più parametri";
exit 1;
fi
#controllo del parametro passato
case $1 in
/*) echo "IL PARAMETRO È IN FORMA ASSOLUTA"
	if test -d $1
		then echo "IL PARAMETRO È UNA DIRECTORY"
		else if test -f $1
			then echo "IL PARAMETRO È UN FILE"
			else echo "IL PARAMETRO NON È NIENTE"
		fi
	fi;;
*/*)echo "IL PARAMETRO È IN FORMA RELATIVA";;
*) echo "IL PARAMETRO È IN FORMA RELATIVA SEMPLICE";;
esac

