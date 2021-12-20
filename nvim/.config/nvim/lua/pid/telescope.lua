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
        file_sorter = require("telescope.sorters").get_fzy_sorter,
        prompt_prefix = " > ",
        color_devicons = true,

        -- winblend: Transparency
        winblend = 0,
        file_ignore_patterns = {"venv/", "__pycache__/", "*.pyc"},

        file_previewer = require("telescope.previewers").vim_buffer_cat.new,
        grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
        qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
    },
    extensions = {
        fzy_native = {
            override_generic_sorter = false,
            override_file_sorter = true,
        },
    },
})

require("telescope").load_extension("fzy_native")

local M = {}
M.search_dotfiles = function()
    require("telescope.builtin").find_files({
        prompt_title = "< VimRC > ",
        cwd = '~/.config/nvim',
        file_ignore_patterns = {"autoload/", "undodir"},
        hidden = true,
    })
end

return M
