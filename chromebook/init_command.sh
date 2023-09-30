#!/bin/bash 
git config --global --add merge.ff false
git config --global --add pull.ff only
bash ~/dotfiles/chromebook/link.sh
source ~/.bashrc
