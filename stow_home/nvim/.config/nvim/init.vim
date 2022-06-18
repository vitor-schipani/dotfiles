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

"Required for colorizer plugin
set termguicolors

"Plugs
call plug#begin('~/.vim/plugged')

"Color Scheme
Plug 'morhetz/gruvbox'
Plug 'jremmen/vim-ripgrep'
Plug 'tpope/vim-fugitive'
Plug 'leafgarland/typescript-vim'
Plug 'vim-utils/vim-man'
Plug 'lyuts/vim-rtags'
Plug 'git@github.com:kien/ctrlp.vim.git'
Plug 'git@github.com:Valloric/YouCompleteMe.git'
"Plug 'darrikonn/vim-gofmt'
Plug 'fatih/vim-go'
Plug 'mbbill/undotree'
"File Navigation
Plug 'sharkdp/bat'
Plug 'sharkdp/fd'
Plug 'BurntSushi/ripgrep'
"Plug 'nvim-treesitter/nvim-treesitter'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'
"Debugging
Plug 'puremourning/vimspector'
Plug 'szw/vim-maximizer'

Plug 'norcalli/nvim-colorizer.lua'
call plug#end()

lua require'colorizer'.setup()

"Colorscheme
augroup user_colors
  autocmd!
  autocmd ColorScheme * highlight Normal ctermbg=NONE guibg=NONE
augroup END

colorscheme gruvbox
highlight Normal guibg=none
set background=dark

"Remaps
let mapleader = " " "space is the leader key
