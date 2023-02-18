#!/bin/bash

echo "Enter Your Name"
read name

if [[ $name == "Bob" ]]
then
	echo "Hi Bob"
else
	echo "Hi stranger"
fi
