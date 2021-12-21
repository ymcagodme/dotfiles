augroup PID_FORMATTER
  autocmd!
  " undojoin: https://github.com/sbdchd/neoformat#managing-undo-history
  " try/catch fix: https://github.com/sbdchd/neoformat/issues/134
  autocmd BufWritePre * try | undojoin | Neoformat | catch /^Vim\%((\a\+)\)\=:E790/ | finally | silent Neoformat | endtry
augroup END
