## Subdomain Finder

Tested on **Kali Linux**

**Description:** This shell script program aims to enumerate all subdomains of a specified domain entered by the user. It's worth mentioning that this script DOES VALIDATE the found subdomains!! The tool gathers a series of scripts and concatenates the results, removing duplicates.  

**Requirements:** Before running the installation tools and executing the tool, we need to configure our Chaos key in the system. To do this, we need to access the URL https://cloud.projectdiscovery.io/, log in, and save the API key. Now, in Kali Linux, enter the command below: 

```sh
export CHAOS_KEY=YOUR_KEY
```
After that, we can proceed with the steps below.

**Steps:**
```sh
git clone https://github.com/b1gn0se/subdomain-finder.git
```
```sh
cd subdomain-finder
```
```sh
chmod +x install.sh && ./install.sh
```
Create a wordlist named 'domain' and insert the domains for which you want to discover subdomains. After that, just run the code below:
```sh
chmod +x subdomain.sh && ./subdomain.sh
```
After the program finishes, just check the subdomains_final file.
