#!/bin/bash

date | awk '{print "Today is : " $2 "  "  $3" ","  " $1 " , " $4 " Myanmar Time" }' && 
who | awk '{print "Current User is : " $1}' &&  
cat /etc/os-release | grep PRETTY_NAME | sed 's/.*="\(.*\)"/\1/' | awk '{print "You are using " $1 " Linux"}'
ifconfig | grep inet | awk '{print "Your IP address is "$2}' | grep 192 &&
ifconfig | grep -E "ether.*1000" | awk '{print "Your Mac Address is " $2}'
