local colorscheme = "dracula"

-- Fix Lsp document_highlight colors.
local fix_document_highlight = function()
    selection_bg_color = '#44475A'
    local highlight = function(group, fg, bg, attr, sp)
        fg = fg and "guifg=" .. fg or "guifg=NONE"
        bg = bg and "guibg=" .. bg or "guibg=NONE"
        attr = attr and "gui=" ..attr or "gui=NONE"
        sp = sp and "guisp=" .. sp or ""

        vim.api.nvim_command("highlight " .. group .. " ".. fg .. " " .. bg .. " ".. attr .. " " .. sp)
    end

	highlight('LspReferenceText', nil, selection_bg_color, nil, nil)
	highlight('LspReferenceRead', nil, selection_bg_color, nil, nil)
	highlight('LspReferenceWrite', nil, selection_bg_color, nil, nil)
end


-- Equivalent to `vim.cmd[[colorscheme XXXXX]]`
local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  vim.notify("colorscheme " .. colorscheme .. " not found!")
  return
end

fix_document_highlight()
