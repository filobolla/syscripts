#!/bin/bash

N=50
I=0.1
targets="192.168.3.2"
mylenshort=$(seq 100 100 1400)
mylenlong=$(seq 1473 1480 40000)

rm *.dat

for host in $targets; do
    echo "Pinging ${host}..."
    for len in $mylenshort 1472 $mylenlong; do
        echo $len >> len${host}.dat
        sudo ping $host -s $len -c $N -i $I | grep min | cut -d'=' -f2 | cut -d'/' -f1 >> rttmin${host}.dat
    done
    paste len${host}.dat rttmin${host}.dat >> all${host}.dat
done