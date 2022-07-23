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

"Auto completion
Plug 'git@github.com:Valloric/YouCompleteMe.git'
Plug 'fatih/vim-go'
Plug 'mbbill/undotree'

"File Navigation
Plug 'sharkdp/bat' "dependency for finder
Plug 'sharkdp/fd' "finder for telescope
Plug 'BurntSushi/ripgrep' "suggested for telescope for live_grep and grep_string
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim' "plenary is a required dependency for telescope
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-telescope/telescope-fzy-native.nvim' "improves telescope sorting performance
Plug 'nvim-telescope/telescope.nvim', {'tag' : '0.1.0' } "fuzzy finder

"File structure
Plug 'preservim/nerdtree' "adds a file tree structure

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
"General remaps
let mapleader = " " "space is the leader key

"Buffer remaps
"Next buffer
nnoremap <leader>bn <cmd>bn<cr>
"Previous buffer
nnoremap <leader>bb <cmd>b#<cr>
"Drop buffer
nnoremap <leader>bd <cmd>bd<cr>

"Movement between splits ctrl+hjkl
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"Telescope Remaps
" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
"nnoremap <leader>fg <cmd>Telescope live_grep<cr>
"nnoremap <leader>fh <cmd>Telescope help_tags<cr>
" Using Lua functions
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
"nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
"nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>

"Nerdtree remaps
nnoremap <leader>ee <cmd>NERDTreeToggle<cr>
"nnoremap <leader>ef <cmd>NERDTreeFocus<cr>
"nnoremap <leader>et <cmd>NERDTree<cr>
"nnoremap <leader>eu <cmd>NERDTreeFind<cr>

"Use the natural Vim navigation keys hjkl to navigate the files.
"Press o to open the file in a new buffer or open/close directory.
"Press t to open the file in a new tab.
"Press i to open the file in a new horizontal split.
"Press s to open the file in a new vertical split.
"Press p to go to parent directory.
"Press r to refresh the current directory.
"Press m to launch NERDTree menu inside Vim.

" Telescope

" Nerdtree configs
"Icons
let g:NERDTreeDirArrowExpandable = '📁'
let g:NERDTreeDirArrowCollapsible = '📂'

" Start NERDTree when Vim is started without file arguments.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | endif

" Start NERDTree. If a file is specified, move the cursor to its window.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * NERDTree | if argc() > 0 || exists("s:std_in") | wincmd p | endif

" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" If another buffer tries to replace NERDTree, put it in the other window, and bring back NERDTree.
autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
            \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif
