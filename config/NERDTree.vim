" NERDTree Shortcuts
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :FZF ..<CR>

" Autostart NERDTree in the dir of the opened file
autocmd VimEnter * if argc() > 0 | execute 'cd ' . fnamemodify(argv(0), ':h') | NERDTreeFind | execute 'cd -' | wincmd p | else | NERDTree | wincmd p | endif
