#!/bin/bash
# Script		: caseTest.sh
# Author		: Dr. 404
# Purpose		: For testing case command
# Version		: 1.0
# Created Date	: Wed Mar 15 02:05:07 PM +0630 2023
# Modified Date	: 

read -p "Enter Your number : " num

: '
# if Statement

if [[ $num -eq 1 ]]
then
	echo "Hello"
	echo "This is 1"

elif [[ $num -eq 2 ]]

then
	echo "Hello"
	echo "This is 2"

elif [[ $num -eq 3 ]]
then
	echo "Hello"
	echo "This is 3"
else
	echo "Not Valid"
fi'

# Case Statement


case $num in 
1) 	echo "Hello"
	echo "This is 1 wiht case" ;;
2)	echo "Hello"
	echo "This is 2 with case" ;;
3) 	echo "Hello"
	echo "This is 3 with case" ;;
*) 	echo "Not Valid with case"
esac
