#!/bin/bash
# Script		: location.sh
# Author		: Dr. 404
# Purpose		: for finding location using public IP
# Version		: 1.0.0
# Created Date	: Fri May 12 08:23:48 PM +0630 2023
# Modified Date	:



# For checking argument
# More than 2 argument , Give Error message and usage


cat << 'EOF'

   __  ______  _____  __               __  _             _____        __       
  /  |/  / _ \/ ___/ / / ___ _______ _/ /_(____  ___    / __(____ ___/ ___ ____
 / /|_/ / ___/ /__  / /_/ _ / __/ _ `/ __/ / _ \/ _ \  / _// / _ / _  / -_/ __/
/_/  /_/_/   \___/ /____\___\__/\_,_/\__/_/\___/_//_/ /_/ /_/_//_\_,_/\__/_/
                                                         Dr. Htun Aung Kyaw

EOF

function checking_argument {
	

	if [ $# -gt 2 ]; then
		echo -e "ERROR : unknown command $2 $3\n"
		usage
		exit 0
	fi
}


# Usage function for help and option usage
function usage {
  echo "Usage: $0 [OPTIONS] <url | ip>"
  echo "Options:"
  echo "  -h   Show this help message"
  echo "  -v   Show version information"
  echo "  -i   IP scan  : Type IP to find location"
  echo "  -u   URL scan : Type url to find location"
  exit 0
}





# For checking -i option is ip address or not
function checking_ip {
  ip_regex='^([0-9]{1,3}\.){3}[0-9]{1,3}$'

# Regex can only be use with `=~` Operator
  if [[ ! $2 =~ $ip_regex ]]; then
    echo -e "ERROR : Please enter a valid IP address\n"
    exit 0
  fi
}
# For checking -u option is url or not

function checking_url {
  ip_regex='^([0-9]{1,3}\.){3}[0-9]{1,3}$'

# Regex can only be use with `=~` Operator
  if [[  $2 =~ $ip_regex ]]; then
    echo -e "ERROR : Please enter a valid URL address\n"
    exit 0
  fi
}



# Location finder option using ip-api.com API

function location_finder {	
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
}

# Checking option and main function
function main {

	checking_argument "$@"
	while [[ $# -lt 3 ]]; do
	  case "$1" in
	    -h)
			usage
	      ;;
	    -v)
	      	echo "Version 1.0"
	      	exit 0
	      ;;
	    -u)
			checking_url "$@"
			IP=$(ping -c 1 $2 | grep -oP '(\d{1,3}\.){3}\d{1,3}' -m 1) 
			location_finder
			exit 0
			;;
		-i)
			checking_ip "$@"
			IP=$2
			location_finder
			exit 0
		 ;;
	    *)
	      echo "Unknown option: $1"
	      usage
	      ;;
	  esac
	  shift
	done
}

# Calling all function 


main "$@"
exit 0


