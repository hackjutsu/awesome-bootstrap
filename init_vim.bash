#!/bin/bash
# @author CosmoX <cosmo.lepton@gmail.com>

MARKER="-----> "
vimrcFile="https://raw.githubusercontent.com/hackjutsu/Cosmo-Configs/master/.vimrc"
colorSchemeFileHybrid="https://raw.githubusercontent.com/w0ng/vim-hybrid/master/colors/hybrid.vim"

pushd .

cd ~

os="`uname`"
case "$OSTYPE" in
  solaris*) os="SOLARIS" ;;
  darwin*)  os="OSX" ;;
  linux*)   os="LINUX" ;;
  bsd*)     os="BSD" ;;
  msys*)    os="WINDOWS" ;;
  *)        os="unknown: $OSTYPE" ;;
esac

if [ $os == "OSX" ]; then
    which -s brew > /dev/null
    if [ $? == 0 ]; then
        echo "Homebrew Exists"
    else
        echo $MARKER "Installing Homebrew..."
        /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)";
    fi

    which -s curl > /dev/null
    if [ $? == 0 ]; then
        echo "curl Exists"
    else
        echo $MARKER "Installing curl..."
        brew install curl
    fi

    which -s vim > /dev/null
    if [ $? == 0 ]; then
        echo "vim Exists"
    else
    echo $MARKER "Installing vim..."
        brew install vim
    fi

elif [ $os == "LINUX" ]; then
    echo "apt-get install curl"
    echo "apt-get install vim"
else
    echo "Platform not supported."
fi

# Create ~/.vim if not exist
if [ ! -d "~/.vim" ]; then
    mkdir ~/.vim
fi

# Download the color scheme
echo $MARKER "Downloading the color scheme..."
curl -fLo ~/.vim/colors/hybrid.vim --create-dirs $colorSchemeFileHybrid

# Sync .vimrc
if [ -f "~/.vimrc" ]; then
    mv ~/.vimrc ~/.vimrc-backup
fi
echo $MARKER "Downloading .vimrc file..."
curl -O $vimrcFile

# Install vim-plug
echo $MARKER "Installing vim-plug..."
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# install vim plugins
echo $MARKER "Installing vim plugins..."
vim +PlugInstall +qall

popd
