local cmp = require("cmp")

cmp.setup.buffer({
    sources = {
		{ name = "nvim_lsp" },
        { name = "treesitter" },
        { name = "vsnip" },
        { name = "path" },
        {
          name = "buffer",
          option = {
            get_bufnrs = function()
              return vim.api.nvim_list_bufs()
            end,
          },
        },
    }
})
