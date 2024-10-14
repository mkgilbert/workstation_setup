#!/bin/bash

# download and install stuff
echo "Install Homebrew"
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

if [ "$?" != "0" ]; then
	>2 echo "Failed to install homebrew. Exiting" && exit 1
fi

sleep 1

echo "Adding brew to path"
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> $HOME/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"


echo "Installing packages"
brew install --cask visual-studio-code
brew install --cask iterm2
brew install --cask emacs
brew install --cask hammerspoon
brew install --cask pomatez  # pomodoro timer -- go to preferences to allow this app to open
brew install wget
brew install caffeine
brew install tig
brew install shellcheck
brew install tmux
brew install watson
# LXD client (you'll need a Linux VM running to use lxc)
brew install lxc
# The next 2 are for creating gifs from .mov files
brew install ffmpeg
brew install gifsicle
# persistend ssh connection
brew install mosh
# virtual desktop screen for sharing
brew install deskpad

echo "Installing Hammerspoon Clipboard Tool Spoon"
tmp_dir=$(mktemp -d)
pushd $tmp_dir
wget https://github.com/Hammerspoon/Spoons/raw/master/Spoons/ClipboardTool.spoon.zip
unzip ClipboardTool.spoon.zip
cp -r ClipboardTool.spoon $HOME/.hammerspoon/Spoons/
popd
rm -rf $tmp_dir

echo "Installing Spacemacs"
brew tap homebrew/cask-fonts
brew install svn # prereq for font-source-code-pro
brew install --cask font-source-code-pro
git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d

echo "Installing Rust"
xcode-select --install
curl --proto '=https' --tlsv1.2 https://sh.rustup.rs -sSf | sh

echo "Setting up Mac defaults"
defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false

