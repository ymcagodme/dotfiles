local function config(_config)
	return vim.tbl_deep_extend("force", {
		capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities()),
	}, _config or {})
end

-- Remember to install nerd-fonts:
--   https://github.com/ryanoasis/nerd-fonts#option-4-homebrew-fonts
local lspkind = require("lspkind")

-- Setup nvim-cmp globally.
local cmp = require("cmp")

cmp.setup({
	snippet = {
		expand = function(args)
			-- For `vsnip` user.
			vim.fn["vsnip#anonymous"](args.body)

			-- For `luasnip` user.
			-- require("luasnip").lsp_expand(args.body)

			-- For `ultisnips` user.
			-- vim.fn["UltiSnips#Anon"](args.body)
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
})

-- Python support.
require('lspconfig').pylsp.setup{config()}
require('lspconfig').pyright.setup{config()}
