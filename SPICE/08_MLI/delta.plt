
# This file is used to generate a plot that explains the 
# principle of the delta pwm

# graph configuration
#set terminal postscript eps enhanced "Times-Roman" 24 color solid
set terminal png size 1000,800 enhanced font "Times-Roman,24"


set encoding utf8
#iso_8859_15
unset title
#set linetype 1 lt 3 lw 3 pt 0 ps 0
#set linetype 2 lt 2 lw 1 pt 0 ps 0
#set linetype 3 lt 8 lw 2 pt 0 ps 0
#set linetype 4 lt 4 lw 3 pt 0 ps 0

set style line 1 lt 3 lw 3 pt 0 ps 0                                           
set style line 2 lt 2 lw 1 pt 0 ps 0                                           
set style line 3 lt 8 lw 2 pt 0 ps 0
set style line 4 lt 4 lw 3 pt 0 ps 0 

set border 15 lt 7 lw 4

set grid xtics ytics
set xlabel ""
set format x ""
set bmargin 0
set tmargin 0
  
set ytics ("0" 0)
set xtics (0,"" 0.8,"" 1.18,"" 2.46,"" 2.89,"" 3.7800000000000002,"" 4.29,"" 4.94,"" 5.58,"" 6.11,"" 6.98,"" 7.42,"" 8.67,"" 9.05,"" 10.64,"" 11.02,"" 12.35,"" 12.780000000000001,"" 13.700000000000001,"" 14.21,"" 14.88,"" 15.51,"" 16.04,"" 16.88,"" 17.32,"" 18.53,"" 18.92)  

set output "delta.png"
set multiplot
        set ylabel "Analog signals"
        set origin 0,0.54
        set size 1,0.45
        plot [0:19][-1.2:1.2] "data.dat" using 1:6 ls 3 title 'Reference' w l,        '' using 1:4 w l ls 2 title 'Limits',        '' using 1:5 w l ls 2 title '',        '' using 1:3 w l ls 1 title 'Output'

        set ytics ("0" 0, "1" 1)
        set ylabel "PWM signal"
        set xlabel "Time"
        set origin 0,0.09
        plot [0:19][-0.25:1.25] 'data.dat' using 1:2 ls 4 title '' w l
unset multiplot 