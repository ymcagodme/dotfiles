require("telescope").setup({
    vimgrep_arguments = {
      'rg',
      '--color=never',
      '--no-heading',
      '--with-filename',
      '--line-number',
      '--column',
      '--smart-case'
    },
    pickers = {
        find_files = {
            theme = "dropdown"
        }
    },
    defaults = {
        prompt_prefix = " > ",
        color_devicons = true,

        -- winblend: Transparency
        winblend = 0,
        file_ignore_patterns = { ".git", "venv", "__pycache__", "%.pyc"},

        file_previewer = require("telescope.previewers").vim_buffer_cat.new,
        grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
        qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
    },
    extensions = {
        fzf = {
            fuzzy = true,                    -- false will only do exact matching
            override_generic_sorter = true,  -- override the generic sorter
            override_file_sorter = true,     -- override the file sorter
            case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
                                             -- the default case_mode is "smart_case"
        }
    },
})

require('telescope').load_extension('fzf')

local M = {}
M.search_nvim_config = function()
    require("telescope.builtin").find_files({
        prompt_title = "< VimRC > ",
        cwd = '~/.config/nvim',
        file_ignore_patterns = {"autoload/", "undodir"},
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
