#!/usr/bin/gnuplot -persist


set title "Water volume of dam Studena"
set xrange [1:400]
set yrange [1:25000000]
set xrange [ "2019-11-01" : "2020-09-01" ] noreverse nowriteback
plot '20200916_studena_for_graph.csv' using 1:3 with lines
