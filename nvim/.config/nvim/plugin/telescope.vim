nnoremap <leader>pf <cmd>Telescope find_files theme=dropdown<cr>
nnoremap <leader>pg <cmd>Telescope live_grep theme=dropdown<cr>
nnoremap <leader>pb <cmd>Telescope buffers<cr>
nnoremap <leader>ph <cmd>Telescope help_tags<cr>
nnoremap <leader>vrc :lua require('pid.telescope').search_dotfiles()<cr>
