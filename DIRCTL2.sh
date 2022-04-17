#!/bin/sh
#file di controllo per DIR.sh
case $# in 

0) echo "NON SONO STATI PASSATI PARAMETRI"
   ls -l | more 
   exit 0;;
1)a=$1;echo '$0 ===>'$0
echo '$1 ===> '$1
if test -d $a
then echo DIRECTORY $a
   ls -l $a
else echo FILE $a
   cat $a
  fi;;
2) echo "TROPPI PARAMETRI, INSERIRE UN SOLO PARAMETRO"
	exit 2;
esac 

