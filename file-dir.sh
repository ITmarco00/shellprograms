#|/bin/sh
cd $1

for i in * 
do 
	if test -d $i
	then echo "$i [D]"
	fi 
	
	if test -f $i
	then echo "$i [F]"
	fi
done
