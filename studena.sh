#!/bin/bash

#Script for downloading the data for water volume of dam Studena

WDIR="/home/rnz/Pictures/Pernik/scripts"
cd $WDIR
/bin/echo `/bin/date +%Y%m%d_%H:%Mh` >>$WDIR/obem_studena.txt
/usr/bin/wget -N -t 3  http://www.vik-pernik.eu/ 
/usr/bin/html2text  $WDIR/index.html | grep -A 10  -B 1 "водният_обем" >> $WDIR/obem_studena.txt


#VOL=`/usr/bin/html2text index.html | grep  ""водният_обем"" | awk -F " " '{print $3, $4, $5}'`


