
# ----------------------------------
# Colors
# ----------------------------------
NOCOLOR='\033[0m'
RED='\033[0;31m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
LIGHTGRAY='\033[0;37m'
DARKGRAY='\033[1;30m'
LIGHTRED='\033[1;31m'
LIGHTGREEN='\033[1;32m'
YELLOW='\033[1;33m'
LIGHTBLUE='\033[1;34m'
LIGHTPURPLE='\033[1;35m'
LIGHTCYAN='\033[1;36m'
WHITE='\033[1;37m'

echo_with_color() {
  echo "$2$1${NOCOLOR}"
}

# ----------------------------------
# Setup
# ----------------------------------

echo_with_color "### Installing Homebrew" $BLUE
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"


echo_with_color "### Installing plugins with brew" $BLUE
brew install cask
brew cask install google-chrome iterm2
brew install jq tree fzf vim macvim htop wget geoip watch python node

# Set up PlugInstall
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
vim +'PlugInstall --sync' +qa

echo_with_color "### Installing ZSH" $BLUE
brew install zsh
$ sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
brew install zsh-syntax-highlighting
brew install zsh-history-substring-search

echo_with_color 'Downloading p10k' $RED
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
echo 'source ~/powerlevel10k/powerlevel10k.zsh-theme' >>! ~/.zshrc

echo_with_color "### Setting up symlinks" $BLUE
-ln -s ~/dotfiles/bashrc ~/.bashrc
-ln -s ~/dotfiles/bash_profile ~/.bash_profile
-ln -s ~/dotfiles/zprofile ~/.zprofile
-ln -s ~/dotfiles/zshrc ~/.zshrc
-ln -s ~/dotfiles/vimrc ~/.vimrc

echo_with_color "### Setting up SSH Key" $BLUE
echo "Host *
  AddKeysToAgent yes
  UseKeychain yes
  IdentityFile ~/.ssh/id_rsa" >> ~/.ssh/config

ssh-keygen -t rsa -b 4096 -C "julieyeqiu@gmail.com"
eval "$(ssh-agent -s)"
ssh-add -K ~/.ssh/id_rsa
pbcopy < ~/.ssh/id_rsa.pub
echo_with_color "### Opening GitHub to add a new SSH Key" $BLUE
open https://github.com/settings/keys
