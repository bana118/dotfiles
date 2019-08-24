#!/bin/sh
sed -i -e 's%http://.*.ubuntu.com%http://ftp.jaist.ac.jp/pub/Linux%g' /etc/apt/sources.list 
apt update
apt upgrade -y
apt install -y vim-nox git php php-zip php-xml php-mbstring php-mysql apache2 libapache2-mod-php composer gcc make build-essential libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev
sh ~/dotfiles/wsl/link.sh
source ~/.bash_profile
source ~/.bashrc
git clone https://github.com/pyenv/pyenv.git ~/.pyenv
git clone https://github.com/pyenv/pyenv-virtualenv.git $(pyenv root)/plugins/pyenv-virtualenv