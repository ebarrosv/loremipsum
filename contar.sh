#!/bin/bash

lorems=$(ls |grep lorem |wc -l)

for i in $lorems
do
    amount=$(wc -l loremipsum-*)
    name=`echo "$amount" | awk '{print $2 " tiene " $1 " lineas " }' | head -$i`
    echo $name
done