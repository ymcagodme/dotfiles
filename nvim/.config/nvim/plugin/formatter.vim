" https://github.com/google/vim-codefmt
augroup autoformat_settings
  autocmd FileType c,cpp,proto,javascript,arduino AutoFormatBuffer clang-format
  autocmd FileType python AutoFormatBuffer yapf
augroup END

augroup PID_FORMATTER
  autocmd!
  autocmd BufWritePre *.py FormatCode
  autocmd BufWritePre *.proto FormatCode
augroup END
