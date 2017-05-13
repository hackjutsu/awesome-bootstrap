#!/usr/bin/env bash

# Install utilities
## curl
echo -e "\n\n-----> Installing curl"
echo "------------------------"
sudo apt -y install curl
## git
echo -e "\n\n-----> Installing git"
echo "------------------------"
sudo apt -y install git
## zsh
echo -e "\n\n-----> Installing zsh"
echo "------------------------"
sudo apt -y install zsh
sudo chsh -s $(which zsh)

# -----> Install Flatabulous Theme for Ubuntu <-----
## https://github.com/anmoljagetia/Flatabulous
## 1. Install Ubuntu Tweak
echo -e "\n\n-----> Installing Ubuntu Tweak"
echo "------------------------"
sudo apt-get -y install unity-tweak-tool
wget -q -O - http://archive.getdeb.net/getdeb-archive.key | sudo apt-key add -
sudo sh -c "echo "deb http://archive.getdeb.net/ubuntu xenial-getdeb apps" >> /etc/apt/sources.list.d/getdeb.list"
sudo apt-get update
sudo apt-get -y install ubuntu-tweak

## 2. Install Flatabulous Theme
echo -e "\n\n-----> Installing Flatabulous Theme"
echo "------------------------"
sudo add-apt-repository -y ppa:noobslab/themes
sudo apt-get update
sudo apt-get -y install flatabulous-theme

## 3. Install Flat Icons
echo -e "\n\n-----> Installing Flat Icons"
echo "------------------------"
sudo add-apt-repository -y ppa:noobslab/icons
sudo apt-get update
sudo apt-get -y install ultra-flat-icons

# -----> Install Oracle JDK 8 <-----
echo -e "\n\n-----> Installing JDK 8 in /usr/lib/jvm/java-8-oracle"
echo "------------------------"
sudo add-apt-repository ppa:webupd8team/java -y
sudo apt-get update -y
sudo echo -e debconf shared/accepted-oracle-license-v1-1 select true | sudo debconf-set-selections
sudo echo -e debconf shared/accepted-oracle-license-v1-1 seen true | sudo debconf-set-selections
sudo apt-get install -y oracle-jdk8-installer -y
sudo apt-get install oracle-java8-set-default -y
export JAVA_HOME=/usr/lib/jvm/java-8-oracle/
export PATH=$JAVA_HOME/bin:$PATH

# -----> Install Maven <-----
echo -e "\n\n-----> Installing Maven"
echo "------------------------"
sudo apt install -y maven

# -----> Install PIP <-----
echo -e "\n\n-----> Installing PIP"
echo "------------------------"
sudo apt-get -f install python-pip -y

# -----> Install Chrome <-----
echo -e "\n\n-----> Installing Chrome"
echo "------------------------"
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb -P /tmp
sudo dpkg -i /tmp/google-chrome*
sudo apt-get -f install -y
rm /tmp/google*chrome*.deb

# -----> Install VS Code <-----
echo -e "\n\n-----> Installing VS Code"
echo "------------------------"
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
sudo mv microsoft.gpg /etc/apt/trusted.gpg.d/microsoft.gpg
sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
sudo apt-get update
sudo apt-get install -y code # or code-insiders

# -----> Install oh-my-zsh <-----
## https://github.com/robbyrussell/oh-my-zsh
echo -e "\n\n-----> Installing oh-my-zsh"
echo "------------------------"
sudo rm -rf ~/.oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
