#!/bin/bash

directory=/home/$USER

if [[ -d $directory ]]
then
	echo  -e "The $directory directory exits\n"
	cd $directory
	ls -alsh 
else
	echo -e "The $directory does not exits\n"

fi
