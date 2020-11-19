#!/bin/bash
sed -i -e 's%http://.*.ubuntu.com%http://ftp.jaist.ac.jp/pub/Linux%g' /etc/apt/sources.list 
apt update
apt upgrade -y
apt install -y vim-nox git git-lfs php php-zip php-xml php-json php-mbstring php-mysql php-sqlite3 php-bcmath apache2 libapache2-mod-php composer gcc make build-essential libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev
git config --global --add merge.ff false
git config --global --add pull.ff only
bash ~/dotfiles/wsl/link.sh
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.1/install.sh | bash
source ~/.bash_profile
source ~/.bashrc
nvm install --lts
npm config set user 0
npm config set unsafe-perm true
git clone https://github.com/pyenv/pyenv.git ~/.pyenv
git clone https://github.com/pyenv/pyenv-virtualenv.git $(pyenv root)/plugins/pyenv-virtualenv
source ~/.bash_profile
source ~/.bashrc
