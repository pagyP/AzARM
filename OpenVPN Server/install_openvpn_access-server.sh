#!/bin/bash
userPassword=$1

#download the packages
#cd /tmp
#wget -c http://swupdate.openvpn.org/as/openvpn-as-2.1.9-Ubuntu16.amd_64.deb

#install the software
#sudo dpkg -i openvpn-as-2.1.9-Ubuntu16.amd_64.deb
sudo su
apt update && apt -y install ca-certificates wget net-tools
wget -qO - https://as-repository.openvpn.net/as-repo-public.gpg | apt-key add -
echo "deb http://as-repository.openvpn.net/as/debian bionic main">/etc/apt/sources.list.d/openvpn-as-repo.list
apt update && apt -y install openvpn-as

#update the password for user openvpn
sudo echo "openvpn:$userPassword"|sudo chpasswd

#configure server network settings
#PUBLICIP=$(curl -s ifconfig.me)
#sudo apt-get install sqlite3
#sudo sqlite3 "/usr/local/openvpn_as/etc/db/config.db" "update config set value='$PUBLICIP' where name='host.name';"

#restart OpenVPN AS service
#sudo systemctl restart openvpnas