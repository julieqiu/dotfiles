rm -f $HOME/.gitconfig
rm -f $HOME/.p10k.zsh
rm -f $HOME/.vimrc
rm -f $HOME/.zshrc
rm -f $HOME/.tmux
rm -f $HOME/.tmux.conf
ln -s $HOME/dotfiles/config/gitconfig ~/.gitconfig
ln -s $HOME/dotfiles/config/p10k.zsh ~/.p10k.zsh
ln -s $HOME/dotfiles/config/tmux.conf ~/.tmux.conf
ln -s $HOME/dotfiles/config/vimrc ~/.vimrc
ln -s $HOME/dotfiles/config/zshrc ~/.zshrc
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
git clone https://github.com/zsh-users/zsh-autosuggestions $HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-history-substring-search $HOME/.oh-my-zsh/custom/plugins/zsh-history-substring-search
git clone https://github.com/zsh-users/zsh-syntax-highlighting $HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
git clone https://github.com/zpm-zsh/clipboard.git $HOME/.oh-my-zsh/custom/plugins/clipboard
