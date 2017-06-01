#!/bin/bash
# @author CosmoX <cosmo.lepton@gmail.com>

pushd . > /dev/null ;
cd ~

MARKER="-----> "
vimrcFile="https://raw.githubusercontent.com/hackjutsu/Cosmo-Configs/master/.vimrc"

# ---------- Color Schemes ----------
colorscheme_hybrid="https://raw.githubusercontent.com/w0ng/vim-hybrid/master/colors/hybrid.vim"
colorscheme_crayon="https://raw.githubusercontent.com/jansenfuller/crayon/master/colors/crayon.vim"
colorscheme_happy_hacking="https://github.com/YorickPeterse/happy_hacking.vim/blob/master/colors/happy_hacking.vim"

colorschemes=(
    $colorscheme_hybrid
    $colorscheme_crayon
    $colorscheme_happy_hacking
)


# ---------- Decide the host OS ----------
os="`uname`"
case "$OSTYPE" in
  solaris*) os="SOLARIS" ;;
  darwin*)  os="OSX" ;;
  linux*)   os="LINUX" ;;
  bsd*)     os="BSD" ;;
  msys*)    os="WINDOWS" ;;
  *)        os="unknown: $OSTYPE" ;;
esac


# ---------- Download scaffold tools ----------
if [ $os == "OSX" ]; then
    which -s brew > /dev/null
    if [ $? == 0 ]; then
        echo $MARKER "Homebrew exists"
    else
        echo $MARKER "Installing Homebrew..."
        /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)";
    fi

    which -s curl > /dev/null
    if [ $? == 0 ]; then
        echo $MARKER "curl exists"
    else
        echo $MARKER "Installing curl..."
        brew install curl
    fi

    which -s vim > /dev/null
    if [ $? == 0 ]; then
        echo $MARKER "vim exists"
    else
    echo $MARKER "Installing vim..."
        brew install vim
    fi

    which -s ag > /dev/null
    if [ $? == 0 ]; then
        echo $MARKER "The Silver Searcher exists"
    else
    echo $MARKER "Installing the silver searcher..."
        brew install the_silver_searcher
    fi

elif [ $os == "LINUX" ]; then
    # Assuming we are in Ubuntu...
    apt-get install curl
    apt-get install vim
    apt-get install silversearcher-ag
else
    echo "Platform not supported."
fi


# ---------- Create ~/.vim if not exist ----------
if [ ! -d "$HOME/.vim" ]; then
    echo $MARKER "Creating the .vim directory..."
    mkdir ~/.vim
fi


# ---------- Download color schemes ----------
pushd . > /dev/null
if [ ! -d "$HOME/.vim/colors" ]; then
    echo $MARKER "Creating the ~/.vim/colors directory..."
    mkdir -p ~/.vim/colors
fi
cd ~/.vim/colors

echo $MARKER "Downloading the color schemes..."
for colorscheme in "${colorschemes[@]}"; do
    echo $MARKER "Downloading $colorscheme"
	curl -O $colorscheme
done
popd > /dev/null


# ---------- Download .vimrc ----------
if [ -f "$HOME/.vimrc" ]; then
    echo $MARKER "Backing up the old .vimrc as .vimrc-backup..."
    mv ~/.vimrc ~/.vimrc-backup
fi
echo $MARKER "Downloading .vimrc file..."
curl -O $vimrcFile


# ---------- Install plugin manager: vim-plug ----------
echo $MARKER "Installing plugin manager: vim-plug..."
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim


# ---------- Install vim plugins ----------
echo $MARKER "Installing vim plugins..."
vim +PlugInstall +qall


popd > /dev/null
