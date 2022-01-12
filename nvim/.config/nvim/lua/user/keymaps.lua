local opts = { noremap = true, silent = true }

-- Shorten function name.
--
-- nvim_set_keymap({mode}, {lhs}, {rhs}, {*opts})
-- Modes:
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c"
local keymap = vim.api.nvim_set_keymap

-- Remap leader key.
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)
keymap("n", "<Leader><CR>", "<cmd>so ~/.config/nvim/init.lua<CR>", opts)

-- Telescope
keymap("n", "<Leader>ff", "<Cmd>lua require('telescope.builtin').find_files()<CR>", opts)
keymap("n", "<Leader>fg", "<Cmd>lua require('telescope.builtin').live_grep()<CR>", opts)
keymap("n", "<Leader>fb", "<Cmd>lua require('telescope.builtin').buffers()<CR>", opts)
keymap("n", "<Leader>fh", "<Cmd>lua require('telescope.builtin').help_tags()<CR>", opts)
keymap("n", "<Leader>fdf", "<Cmd>lua require('user.telescope').search_dotfiles()<CR>", opts)
keymap("n", "<Leader>vrc", "<Cmd>lua require('user.telescope').search_nvim_config()<CR>", opts)
