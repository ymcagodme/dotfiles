-- markdown ftplugin

vim.opt.autoindent = true
vim.opt_local.spell = true
vim.opt_local.spelllang = { 'en_us' }
vim.opt_local.conceallevel = 2

local cmp = require("cmp")
cmp.setup.buffer({
    { name = "vsnip" },
    { name = "spell" },
    {
      name = "buffer",
      option = {
        -- Visible buffers
        get_bufnrs = function()
          local bufs = {}
          for _, win in ipairs(vim.api.nvim_list_wins()) do
            bufs[vim.api.nvim_win_get_buf(win)] = true
          end
          return vim.tbl_keys(bufs)
        end,
      },
    },
    { name = "path" },
})
