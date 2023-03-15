#!/bin/bash
# Script		: for_loop.sh
# Author		: Dr. 404
# Purpose		: To explain for loop
# Version		: 
# Created Date	: Wed Mar 15 04:03:58 PM +0630 2023
# Modified Date	: 


read -p "Enter Your Number " num
for (( i=$num; i <5; i++ ))
do
	echo "Hello World"
	echo $i
done