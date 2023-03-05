#!/bin/bash

# Check if either a directory of file exists

location=$HOME
file_name="test.txt"


if [[ -e $location ]] 
then
	echo "[+] OK on the $location directory"
	echo "[+] Now checking on the file, $file_name"
	
	if [[ -e $location/$file_name ]] 
	then 
		echo -e "[+] OK on the filename\n"
		echo -e "[+] File with old date"
		ls -alsh $location/$file_name
		echo -e "\n[+] Updating current Date\n"
		date >> $location/$file_name
		echo -e "[+] File wit new date\n"
		ls -alsh $location/$file_name

	else
		echo -e "File does not exist"
		echo -e "Nothing to update"
	fi
else
	echo "The $location directory does not exit"
	echo "Nothing to update"
fi
