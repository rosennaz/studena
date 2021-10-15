#!/usr/bin/gnuplot --persist
#File for ploting the water volume of dam Studena with example command:
# gnuplot -e "Date1='2021-01-01';Date2='2021-09-22'" ~/Pictures/Pernik/scripts/plot_scripts/plot_studena.gp 
#
#To use it like function, the Date1, Date2 are, and also horizontal pixels, and  png-file should be defined exernally
#





#mysql studena  -se "SELECT Date,Volume FROM volume  ;">/home/rnz/Pictures/Pernik/Razni/test.csv


# the command "test" shows lines end patterns examples

print "ARG1  is    : ", Date1
print "ARG2  is    : ", Date2
print "Hor_Pixels  are : ", HPix
print "PNG file is : ", PNGFile
set title 'Воден обем язовир "Студена"'

## The X-axis
set xdata time 
set timefmt "%Y-%m-%d"

#set xrange ["2019-11-01":"2021-09-23"] noreverse nowriteback
set xrange [Date1:Date2] noreverse nowriteback

set xlabel "Дата"

set  xtics Date1,2592000,Date2 rotate nomirror
set format x "%b %Y"

set grid xtics linestyle -1


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

#set datafile separator {"<char>" | whitespace}

set datafile separator "\t"

unset key # not show file path and name on the plot
set boxwidth 0.3 relative
set style fill  solid 1.0

set terminal png size HPix,400 
set output 'PNGFile'
#set format y "%2.0t{/Symbol \327}10^{%L}" -- variant 
#set datafile /home/rnz/Pictures/Pernik/Razni/test.csv

plot  '/home/rnz/Pictures/Pernik/Razni/test.csv' using 1:($2/1000000) with boxes lc rgb  "blue"  # , 25519100 lc rgb "red" title "Dam Capacity"


# set term png          # size 800,600   (will produce .png output)
#set terminal png size 400,300 enhanced font "Helvetica,20"
#set output 'output.png'

#To save Gnuplot output as JPG format:

#set terminal jpg color enhanced "Helvetica" 20
#set output "output.jpg"


# set output "printme.png" # creates an empty file
# replot                       #and replots all above into it  
