## Tmux commands
### Outside tmux (normal terminal)
#### Managing tmux

Opens a new tmux session:

> tmux 

Lists all running sessions:

> tmux ls 

#### Create new tmux session

Creates a new tmux session:

> tmux new 

Creates a new tmux session with a name:

> tmux new -s "SESSION NAME"

#### Re-attach to an existing session

Re-attach to the last tmux session you were in:

> tmux a 

Attach the terminal to a target tmux session:

> tmux a -t "SESSION NAME" 

#### Killing sessions and renaming sessions

Kills all sessions:

> tmux kill-server

Kills that specific session:

> tmux kill-session -t "SESSION NAME"

> tmux rename-session -t "CURRENT NAME" "NEW NAME"

### Inside tmux
#### Exiting

Kills the session:

> exit 

Exits the session without killing it:

> <ctrl+b> + d 

#### Creating new window

Creates the new tmux window in the session:

> <ctrl+b> + c 

Moves to the correspondent window:

> <ctrl+b> + <NUMBER> 

List all windows and gives a preview:

> <ctrl+b> + w 

Kills the window:

> <ctrl+b> + x 

#### Dividing the windows (panels)

Divides Vertically:

> <ctrl+b> + % 

Divides horizontally:

> <ctrl+b> + " 

Goes back to previous window:

> <ctrl+b> + ; 

Goes to a specific panel:

> <ctrl+b> + q 

Moves to a window:

> <ctrl+b> + <ARROWS> 

## Managing fonts:

Get currently installed fonts:

> fc-list

> cp *.ttf ~/.fonts #Copy *.ttf or *.woff to fonts folder

> cd ~/.fonts

Refresh cache:

> sudo fc-cache -fv 

Gives a list of all installed fonts:

> pango-list 
