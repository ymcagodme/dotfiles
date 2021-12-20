call plug#begin('~/.local/share/nvim/site/plugged')

  " Telescope: Fuzzy finder.
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-telescope/telescope.nvim'
  Plug 'nvim-telescope/telescope-fzy-native.nvim'

  " Tree-sitter support.
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

  " LSP support.
  Plug 'neovim/nvim-lspconfig'

  " Auto completion.
  Plug 'hrsh7th/cmp-nvim-lsp'
  Plug 'hrsh7th/cmp-buffer'
  Plug 'hrsh7th/cmp-path'
  Plug 'hrsh7th/cmp-cmdline'
  Plug 'hrsh7th/nvim-cmp'

  " Snippet feature (required by auto comletion).
  Plug 'hrsh7th/vim-vsnip'
  Plug 'hrsh7th/vim-vsnip-integ'

  " gruvbox colorscheme.
  Plug 'gruvbox-community/gruvbox'

  " Formatter
  Plug 'google/vim-maktaba'
  Plug 'google/vim-codefmt'

  " Airline status bar.
  Plug 'vim-airline/vim-airline'

  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-fugitive'
  Plug 'numToStr/Comment.nvim'


call plug#end()
