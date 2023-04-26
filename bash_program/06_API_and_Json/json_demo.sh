#!/bin/bash
# Script		: json_demo.sh
# Author		: Dr. 404
# Purpose		: To Demonstrate json data usage
# Version		: 1.0.0
# Created Date	: Wed Apr 26 12:36:36 AM +0630 2023
# Modified Date	:



json=$(cat json_data.json)

echo "This is normal json : " 
echo $json

echo  "This is json using jq command"

echo $json | jq .