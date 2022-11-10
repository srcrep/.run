#!/bin/bash
#
function pause(){
 read -s -n 1 -p "Press "Enter" to logon as root . . ."
 echo ""
}
#
sudo apt update -y &&
#
#google remote
sudo apt install wget tasksel -y &&
wget https://dl.google.com/linux/direct/chrome-remote-desktop_current_amd64.deb &&
sudo apt-get install --assume-yes ./chrome-remote-desktop_current_amd64.deb &&
sudo DEBIAN_FRONTEND=noninteractive \
    apt install --assume-yes dwm suckless-tools surf xrdp &&
sudo bash -c 'echo "exec /etc/X11/dwm" > /etc/chrome-remote-desktop-session' &&
DISPLAY= /opt/google/chrome-remote-desktop/start-host --code="4/0AfgeXvvNZKQaZYY38SDdqHq08oiMmUl50vVPtmKEZLCfH_u0Vm929Jj37zRzcpCiLZSbUg" --redirect-url="https://remotedesktop.google.com/_/oauthredirect" --name=$(hostname) &&
sudo apt upgrade -y &&
pause &&
sudo su
