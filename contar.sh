#!/bin/bash

# This variable definition filters the amount of files that starts with "lorem"
lorems=$(ls |grep lorem |wc -l)

# Here we verify if there are files to read by checking if the exit code is equal to 0, then it's correct to proceed execution
ls -l | grep lorem &> /dev/null

if [[ $? == 0 ]]
    then 
     for i in $lorems
        do
        # This variable "amount" stores the quantity of lines
        amount=$(wc -l loremipsum-*)

        # Here we parse the output of "wc" stored in "amount", to match the desired output as the specifications
        # dictate, first comes the filename, second the amount of lines, and "head" takes only the first $i lines
        name=`echo "$amount" | awk '{print $2 " tiene " $1 " lineas" }' | head -$i`

        printf "$name \n"
        done

    else
        echo "Error: no hay archivos para leer"
fi