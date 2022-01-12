local cmp_status_ok, cmp = pcall(require, "cmp")
if not cmp_status_ok then
  return
end

local lspkind_status_ok, lspkind = pcall(require, "lspkind")
if not lspkind_status_ok then
  return
end

cmp.setup {
  snippet = {
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body)
    end,
  },
  mapping = {
    ["<C-u>"] = cmp.mapping.scroll_docs(-4),
    ["<C-d>"] = cmp.mapping.scroll_docs(4),
    ['<Down>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
    ['<Up>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
    ["<C-Space>"] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping({
      i = cmp.mapping.abort(),
      c = cmp.mapping.close(),
    }),
  },
  formatting = {
    format = lspkind.cmp_format({
        with_text = true,
        preset = 'codicons',

        before = function (entry, vim_item)
            vim_item.menu = ({
                nvim_lsp = "[LSP]",
                treesitter = "[TS]",
                vsnip = "[Snippet]",
                buffer = "[Buffer]",
                path = "[Path]",
                spell = "[Spell]",
            })[entry.source.name]
            return vim_item
        end
    })
  },
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
    { name = "spell" }
  },
  confirm_opts = {
    behavior = cmp.ConfirmBehavior.Replace,
    select = false,
  },
  documentation = {
    border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
  },
  experimental = {
    ghost_text = false,
    native_menu = false,
  },
}
