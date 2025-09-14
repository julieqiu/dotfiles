rm -f $HOME/.gitconfig
rm -f $HOME/.p10k.zsh
rm -f $HOME/.tmux.conf
rm -f $HOME/.vimrc
rm -f $HOME/.zshrc

rm -rf $HOME/.claude
rm -rf $HOME/.gemini
rm -rf $HOME/.oh-my-zsh
rm -rf $HOME/.tmux

ln -s $HOME/code/dotfiles/config/gitconfig $HOME/.gitconfig
ln -s $HOME/code/dotfiles/config/p10k.zsh $HOME/.p10k.zsh
ln -s $HOME/code/dotfiles/config/tmux.conf $HOME/.tmux.conf
ln -s $HOME/code/dotfiles/config/vimrc $HOME/.vimrc
ln -s $HOME/code/dotfiles/config/zshrc $HOME/.zshrc

mkdir -p $HOME/.gemini
ln -s $HOME/code/dotfiles/aiagent/llm.md $HOME/.gemini/GEMINI.md

mkdir -p $HOME/.claude/commands
ln -s $HOME/code/dotfiles/aiagent/llm.md $HOME/.claude/Claude.md
ln -s $HOME/code/dotfiles/aiagent/ai-dev-tasks/create-prd.md $HOME/.claude/commands/
ln -s $HOME/code/dotfiles/aiagent/ai-dev-tasks/generate-tasks.md $HOME/.claude/commands/
ln -s $HOME/code/dotfiles/aiagent/ai-dev-tasks/process-task-list.md $HOME/.claude/commands/

git clone https://github.com/tmux-plugins/tpm $HOME/.tmux/plugins/tpm
git clone https://github.com/zsh-users/zsh-autosuggestions $HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-history-substring-search $HOME/.oh-my-zsh/custom/plugins/zsh-history-substring-search
git clone https://github.com/zsh-users/zsh-syntax-highlighting $HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
git clone https://github.com/zpm-zsh/clipboard.git $HOME/.oh-my-zsh/custom/plugins/clipboard
