syntax on
let mapleader=" "
let g:mapleader=" "

" <leader>/ turn off search highlighting
nnoremap <leader>/ :nohl<CR>

" Movement
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>

" Remap
nnoremap <Leader>gd :YcmCompleter GoTo<CR>
nnoremap <Leader>pt :NERDTreeToggle<Enter>
nnoremap <silent> <Leader>pv :NERDTreeFind<CR>
nnoremap <Leader>al :GoAlternate<CR>
nnoremap <Leader>gt :GoTest<CR>
nnoremap <Leader>= :vertical resize+5<CR>
nnoremap <Leader>- :vertical resize-5<CR>

" Misc
set noerrorbells
set number relativenumber
set autoindent
set smartindent
set nowrap
set ignorecase
set smartcase
set hlsearch
set incsearch
set mouse=a
set history=200
filetype indent on

" Make backspace work as expected
set backspace=indent,eol,start

" Back up
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile

" Set tab size
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab

" vim-plug
call plug#begin('~/.vim/plugged')

Plug 'morhetz/gruvbox'
Plug 'ycm-core/YouCompleteMe', { 'do': './install.py --go-completer' }
Plug 'ctrlpvim/ctrlp.vim'
Plug 'vim-airline/vim-airline'
Plug 'preservim/nerdtree'
Plug 'jiangmiao/auto-pairs'

" Google vim-codefmt
Plug 'google/vim-maktaba'
Plug 'google/vim-codefmt'
Plug 'google/vim-glaive'

" Language specific
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

call plug#end()

" Color scheme
colorscheme gruvbox
set background=dark
set colorcolumn=80

" Set cursorline style between modes
set cursorline
autocmd InsertEnter * highlight  CursorLine cterm=underline ctermbg=None
" `237` is the dark1 color in gruvbox.
autocmd InsertLeave * highlight  CursorLine cterm=None ctermbg=237
" Shorten the ESC key delay
set timeoutlen=1000 ttimeoutlen=0

" YCM settings
" No preview panel.
set completeopt-=preview

" Auto-formatting w/ google/vim-codefmt
augroup autoformat_settings
  autocmd FileType bzl AutoFormatBuffer buildifier
  autocmd FileType c,cpp,proto,javascript,arduino AutoFormatBuffer clang-format
  autocmd FileType dart AutoFormatBuffer dartfmt
  autocmd FileType go AutoFormatBuffer gofmt
  autocmd FileType gn AutoFormatBuffer gn
  autocmd FileType html,css,sass,scss,less,json AutoFormatBuffer js-beautify
  autocmd FileType java AutoFormatBuffer google-java-format
  autocmd FileType python AutoFormatBuffer yapf
  " Alternative: autocmd FileType python AutoFormatBuffer autopep8
  autocmd FileType rust AutoFormatBuffer rustfmt
  autocmd FileType vue AutoFormatBuffer prettier
augroup END

" vim-go settings
let g:go_highlight_types = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
