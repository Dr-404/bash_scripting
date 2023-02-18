#!/bin/bash

echo "Enter Your Name"
read name

if [[ $name == "Bob" ]] 
then
	echo "Hi Bob"
elif [[ $name == "Alice" ]]
then
	echo "Hi Alice"
else
	echo "Your are not Bob or Alice!"
fi

