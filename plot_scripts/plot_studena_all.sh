#!/usr/bin/gnuplot -persist
#File for ploting the water volume of dam Studena till to the current day


#mysql studena  -se "SELECT Date,Volume FROM volume  ;">/home/rnz/Pictures/Pernik/Razni/test.csv


# the command "test" shows lines end patterns examples


set title 'Воден обем язовир "Студена"'

set xdata time 
set timefmt "%Y-%m-%d"

set xrange ["2019-11-01":"2021-07-01"] noreverse nowriteback

set xlabel "Дата"
set xtics rotate
set format x "%b %Y"

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
set boxwidth 0.5
set style fill 


#set format y "%2.0t{/Symbol \327}10^{%L}" -- variant 
#set datafile /home/rnz/Pictures/Pernik/Razni/test.csv
plot  '/home/rnz/Pictures/Pernik/Razni/test.csv' using 1:($2/1000000) with boxes lc rgb  "blue"  # , 25519100 lc rgb "red" title "Dam Capacity"


# set term png          # size 800,600   (will produce .png output)
# set output "printme.png" # creates an empty file
# replot                       #and replots all above into it  
