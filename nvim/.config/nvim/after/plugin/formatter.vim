augroup PID_FORMATTER
  autocmd!
  " undojoin: https://github.com/sbdchd/neoformat#managing-undo-history
  autocmd BufWritePre * undojoin | Neoformat
augroup END
