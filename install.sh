#!/bin/bash

apt update

apt install golang-go -y

go install -v github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest
mv /root/go/bin/subfinder /usr/bin/

apt install sublist3r -y

go install -v github.com/tomnomnom/assetfinder@latest
mv /root/go/bin/assetfinder /usr/bin/

go install -v github.com/tomnomnom/waybackurls@latest
mv /root/go/bin/waybackurls /usr/bin/

go install -v github.com/tomnomnom/anew@latest
mv /root/go/bin/anew /usr/bin/

go install -v github.com/projectdiscovery/chaos-client/cmd/chaos@latest
mv /root/go/bin/chaos /usr/bin/

curl -LO https://github.com/findomain/findomain/releases/latest/download/findomain-linux-i386.zip
unzip findomain-linux-i386.zip
chmod +x findomain
mv findomain /usr/bin/
rm findomain-linux-i386.zip

go install github.com/d3mondev/puredns/v2@latest
mv /root/go/bin/puredns /usr/bin/

apt install jq -y

git clone https://github.com/blechschmidt/massdns.git
cd massdns
make
make install
cd ..
rm massdns
