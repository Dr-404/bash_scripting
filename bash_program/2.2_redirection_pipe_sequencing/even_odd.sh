#!/bin/bash

echo "Type your number "
read num

#read -p "Enter your number : " num

result=$((num%2))


[ $result -eq 0 ] && echo " The number is even number" \
|| echo "The Number is odd number"


