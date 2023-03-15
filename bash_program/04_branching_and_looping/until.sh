#!/bin/bash
# Script		: until.sh
# Author		: Dr. 404
# Purpose		: until loop explain
# Version		: 
# Created Date	: Wed Mar 15 03:33:18 PM +0630 2023
# Modified Date	: 


# Until Loop work while condition is FALSE
read -p "Enter Your Number : " num
until [[ $num -gt 5 ]]
do
	echo "Hello World from while Statement"
	num=$[ $num + 1 ]
	echo $num
done
