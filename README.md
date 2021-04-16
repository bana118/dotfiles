# dotfiles

## Initial setup for WSL2

rustc, node, pyenv, etc.

```
cd
git clone https://github.com/bana118/dotfiles.git
~/wsl/init_command.sh
```

## Use "code" command on wsl

```
ln -s '/mnt/c/Users/<username>/AppData/Local/Programs/Microsoft VS Code/bin/code' /usr/local/bin/code
```

## /mnt/c/Users/\<username\>/.wslconfig

```
[wsl2]
memory=8GB
swap=0
localhostForwarding=true
```
