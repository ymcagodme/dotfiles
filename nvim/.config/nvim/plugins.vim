call plug#begin('~/.local/share/nvim/site/plugged')

  " Telescope: Fuzzy finder.
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-telescope/telescope.nvim'
  " Chose over fzy sorter because this supports fzf syntax:
  " https://github.com/junegunn/fzf#search-syntax
  Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }

  " Tree-sitter support.
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

  " LSP support.
  Plug 'neovim/nvim-lspconfig'
  Plug 'onsails/lspkind-nvim'

  " Auto completion.
  Plug 'hrsh7th/nvim-cmp'
  " Auto completion (sources)
  Plug 'hrsh7th/cmp-nvim-lsp'
  Plug 'hrsh7th/cmp-buffer'
  Plug 'hrsh7th/cmp-path'
  Plug 'hrsh7th/cmp-cmdline'
  Plug 'ray-x/cmp-treesitter'
  Plug 'f3fora/cmp-spell'

  " Snippet feature (required by auto comletion).
  Plug 'hrsh7th/cmp-vsnip'
  Plug 'hrsh7th/vim-vsnip'
  Plug 'hrsh7th/vim-vsnip-integ'
  Plug 'rafamadriz/friendly-snippets'

  " gruvbox colorscheme.
  Plug 'gruvbox-community/gruvbox'
  Plug 'Mofiqul/dracula.nvim'

  " Formatter
  " Plug 'google/vim-maktaba'
  " Plug 'google/vim-codefmt'
  Plug 'sbdchd/neoformat'

  " Status bar.
  " Plug 'vim-airline/vim-airline'
  Plug 'nvim-lualine/lualine.nvim'

  Plug 'numToStr/Comment.nvim'
  Plug 'tpope/vim-surround'
  Plug 'ray-x/lsp_signature.nvim'

  " Git relating
  Plug 'tpope/vim-fugitive'
  Plug 'lewis6991/gitsigns.nvim'

call plug#end()
