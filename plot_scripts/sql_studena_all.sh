#!/bin/bash
#Script for SQL query DB studena and plotting the results


#Static VARs
#WORKDIR="/home/rnz/Pictures/Pernik/scrpts"
#OUTDIR="/home/rnz/Music/JPGs"

mysql studena  -se "SELECT Date,Volume FROM volume  ;">/home/rnz/Pictures/Pernik/scripts/plot_scripts/studena_for_plot.csv     

#Dinamic VARS picture 1 Whole registered period
YMD1="2019-11-15"
YMD2=`/bin/date +%Y-%m-%d`

#gnuplot -e "Date1='2020-05-01';Date2='2021-10-17'" plot_studena.gp 
/usr/bin/gnuplot -e "Date1='$YMD1';Date2='$YMD2';HPix=1400;PNGFile='/home/rnz/Music/JPGs/studena_full.png'" ~/Pictures/Pernik/scripts/plot_scripts/plot_studena_all.gp 

#Dinamic VARS picture 2 - 12 months
YMD3=`/bin/date -d'-12 month' +%Y-%m-%d`
YMD4=`/bin/date +%Y-%m-%d`
/usr/bin/gnuplot -e "Date1='$YMD3';Date2='$YMD4';HPix=1600;PNGFile='/home/rnz/Music/JPGs/studena_12month.png'" ~/Pictures/Pernik/scripts/plot_scripts/plot_studena_12m.gp 
