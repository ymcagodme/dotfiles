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
	updatetime = 300,

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
