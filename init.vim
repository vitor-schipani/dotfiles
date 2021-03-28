"Syntax
syntax on
set signcolumn=yes "creates extra column that can indicate errors
set colorcolumn=80 "visual indication of EOL

"Indenting
set tabstop=4 softtabstop=4 "for Python spaces
set shiftwidth=4
set expandtab
set smartindent
set nowrap "stop automatically wrapping of code

"Navigation
set updatetime=50 "having longer updatetimes leads to noticeable delays default=4000
set relativenumber "relative number
set number "shows current number of line you are on
set nohlsearch "turns search off after results were found
set hidden "keeps buffers open and ready for fast navigation
set noerrorbells "prevents warning/error sounds from OS
set incsearch "incremental search
set scrolloff=8 "start scrolling 8 lines away from margins

"Customization
set exrc "executes .vimrc (vim) or init.vim (nvim) inside current project if exists

"Edit history
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile

"Plugs
call plug#begin('~/.vim/plugged')
Plug 'nvim-telescope/telescope.nvim'
Plug 'gruvbox-community/gruvbox'
call plug#end()

"Colorscheme
colorscheme gruvbox
highlight Normal guibg=none
set background=dark

"Remaps
let mapleader = " " "space is the leader key
