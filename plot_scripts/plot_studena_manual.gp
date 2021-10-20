#!/usr/bin/gnuplot --persist
###  !!File for ploting the water volume of dam Studena for different terms###
#To 
#
#with the command:
/usr/bin/gnuplot -e "Date1='$YMD3';Date2='$YMD4';HPix=1600;PNGFile='/home/rnz/Pictures/Pernik/Razni/studena_manual_months.png'" ~/Pictures/Pernik/scripts/plot_scripts/plot_studena_manual.gp 
#
#To use it like function, the 
# Date1, Date2 
# Hpix horizontal pixels, and  png-file should be defined exernally
#



##Just to control the variables
print "ARG1  is    : ", Date1
print "ARG2  is    : ", Date2
print "Hor_Pixels  are : ", HPix
print "PNG file is : ", PNGFile

#Configuration
set title 'Воден обем язовир Студена (max 25 519 100 куб.м), за 12 м. назад, до днешна дата, по дни'
unset key # not show file path and name on the plot

## The X-axis
set xdata time 
set timefmt "%Y-%m-%d"

set xrange [Date1:Date2] noreverse nowriteback

set xlabel "Дата" offset 0,-3
####set  xtics Date1,2592000,Date2 rotate by 45 center nomirror offset 0,-2    ### an example
set  xtics Date1,2592000,Date2 rotate by 75 center nomirror offset 0,-2
set format x "%d %b %Y"

set mxtics 3
set grid mxtics xtics  lt -1  lt -1

##The Y-axis
set ylabel "Воден обем в млн.куб.м"
set ytics nomirror
set yrange [0:25.519]
set format y "%0.0f"

#set y2label "Percent"
set y2tics out
set y2range [0:100]
set format y2  "%g %%"
set grid y2tics linestyle -1

#Separator
set datafile separator "\t"

##Type of plot X data. Other parameters are put in the 'plot' command - 'with boxes etc'
set boxwidth 0.30 relative 
set style fill   solid 1.0 noborder

##Set PNG file
set terminal png size HPix,400  
set output   PNGFile    #'/home/rnz/Pictures/Pernik/Razni/output.png'  #PNGFile
#set format y "%2.0t{/Symbol \327}10^{%L}" -- variant 
#set datafile /home/rnz/Pictures/Pernik/Razni/test.csv

plot  '/home/rnz/Pictures/Pernik/scripts/plot_scripts/studena_for_plot.csv' using 1:($2/1000000) with boxes lc rgb  "blue"  

################ Working example# plot  '/home/rnz/Pictures/Pernik/Razni/test.csv' using 1:($2/1000000) with boxes lc rgb  "blue"  # , 25519100 lc rgb "red" title "Dam Capacity"
 
