# Vitor's Repo for syncing up config files using GNU Stow

## OG guide I followed for STOW:
https://linustechtips.com/topic/1369746-howto-backup-your-configuration-files-dotfiles-in-linux-using-stow-and-git/

## Synced files
### Neovim
Config path: ~/.config/nvim/init.vim

#### Step 1 (installation): Some plugins require nightly version of Neovim.
Try checking the Neovim project and actively looking for an alternate PPA.
* Source: https://launchpad.net/~neovim-ppa/+archive/ubuntu/stable

#### Step 2 (plugged): Plugged is a plugin manager for vim. You need to install it.
Install Plugged: 

curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

* Source: https://opensource.com/article/20/2/how-install-vim-plugins

Neovim plugins installation path: ~/.vim/plugged/

#### Step 3 (YouCompleteMe and other plugins requiring Python):
let g:python3_host_prog = '/path/to/python3'

* Source:https://neovim.io/doc/user/provider.html#provider-python


