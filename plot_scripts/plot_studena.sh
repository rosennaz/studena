#!/usr/bin/gnuplot -persist
#File for ploting the water volume of dam Studena till to the current day


#mysql studena  -se "SELECT Date,Volume FROM volume  ;">test.csv


set title "Water volume of dam Studena"

set xdata time
set timefmt "%Y-%m-%d"

set xrange ["2019-11-01":"2020-10-01"] noreverse nowriteback


#set datafile separator {"<char>" | whitespace}

set datafile separator "\t"

set boxwidth 0.5
set style fill solid
set xtics rotate
set yrange [0:26000000]
set format y "%5.0f"
#set format y "%2.0t{/Symbol \327}10^{%L}" -- variant 
plot '/home/rnz/Pictures/Pernik/Razni/test.csv' using 1:2 with boxes lc rgb  "blue" 

#gnuplot> set term png             (will produce .png output)
#gnuplot> set output "printme.png" 
