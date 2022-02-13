# Vitor's Repo for syncing up config files using GNU Stow
## Regenerate config files:
> cd ~
> git clone git@github.com:vitor-schipani/dotfiles.git

## Git help:
Editing remotes:

Views all current remotes:
> git remote -v #Views all current remotes
Adds a new remote:
> git remote add origin <GET SSH LINK FROM GIT>

## Installs from scratch:
## Neofetch + screenFetch
Just to show distro info in a pretty way :)
> sudo apt install neofetch

## Neovim
Neovim is THE WAY to write code :)
#### Step 1 (installation): Some plugins require nightly version of Neovim.
Try checking the Neovim project and actively looking for an alternate PPA.
* Source: https://launchpad.net/~neovim-ppa/+archive/ubuntu/stable

#### Step 2 (plugged): Plugged is a plugin manager for vim. You need to install it.
Install Plugged: 

> curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
>  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

* Source: https://opensource.com/article/20/2/how-install-vim-plugins

Neovim plugins installation path: ~/.vim/plugged/

#### Step 3 (YouCompleteMe and other plugins requiring Python):
Run .install.py, you may need to run some git commands (the program tells you)
> (Inside neovim)
> let g:python3_host_prog = '/path/to/python3'

* Source: https://neovim.io/doc/user/provider.html#provider-python

## Stow:
Stow is used to sync many config files in an easy way
#### Step 1 (installation):
> sudo apt-get update -y
> sudo apt-get install -y stow

#### Step 2 (syncing commands):
* Source: https://linustechtips.com/topic/1369746-howto-backup-your-configuration-files-dotfiles-in-linux-using-stow-and-git/

Stow exists in: ~/dotfiles/stow_home/
Inside stow_home every dotfile to be synced need to have its own folder:
~/dotfiles/stow_home/<PROGRAM>
Then navigate to stow_home and use the following command:
> stow -nvt ~ *
The "n" flag will only show what will be done, without actually doing it.
If it looks right (creates the correct symlinks) you can remove the "n":
> stow -vt ~ *

## Miniconda:
To have easy multi python environments.
Sorry, check here install instructions: https://docs.conda.io/en/latest/miniconda.html
