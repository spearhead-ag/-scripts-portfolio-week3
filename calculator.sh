#!/bin/bash
#set -x
Blue='\033\e[34m'
Green='\033\e[32m'
Red='\033\e[31m'
Purple='\033\e[35m'
Cyan='\033\e[36m'
White='\033\e[97m'

read -p "Enter first number: " num1 
read -p "Enter second number : " num2
echo $'\n'

#prints color coded selection
echo -e "${Blue} 1. Addition"
echo -e "${Green} 2. Subtraction" 
echo -e "${Red} 3. Multiplication"
echo -e "${Purple} 4. Division ${White}"
#enter blank line
echo $'\n'

#choose option
read -p "Enter option: " choice

case $choice in
  1)ans=$(($num1 + $num2))
  ;; 
  2)ans=$(($num1 - $num2)) 
  ;; 
  3)ans=$(($num1 * $num2)) 
  ;; 
  4)ans=$(($num1 / $num2)) 
  ;;
  *)
  echo "Invalid entry."
  ;;
esac
echo "The answer is : $ans"