local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
  return
end

local actions = require "telescope.actions"

telescope.setup {
  defaults = {
    prompt_prefix = " > ",
    path_display = { "smart" },

    -- port settings.
    -- --------------
    color_devicons = true,
    file_ignore_patterns = { ".git", "venv", "__pycache__", "%.pyc", "node_modules"},

    mappings = {
      i = {
        ['<C-u>'] = false,
        ['<C-d>'] = false,
      },
    },
  },
  pickers = {
    find_files = {
      theme = "dropdown"
    },
    live_grep = {
      theme = "dropdown"
    },
    grep_string = {
      theme = "dropdown"
    },
    buffers = {
      theme = "dropdown"
    },
    help_tags = {
      theme = "dropdown"
    },
    diagnostics = {
      theme = "dropdown"
    },
  },
  extensions = {
    media_files = {
        find_cmd = "rg" -- find command (defaults to `fd`)
    },
    fzf = {
      fuzzy = true,                    -- false will only do exact matching
      override_generic_sorter = true,  -- override the generic sorter
      override_file_sorter = true,     -- override the file sorter
      case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
                                       -- the default case_mode is "smart_case"
    },
  },
}

-- Loading Extensions
-- https://github.com/nvim-telescope/telescope-media-files.nvim
telescope.load_extension('media_files')
-- https://github.com/nvim-telescope/telescope-fzf-native.nvim
telescope.load_extension('fzf')

-- Custom functions
local M = {}
M.search_nvim_config = function()
    require("telescope.builtin").find_files({
        prompt_title = "< VimRC > ",
        cwd = '~/.config/nvim',
        file_ignore_patterns = {"autoload/", "undodir", "pack_compiled.lua"},
        hidden = true,
    })
end

M.search_dotfiles = function()
    require("telescope.builtin").find_files({
        prompt_title = "< dotfiles > ",
        cwd = '~/.dotfiles',
        file_ignore_patterns = { ".git", "venv", "__pycache__", "%.pyc", "autoload", "undodir"},
        hidden = true,
    })
end

return M
