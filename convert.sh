#!/bin/bash

k=0
for i in $(cat sizes)
do
    k=$(expr $k + 1)
    for j in $(ls -A | grep .svg | sort -g)
    do
        flatpak run org.inkscape.Inkscape -z -e "qr-codes/$(echo $k)_$(echo $j | cut -f1 -d.).png" -w $i -h $i $j
    done
done
