#!/bin/bash

echo "[-][vim] Begin installation ..."

# we create symbolic links to the config files if they don't already exist
[ ! -e ~/.vimrc ] && ln -s "`pwd`/.vimrc" ~/.vimrc
[ ! -e ~/.vim ] && ln -s "`pwd`/.vim" ~/.vim


# ensure that the installation cache directory exists
[ ! -d _cache/ ] && mkdir _cache
[ ! -d ~/.vim/backups/ ] && mkdir ~/.vim/backups
[ ! -d ~/.vim/tmp/ ] && mkdir ~/.vim/tmp

# install dependancies
IFS=";"
dependancies='syntastic;tagbar;vim-symfony;nerdtree;nerdcommenter'
for dep_name in $dependancies; do
  # check if the current dependancy is already installed
  if [[ -e "_cache/$dep_name"  ]]; then
    echo "[*][vim] $dep_name is already installed: nothing done."
    continue
  fi

  ./_scripts/install_dependancy.sh "$dep_name"
done

echo "[+][vim] installation complete."
