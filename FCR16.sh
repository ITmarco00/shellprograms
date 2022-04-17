
#!/bin/sh
#comando dir h m filetmp
cd $1 #mi sposto nella directory corrente 
echo "Siamo in $1"

H=$2
M=$3
filetmp=$4

cont=0 #contatore per i file
for F in *
do 
	if test -f `pwd`/$F -a -r `pwd`/$F #controllo se è un file e se è leggibile
	then
		case $F in 
		??) #ha il nome di due caratteri
			nlinee=`wc -l < $F`
			echo "$nlinee di $F $M"
			if test $nlinee -eq $M
			then cont=`expr $cont + 1`
			fi
		;;
		*);;
		esac
	fi 
done

echo "$cont"
if test $cont -gt 1 #se il numero di file trovati è maggiore o uguale di 2
then 
	if test $cont -lt $H #se il numero di file trovati è minore di H
	then
		pwd >> $filetmp #scrivo il nome della directory nel file temporaneo 
	fi
fi


for i in *
do 
	if test -d `pwd`/$i -a -x `pwd`/$i #se è directory e se è traversabile 
	then	
		$0 `pwd`/$i $H $M $filetmp
	fi 
done
