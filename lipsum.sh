#!/bin/bash

for i in {1..5}
do
    # Gets a random line number between 1 and 20
    lineas=$(shuf -i 1-20 -n 1)
    # We call curl using limpsum.com and take as argument the number of lines
    lorem=$(curl -s https://www.lipsum.com/feed/xml\?amount\=$lineas | sed -n '/<lipsum>/,/<\/lipsum>/p' | sed -e 's/<lipsum>//g' -e 's/<\/lipsum>//g'
)   
    # Creates a new file including the content of the variable lorem
    echo "$lorem" >> loremipsum-$i.txt
done