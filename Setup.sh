#!/bin/bash

if ["$UID" -ne 10]; then
    echo "Running this script requires root permission! command:sudo ./Setup.sh"
    exit 1
fi


echo "Before running this code please change NVDIA driver version and python3 to the newest versions"

read -p "If you updated this config file with latest versions press enter to continue"

echo "Installing nvidia driver"
cd ~/Downloads
curl https://us.download.nvidia.com/XFree86/Linux-x86_64/550.120/NVIDIA-Linux-x86_64-550.120.run -o NVIDIA-Linux-x86_64-550.120.run
chmod +x ./NVIDIA-Linux-x86_64-550.120.run
sudo ./NVIDIA-Linux-x86_64-550.120.run
sudo apt install terminator
echo "Updating and upgrading packages"
sudo apt update && sudo apt upgrade -y


echo "Installing few python modules"

sudo apt install python3-pip

sudo apt install python3.13-torch python3.13-requests python3.13-sockets python3.13-scapy python3.13-django python3.13-numpy python3.13-pandas


echo "Installing brave browser "
sudo apt install curl

sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg

echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list

sudo apt update

sudo apt install brave-browser


echo "Installing nodejs and npm "

sudo apt install nodejs and npm

echo "Installing rustup"
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
chmod +x ~/.cargo/env
~/.cargo/env

echo "installing go"
curl https://dl.google.com/go/go1.23.2.linux-amd64.tar.gz -o ./go1.23.2.linux-amd64.tar.gz
tar -xvf ./go1.23.2.linux-amd64.tar.gz 
mv ./go /opt

echo "export PATH =\"$PATH:/opt/go/bin\""

echo "Adding Kali repo for tools"
sudo sh -c "echo 'deb https://http.kali.org/kali kali-rolling main non-free contrib' > /etc/apt/sources.list.d/kali.list"
sudo apt install gnupg

curl https://archive.kali.org/archive-key.asc -o archive-key.asc
sudo chmod 777 /opt
mv ./archive-key.asc /opt
sudo apt-key add /opt/archive-key.asc

echo "Updating repo after adding kali"
sudo apt update

echo "Installing basic tools"
sudo apt install burpsuite nmap wordlists seclists john hashcat dirbuster dirb 

echo "Installing few extension for firefox and brave :) "
curl https://github.com/darkreader/darkreader/releases/download/v4.9.95/darkreader-firefox.xpi -o darkreader-firefox.xpi


firefox --install-addon ~/Downloads/darkreader-firefox.xpi



echo -e "\033[1;31mDo never, I mean ever type sudo apt upgrade since we added kali, all the default ubuntu libraries will change to kali and you will brick your os !\033[0m"
source ~/.bashrc