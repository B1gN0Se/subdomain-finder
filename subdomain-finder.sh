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
sublist3r -d "$domain" >> sublist3r &

# Execute the waybackurls command with the provided domain
echo "$domain" | waybackurls | cut -d "/" -f 3 >> waybackurls &

# Execute the findomain command with the provided domain
findomain -t "$domain" -q >> findomain

# Execute the puredns command with the provided domain
puredns bruteforce subdomains-10000.txt "$domain" --resolvers resolvers.txt -q >> puredns &

# Wait for all processes to finish
wait

#echo ""
#echo ""
#echo -e "${yellow}#####################################################${reset}"
#echo -e "\n${yellow}juntando subdominios e removendo duplicados${reset}"
#echo -e "${yellow}#####################################################${reset}"
#cat subfinder | anew subdomains.txt > /dev/null &
#wait
#rm subfinder
#cat assetfinder | anew subdomains.txt > /dev/null &
#wait
#rm assetfinder
#cat sublist3r | anew subdomains.txt > /dev/null &
#wait
#rm sublist3r
#cat waybackurls | anew subdomains.txt > /dev/null &
#wait
#rm waybackurls
#cat findomain | anew subdomains.txt > /dev/null &
#wait
#rm findomain
#cat puredns | anew subdomains.txt > /dev/null &
#wait
#rm puredns

#echo ""
#echo ""
#echo -e "${yellow}#####################################################${reset}"
#echo -e "\n${yellow}pegando o codigo para cada subdominio${reset}"
#echo -e "${yellow}#####################################################${reset}"

#cat subdomains.txt | httpx_bug -silent -status-code >> output.txt
#wait
#rm subdomains.txt

#echo ""
#echo ""
#echo -e "${yellow}#####################################################${reset}"
#echo -e "\n${yellow}Processing completed.${reset}"
#echo -e "${yellow}#####################################################${reset}"
