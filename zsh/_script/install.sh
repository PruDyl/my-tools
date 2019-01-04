#!/bin/bash

echo "[-][zsh] Begin installation ..."

# we create symbolic links to the config files if they don't already exist, else rename as FILE.DATE.BAK
DATE=$(date "+%Y.%m.%d-%H.%M.%S")

if [ -e ~/.zshrc ] ; then
    echo "Backup previous files"
    mv ~/.zshrc ~/.zshrc.$DATE.bak && echo "Rename ~/.zshrc as ~/.zshrc.$DATE.bak"
fi
echo "Symbolic link"
ln -s "`pwd`/.zshrc" ~/.zshrc

sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

echo "[+][zsh] installation complete."
