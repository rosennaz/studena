#!/bin/bash
#Script for SQL query DB studena and plotting the results
#Static VARs
SRCDIR="/home/rnz/Pictures/Pernik/scripts/plot_scripts"
OUTDIR="/home/rnz/Music/JPGs"


#Dinamic VARS picture 1
YMD1="2020-09-15"
YMD2=`/bin/date +%Y-%m-%d`
PNGFILE=$SRCDIR/
mysql studena  -se "SELECT Date,Volume FROM volume  ;">/home/rnz/Pictures/Pernik/Razni/test.csv 

#/bin/bash plot_studena_all


 #gnuplot -e "Date1='2021-01-01';Date2='2021-09-22'" plot_studena.gp 
 /usr/bin/gnuplot -e "Date1='$YMD1';Date2='$YMD2';HPix=1200;PNGFile='/home/rnz/Pictures/Pernik/Razni/output.png'" ~/Pictures/Pernik/scripts/plot_scripts/plot_studena.gp 


