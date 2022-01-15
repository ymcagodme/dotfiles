local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

-- Install your plugins here
return packer.startup(function(use)
	-- Init
	use("wbthomason/packer.nvim") -- Have packer manage itself

	-- Misc
	use({
		"nvim-lua/popup.nvim",
		requires = { { "nvim-lua/plenary.nvim" } },
	})
	use("Mofiqul/dracula.nvim") -- Colorscheme: Dracula
	use("rafamadriz/friendly-snippets")
	use("windwp/nvim-autopairs")
	use("tpope/vim-surround")

	-- LSP
	use({
		"neovim/nvim-lspconfig",
		"williamboman/nvim-lsp-installer",
		"folke/lsp-colors.nvim",
		"onsails/lspkind-nvim",
	})

	-- Telescope
	use({
		"nvim-telescope/telescope.nvim",
		requires = {
			{ "nvim-lua/plenary.nvim" },
			{ "nvim-telescope/telescope-media-files.nvim" },
			-- Chose over fzy sorter because this supports fzf syntax:
			-- https://github.com/junegunn/fzf#search-syntax
			{ "nvim-telescope/telescope-fzf-native.nvim", run = "make" },
		},
	})

	-- Tree-sitter
	use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })

	-- Completion: nvim-cmp
	use({
		"hrsh7th/nvim-cmp",
		requires = {
			{ "neovim/nvim-lspconfig" },
			{ "hrsh7th/vim-vsnip" },
			-- Sources:
			{ "hrsh7th/cmp-nvim-lsp" },
			{ "hrsh7th/cmp-buffer" },
			{ "hrsh7th/cmp-path" },
			{ "hrsh7th/cmp-cmdline" },
			{ "ray-x/cmp-treesitter" },
			{ "f3fora/cmp-spell" },
			{ "hrsh7th/cmp-vsnip" },
		},
	})

	-- Snippets
	use({
		"hrsh7th/vim-vsnip-integ",
		requires = {
			{ "hrsh7th/vim-vsnip" },
		},
	})
	use({
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup()
		end,
	})

	-- Git relating
	use({
		"lewis6991/gitsigns.nvim",
		requires = {
			"nvim-lua/plenary.nvim",
		},
		-- tag = 'release' -- To use the latest release
		config = function()
			require("gitsigns").setup()
		end,
	})

	-- Lualine status bar
	use({
		"nvim-lualine/lualine.nvim",
		requires = { "kyazdani42/nvim-web-devicons", opt = true },
	})

	-- Null-ls
	use({
		"jose-elias-alvarez/null-ls.nvim",
		requires = { "nvim-lua/plenary.nvim" },
	})

	-- Toggle Terminal
	use({ "akinsho/toggleterm.nvim" })

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
