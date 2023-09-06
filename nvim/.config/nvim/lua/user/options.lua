-- `:help options` to see all options.
--------------------------------------

local options = {

	-- General settings
	mouse = "a",
	number = true,
	relativenumber = true,
	hlsearch = false,
	errorbells = false,
	wrap = false,
	colorcolumn = "80",

	-- Read vimrc recursively (in folders)
	exrc = true,

	-- Don't unload a buffer when no longer shown in a window
	hidden = true,

	-- Keep 8 lines margin
	scrolloff = 8,

	-- Have a sign column on the left to indicate status
	signcolumn = "yes",

	-- faster completion (4000ms default)
	updatetime = 250,
	timeoutlen = 300,

	-- Enable break indent
	breakindent = true,

	-- Case-insensitive searching UNLESS \C or capital in search
	ignorecase = true,
	smartcase = true,
	
	-- Set completeopt to have a better completion experience
	completeopt = 'menuone,noselect',

	-- NOTE: You should make sure your terminal supports this
	termguicolors = true,

	-- Tab settings
	tabstop = 4,
	softtabstop = 4,
	shiftwidth = 4,
	expandtab = true,
	smartindent = true,

	-- History settings
	swapfile = false,
	backup = false,
	undofile = true,
}

-- Load all options.
for k, v in pairs(options) do
	vim.opt[k] = v
end

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})
