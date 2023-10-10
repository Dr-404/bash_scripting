#!/bin/bash
# Script     : location.sh
# Author     : Dr. 404
# Purpose    : for finding location using public IP
# Version    : 1.2.0
# Created Date   : Fri May 12 08:23:48 PM +0630 2023
# Modified Date  :

# Function to display the script banner
function display_banner {
  cat << 'EOF'
   __  ______  _____  ___              __              
  /  |/  / _ \/ ___/ / _ |_______ ____/ /__ __ _  __ __
 / /|_/ / ___/ /__  / __ / __/ _ `/ _  / -_)  ' \/ // /
/_/  /_/_/   \___/ /_/ |_\__/\_,_/\_,_/\__/_/_/_/\_, / 
                                                /___/  

EOF
}

# Function to display script usage
function display_usage {
  cat << EOF
Usage  : $0 [OPTIONS] <url | ip>
Options:
  -h   Show this help message
  -v   Show version information
  -i   IP scan: Specify an IP address to find its location
  -u   URL scan: Specify a URL to find its location
EOF
}

# Function to check the number of arguments passed to the script
function check_arguments {
  if [[ $# -gt 2 || $# == 0 ]]; then
    echo "ERROR: Unknown command $2 $3"
    display_usage
    exit 1


  fi
}

# Function to validate an IP address format
function validate_ip {
  ip_regex='^([0-9]{1,3}\.){3}[0-9]{1,3}$'

  if [[ ! $2 =~ $ip_regex ]]; then
    echo "ERROR: Please enter a valid IP address"
    exit 1
  fi
}

# Function to validate a URL format
function validate_url {
  url_regex='^((http|https):\/\/)?[a-zA-Z0-9.-]+\.[a-zA-Z]{2,6}(:[0-9]{1,5})?(\/.*)?$'

  if [[ ! $2 =~ $url_regex ]]; then
    echo "ERROR: Please enter a valid URL address"
    exit 1
  fi
}

# Function to find the location using ip-api.com API
function find_location {
  local ip=$1
  local url="http://ip-api.com/json/$ip"
  local location=$(curl -s $url)
  
  echo "Your Public IP is: $(echo $location | jq -r '.query')"
  echo "Your Country is: $(echo $location | jq -r '.country')"
  echo "Your Current Geo-Location is: $(echo $location | jq -r '.lat') Lat, $(echo $location | jq -r '.lon') Lon"
  echo "Your Internet is provided by: $(echo $location | jq -r '.isp')"
}

# Main function
function main {
  display_banner
  check_arguments "$@"


  case "$1" in
    -h)
      display_usage
      exit 0
      ;;
    -v)
      echo "Version 1.0"
              exit 0
      ;;
    -i)
      validate_ip "$@"
      find_location "$2"
      exit 0
      ;;
    -u)
      validate_url "$@"
      IP=$(ping -c 1 "$2" | grep -oP '(\d{1,3}\.){3}\d{1,3}' -m 1)
      find_location "$IP"
      exit 0
      ;;
    *)
      echo "Unknown option: $1"
      display_usage
      exit 1
      ;;
  esac
  

}

# Call the main function
main "$@"
exit 0

