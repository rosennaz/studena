#!/bin/bash

#Script for storing water volume of dam Studena in CSV file and into MySQL

WDIR="/home/rnz/Pictures/Pernik/scripts"
INFILE=$WDIR/index.html
OFILE=$WDIR/obem_for_mysql.csv
OFILE_CURRENT=$WDIR/obem_for_mysql_current.csv
DATE=`/bin/date  -I`
Yesterday=`/bin/date -d "Yesterday" -I`



cd $WDIR

# Download index.html

/usr/bin/wget -N -t 3  http://www.vik-pernik.eu/ 


#Extracting water volume, influx and outflux data
VOL=`/usr/bin/html2text $INFILE | /bin/grep  "водният_обем" | /usr/bin/awk 'BEGIN {FS=" ";OFS=""}{print $3,$4,$5}'`
INFLUX=`/usr/bin/html2text $INFILE  | /bin/grep  "Отчетени са : приток –" | /usr/bin/awk -F " " '{print $6}'`
OUTFLUX=`/usr/bin/html2text $INFILE  | /bin/grep  "Отчетени са : приток –" | /usr/bin/awk -F " " '{print $11}'`

echo Vol-$VOL,Influx-$INFLUX,Outflux-$OUTFLUX
#Copy extracted values into files
/bin/echo $DATE,$VOL,$INFLUX,$OUTFLUX>$OFILE_CURRENT
/bin/echo $DATE,$VOL,$INFLUX,$OUTFLUX>>$OFILE



#Insert extracted values into database
/usr/bin/mysql studena -se "INSERT INTO volume(Date,Volume,Influx,Outflux,Diff_flux) VALUES('$DATE','$VOL','$INFLUX','$OUTFLUX','0');"



#Calculates real influx by differrence from previous day
VOL1=$(/usr/bin/mysql studena -se "SELECT Volume FROM volume WHERE Date='$Yesterday';")
VOL2=$(/usr/bin/mysql studena -se "SELECT Volume FROM volume WHERE Date='$DATE';")

DIF=`/usr/bin/bc <<< "($VOL2 -  $VOL1)/86.4"`

echo Vol1-$VOL1,Vol2-$VOL2,DIF-$DIF

#Updates database with real influx by differrence from previous day
/usr/bin/mysql studena -se "UPDATE  volume SET Diff_flux = '$DIF' WHERE Date='$DATE';"


