## Subdomain Finder

Tested on **Kali Linux**

**Description:** This shell script program aims to enumerate all subdomains of a specified domain entered by the user. It's worth mentioning that this script does NOT VALIDATE the found subdomains!! The tool gathers a series of scripts and concatenates the results, removing duplicates.  

**Requirements:** Before running the installation tools and executing the tool, we need to configure our Chaos key in the system. To do this, we need to access the URL https://cloud.projectdiscovery.io/, log in, and save the API key. Now, in Kali Linux, enter the command below: 

```sh
export CHAOS_KEY=YOUR_KEY
```
After that, we can proceed with the steps below.

**Steps:**
```sh
git clone https://github.com/thpereira1/subdomain-finder.git
```
```sh
cd subdomain-finder
```
```sh
chmod +x install.sh && ./install.sh
```
Create a wordlist named 'domain' and insert the domains for which you want to discover subdomains. After that, just run the code below:
```sh
for x in $(cat domain); do subfinder -silent -all -d "$x" >> subdomains && assetfinder -subs-only "$x" >> subdomains && sublist3r -d "$x" -n | grep "$x" | grep -i -v "Enumerating Subdomains" >> subdomains && echo "$x" | waybackurls | cut -d "/" -f 3 >> subdomains && findomain -t "$x" -q >> subdomains && curl -s "https://crt.sh/?q=$x&output=json" | jq -r '.[].name_value' | sed 's/\*\.//g' >> subdomains && curl -s "https://jldc.me/anubis/subdomains/$x" | jq -r '.[]' >> subdomains && chaos -silent -d "$x" >> subdomains && puredns bruteforce subdomains-10000.txt "$x" --resolvers resolvers.txt -q >> subdomains && gau --subs "$x" | cut -d "/" -f 3 >> subdomains && cat subdomains | sort | cut -d ":" -f 1 | grep -v "*" | uniq >> subdomains_final && rm subdomains; done;
```
