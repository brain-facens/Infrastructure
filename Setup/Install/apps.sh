#APPS INSTALLATION

echo "UPDATE"
echo
sudo apt update

echo

echo "INSTALLING GIT"
echo
sudo add-apt-repository ppa:git-core/ppa
sudo apt update
sudo apt install git

echo

echo "INSTALLING CURL"
echo
sudo apt install curl

echo

echo "INSTALLING GPARTED"
echo
sudo apt install gparted

echo

echo "INSTALLING HTOP"
echo
sudo apt install htop

echo

echo "INSTALLING ZOOM"
echo
cd ~/Downloads/
sudo apt install ./zoom_amd64.deb

echo

echo "INSTALLING DISCORD"
echo
sudo apt install ./discord-0.0.18.deb 

echo

echo "INSTALLING VISUAL STUDIO CODE"
echo
sudo apt install ./code_1.68.1-1655263094_amd64.deb

echo "REBOOTING"
reboot