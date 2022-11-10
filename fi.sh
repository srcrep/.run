#!/bin/bash
function pause(){
 read -s -n 1 -p "Press "Enter" to logon as root . . ."
 echo ""
}
sudo apt update -y &&
sudo apt install dwm suckless-tools surf xrdp -y &&
sudo apt upgrade -y &&
pause &&
sudo su
