" Enable vim-plug
source $HOME/.config/nvim/plugins.vim

" Basic
" -----

" Read vimrc recursively (in folders)
set exrc
" Don't unload a buffer when no longer shown in a window
set hidden
" Keep 8 lines margin
set scrolloff=8
" Have a sign column on the left to indicate status
set signcolumn=yes
set mouse=a
set nu
set relativenumber
set nohlsearch
set noerrorbells
set nowrap
set colorcolumn=80

" Tab settings
" ------------
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent

" History relating
" ----------------
set noswapfile
set nobackup
set undofile

" My remap
" --------
" Change leader to space.
let mapleader = " "
"  Reload nvim rc.
nnoremap <Leader><CR> :so ~/.config/nvim/init.vim<CR>

" Ignore files
set wildignore+=*.pyc
set wildignore+=*_build/*
set wildignore+=**/node_modules/*
set wildignore+=**/.git/*

" My own lua settings (for plugins).
lua require("pid")
