#!/usr/bin/bash

read -p "Enter your public IP : " IP
url="http://ip-api.com/json/$IP"


ip=$(curl -s $url | jq -r '.query')
country=$(curl -s $url | jq -r '.country')
lat=$(curl -s $url | jq -r '.lat')
lon=$(curl -s $url | jq -r '.lon')
isp=$(curl -s $url | jq -r '.isp')





echo "Your Public IP is : "$ip
echo "Your Country is : "$country
echo "Your Current Geo-Location is : "$lat "Lat ",$lon "Lon"
echo "Your Internet is provided by : "$isp
