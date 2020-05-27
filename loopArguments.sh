#!/bin/bash
#echo "Fruit names: " $1 $2 $3 $4 $5

#If there aren't five arguments to the script
if (( $#!=5 )); then
    #Print an error and exit
    echo "Error, provide name of five fruits" && exit 1
fi

while (( "$#" )); do 
  echo "FRUIT: $1" 
  shift 
done