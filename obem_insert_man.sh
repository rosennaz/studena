#!/bin/bash
#Script for mysql INSERT

WDIR="/home/rnz/Pictures/Pernik/scripts"
USER=root
PP='Zaq1@wsx'
#INFILE=$WDIR
#OFILE=$WDIR

echo -n "Input the current ID for calculation - "

read ID
IDY=`/usr/bin/bc <<< "$ID-1"`
echo $IDY

DATE=`/bin/date -I`
Yesterday="'"`/bin/date -d "Yesterday" -I`"'"
cd $WDIR

#Extracting water volume, influx and outflux data
VOL=`/usr/bin/html2text $WDIR/index.html | /bin/grep  ""водният_обем"" | /usr/bin/awk 'BEGIN {FS=" ";OFS=""}{print $3,$4,$5}'`
INFLUX=`/usr/bin/html2text $WDIR/index.html | /bin/grep  ""приток"" | /usr/bin/awk -F " " '{print $6}'`
OUTFLUX=`/usr/bin/html2text $WDIR/index.html | /bin/grep  ""приток"" | /usr/bin/awk -F " " '{print $11}'`

#Insert current data into database
mysql studena -u $USER -p$PP -se "INSERT INTO WATER_VOLUME(Date,Volume,Influx,Ourflux,Diff_flux) VALUES('$DATE','$VOL','$INFLUX','$OUTFLUX','0');"



#Calculates real influx by differrence from previous day
VOL1=$(mysql studena -u $USER -p$PP -se "SELECT Volume FROM WATER_VOLUME WHERE id="$IDY";")
VOL2=$(mysql studena -u $USER -p$PP -se "SELECT Volume FROM WATER_VOLUME WHERE id="$ID";")

DIF=`/usr/bin/bc <<< "($VOL2 -  $VOL1)/86.4"`

echo $VOL1, $VOL2
echo $DIF





mysql studena -u $USER -p$PP -se "UPDATE  WATER_VOLUME SET Diff_flux = '$DIF' WHERE id='$ID';"

