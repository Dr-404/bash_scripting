#!/bin/bash
# Script		: while_loop.sh
# Author		: Dr. 404
# Purpose		: Explaining while loop using algorithm
# Version		: 
# Created Date	: Wed Mar 15 02:56:37 PM +0630 2023
# Modified Date	: 


# Store user input into $num variable

read -p "Enter Your Number: " num
: '
# If statement

if [[ $num -lt 5 ]]
then
	echo "Hello World from it statement"
	num=$[ $num + 1 ]
	echo $num

fi

'

# While Statement

while [[ $num -lt 5 ]]
do
	echo "Hello World from while Statement"
	num=$[ $num + 1]
	echo $num
done




