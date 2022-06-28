#!/bin/bash

# download and install stuff
echo "Install Homebrew"
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

if [ "$?" != "0" ]; then
	>2 echo "Failed to install homebrew. Exiting" && exit 1
fi

sleep 1

echo "Adding brew to path"
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> /Users/mgilbert/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"


echo "Installing packages"
brew install --cask visual-studio-code
brew install --cask iterm2
brew install --cask emacs
brew install wget
brew install caffeine
brew install tig
brew install shellcheck

echo "Installing oh-my-zsh"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
mkdir ~/.oh-my-zsh/custom/plugins
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
sed -i s'/robbyrussell/geoffgarside/' ~/.zshrc

echo "Installing Spacemacs"
brew tap homebrew/cask-fonts
brew install svn # prereq for font-source-code-pro
brew install --cask font-source-code-pro
git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d
