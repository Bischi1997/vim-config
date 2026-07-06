" Filetype-specific indentation and formatting defaults.

augroup user_filetypes
  autocmd!

  autocmd FileType ruby,yaml,yml,javascript,typescript,json,html,css,scss,markdown
        \ setlocal expandtab shiftwidth=2 softtabstop=2 tabstop=2

  autocmd FileType python,sh,zsh,bash,vim
        \ setlocal expandtab shiftwidth=4 softtabstop=4 tabstop=4

  autocmd FileType go
        \ setlocal noexpandtab shiftwidth=4 softtabstop=4 tabstop=4

  autocmd FileType make
        \ setlocal noexpandtab shiftwidth=8 softtabstop=0 tabstop=8

  autocmd FileType text,markdown
        \ setlocal textwidth=80 colorcolumn=80
augroup END
