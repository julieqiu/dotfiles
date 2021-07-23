rm -f $HOME/.gitconfig
rm -f $HOME/.p10k.zsh
rm -f $HOME/.vimrc
rm -f $HOME/.zshrc
rm -f $HOME/.tmux
ln -s $HOME/dotfiles/config/gitconfig ~/.gitconfig
ln -s $HOME/dotfiles/config/p10k.zsh ~/.p10k.zsh
ln -s $HOME/dotfiles/config/tmux ~/.tmux
ln -s $HOME/dotfiles/config/vimrc ~/.vimrc
ln -s $HOME/dotfiles/config/zshrc ~/.zshrc
