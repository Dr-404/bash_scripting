#!/bin/bash
read -p "Type domain name : " domain
read -p "Type wordlist path : " path
# echo $(cat $path)
for sub in $(cat $path); do
host $sub.$domain;done | grep -v "not found" | awk '{print $1}' \
| uniq

