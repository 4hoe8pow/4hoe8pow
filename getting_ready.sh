#!/bin/bash

# Install necessary packages
sudo apt update
sudo apt -y install fish exa ripgrep fzf

# Install fisher
curl https://git.io/fisher --create-dirs -sLo ~/.config/fish/functions/fisher.fish
# shell theme
fish -c "fisher install oh-my-fish/theme-bobthefish"
# z(alt cd)
fish -c "install jethrokuan/z"

# Set up aliases and configurations in Fish shell
echo "# Shell Operations" >> ~/.config/fish/config.fish
echo "alias l='exa --color auto --icons'" >> ~/.config/fish/config.fish
echo "alias la='exa -la --color auto --icons'" >> ~/.config/fish/config.fish
echo "alias ll='exa -l --color auto --icons'" >> ~/.config/fish/config.fish
echo "alias tree='exa -T -L 3 --color auto --icons'" >> ~/.config/fish/config.fish
echo "alias grep='rg'" >> ~/.config/fish/config.fish
echo "alias g='git'" >> ~/.config/fish/config.fish
echo "set -g theme_color_scheme dracula" >> ~/.config/fish/config.fish

# Set up git aliases globally
git config --global alias.a add 
git config --global alias.c commit
git config --global alias.p push
git config --global alias.st status
git config --global alias.gr "log --graph --date=short --decorate=short --pretty=format:'%Cgreen%h %Creset%cd %Cblue%cn %Cred%d %Creset%s'"
git config --global alias.empty "commit --allow-empty -m 'Initial commit'"
git config --global alias.ch checkout
git config --global init.defaultBranch main
git config --global --add safe.directory /workspace

# Save Fish shell functions
fish -c "funcsave fish_config"

# Change default shell to Fish
sudo chsh -s $(which fish)

# font
git clone https://github.com/powerline/fonts.git
cd fonts
./install.sh
..
rm -rf ./fonts