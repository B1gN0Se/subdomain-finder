#!/bin/bash

# ANSI Colors
yellow='\033[1;33m'
reset='\033[0m'

# Check if the correct number of arguments has been provided
if [ $# -ne 1 ]; then
    echo -e "${yellow}------------------------------${reset}"
    echo -e "${yellow}Created by Thiago Pereira${reset}"
    echo ""
    echo -e "${yellow}Usage: $0 <domain>${reset}"
    echo -e "${yellow}------------------------------${reset}"
    exit 1
fi

# Get the domain from the command line argument
domain="$1"

echo -e "${yellow}#####################################################${reset}"
echo -e "${yellow}The script is fetching the subdomains, please wait.${reset}"
echo -e "${yellow}#####################################################${reset}"

# Execute the subfinder command with the provided domain
subfinder -silent -d "$domain" >> subfinder &

# Execute the assetfinder command with the provided domain
assetfinder -subs-only "$domain" >> assetfinder &

# Execute the sublist3r command with the provided domain, suppressing output
sublist3r -d "$domain" -o sublist3r > /dev/null 2>&1 &

# Execute the waybackurls command with the provided domain
echo "$domain" | waybackurls | cut -d "/" -f 3 >> waybackurls &

# Wait for all processes to finish
wait

echo -e "\n${yellow}Processing completed.${reset}"
