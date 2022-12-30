# Vitor's Repo for syncing up config files using GNU Stow
## Regenerate config files:
$ cd ~
$ git clone git@github.com:vitor-schipani/dotfiles.git

### Configuring different dotfiles:
alias were set in the .bashrc config file
Those are the alias for quick access:
$ echo_path         #Pretty printing available PATH environment variable

$ edit_i3           #editing i3 as a whole
$ edit_i3bar        #editing the little status bar
$ edit_bash         #editing .bashrc configs such as alias settings
$ edit_nvim         #editing nvim configs

$ colinha_docker    #docker study
$ colinha_java      $java study

## WHERE TO INSTALL PROGRAMS IN LINUX
Lets have a convention that programs should be installed at /usr/local/share/
> https://frameboxxindore.com/apple/where-should-i-install-applications-in-linux.html

## HOW TO UNPACK TAR GZ
Unpack everything to current directory and print output
$ tar -xvf filename.tar.gz

options meaning:
x: extract (not sure what other options there are)
v: verbose (print output)
f: use archive file name when extarcting (dont specify a new name)

> https://kinsta.com/knowledgebase/unzip-tar-gz/

## Tmux commands
### Outside tmux (normal terminal)
#### Managing tmux
$ tmux #opens a new tmux session
$ tmux ls #lists all running sessions

#### Create new tmux session
$ tmux new #creates a new tmux session
$ tmux new -s "SESSION NAME" #creates a new tmux session with a name

#### Re-attach to an existing session
$ tmux a #re-attach to the last tmux session you were in
$ tmux a -t "SESSION NAME" #attach the terminal to a target tmux session

#### Killing sessions and renaming sessions
$ tmux kill-server #kills all sessions
$ tmux kill-session -t "SESSION NAME" #kills that specific session
$ tmux rename-session -t "CURRENT NAME" "NEW NAME"

### Inside tmux
#### Exiting
exit #kills the session
<ctrl+b> + d #exits the session without killing it

#### Creating new window
<ctrl+b> + c #creates new tmux window in the session
<ctrl+b> + <NUMBER> #moves to the correspondent window
<ctrl+b> + w #list all windows and gives a preview
<ctrl+b> + x #kills the window

#### Dividing the windows (panels)
<ctrl+b> + % #Divides vertically
<ctrl+b> + " #Divides horizontally
<ctrl+b> + ; #Goes back to previous window
<ctrl+b> + q #Goes to a specific panel
<ctrl+b> + <ARROWS> #Moves to a window

## Managing fonts:
Get currently installed fonts:
$ fc-list
$ cp *.ttf ~/.fonts #Copy *.ttf or *.woff to fonts folder
$ cd ~/.fonts
$ sudo fc-cache -fv #Refresh cache
$ pango-list #gives a list of all installed fonts

## Changing default terminal
After installing new terminal application:
$ sudo update-alternatives --config x-terminal-emulator
Choose from the list

## Installs from scratch:
## Libreoffice
https://tecadmin.net/install-libreoffice-on-ubuntu-20-04/
$ sudo add-apt-repository ppa:libreoffice/ppa
$ sudo apt install libreoffice

## Neofetch + screenFetch
Just to show distro info in a pretty way :)
$ sudo apt install neofetch

## Neovim
Neovim is THE WAY to write code :)
#### Step 1 (installation): Some plugins require nightly version of Neovim.
Try checking the Neovim project and actively looking for an alternate PPA.
> Source: https://launchpad.net/~neovim-ppa/+archive/ubuntu/stable

Updating neovim
https://medium.com/@leonardormlins/easiest-way-to-update-neovim-on-ubuntu-a283c66d5322

$ sudo apt remove neovim -y
$ sudo add-apt-repository ppa:neovim-ppa/stable
$ sudo apt-get update
$ sudo apt-get install neovim

#### Step 2 (plugged): Plugged is a plugin manager for vim. You need to install it.
Install Plugged: 

> https://opensource.com/article/20/2/how-install-vim-plugins
$ curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

Neovim plugins installation path: ~/.vim/plugged/
Neovim config file path: nvim/.config/nvim/init.vim

When you alter your init.vim you must source this file for it to recognize changes
Sourcing the vimrc:
:source $MYVIMRC

Installing plugins:
:PlugInstall

If you need to uninstall delete the plugin directory and run 
(you may need to source the init.vim file as well I'm not sure):
:PlugClean

#### Step 3 (YouCompleteMe and other plugins requiring Python):
Run .install.py, you may need to run some git commands (the program tells you)

> Source: https://neovim.io/doc/user/provider.html#provider-python
> https://stackoverflow.com/questions/47667119/ycm-error-the-ycmd-server-shut-down-restart-wit-the-instructions-in-the-docu

(Inside neovim)
let g:python3_host_prog = '/path/to/python3'

## Stow:
Stow is used to sync many config files in an easy way
#### Step 1 (installation):
$ sudo apt-get update -y
$ sudo apt-get install -y stow

#### Step 2 (syncing commands):
> Source: https://linustechtips.com/topic/1369746-howto-backup-your-configuration-files-dotfiles-in-linux-using-stow-and-git/

Stow exists in: ~/dotfiles/stow_home/
Inside stow_home every dotfile to be synced need to have its own folder:
~/dotfiles/stow_home/<PROGRAM>
Then navigate to stow_home and use the following command:
$ stow -nvt ~ *
The "n" flag will only show what will be done, without actually doing it.
If it looks right (creates the correct symlinks) you can remove the "n":
$ stow -vt ~ *

## Miniconda:
To have easy multi python environments.
Sorry, check here install instructions: https://docs.conda.io/en/latest/miniconda.html

## i3:
See edit_i3 for full config file.

$mod+shift+r = refresh i3 in-place
$mod+d = opens dmenu

i3 polybar:
script to launch polybar: $HOME/dotfiles/stow_home/i3/launch.sh

Important: If you want to change the name from "example" to another name
then you need to edit launch.sh
$ edit_i3bar #for editing polybar config file

polybar setup wiki: 
https://github.com/polybar/polybar/wiki

## fzf:
Fuzzy finder for commandline
> https://bytexd.com/how-to-use-fzf-command-line-fuzzy-finder/

## Ranger:
File explorer, not super required but it is quite nice
$ sudo apt install ranger

## feh:
Used to change wallpapers

i3 config should have this line:
exec_always --no-startup-id feh --bg-scale ~/Pictures/current_wallpaper.jpg

So if you want to change your wallpaper just rename a picture on the
pictures directory to 'current_wallpaper.jpg' and reload i3 :)

## xrandr:
This is a program to configure monitors orientation, resolution, refresh_rate etc.

### Persisting xrandr changes:
Commands must be placed in this file to persist on startup:
> https://askubuntu.com/questions/754231/how-do-i-save-my-new-resolution-setting-with-xrandr
$HOME/.xprofile

Get current configuration of output monitors:
$ xrandr -q

Each output can be identified in the previous command
For example "DP-0" for Display Port 0

Example of command:
$ xrandr --verbose --output DP-0 --rotate left

## htop:
Program to see active processes and programs running
$ sudo apt install htop

## flameshot
Program to take screenshots
$ sudo apt install flameshot
> Source: https://itsfoss.com/take-screenshot-linux/
