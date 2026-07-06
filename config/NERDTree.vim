" NERDTree Shortcuts
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :FZF ..<CR>

" Autostart NERDTree in the dir of the opened file
function! s:open_nerdtree_on_start() abort
  if !exists(':NERDTree')
    return
  endif

  if argc() > 0
    let l:cwd = getcwd()
    let l:path = fnamemodify(argv(0), ':p')
    let l:dir = isdirectory(l:path) ? l:path : fnamemodify(l:path, ':h')

    execute 'cd' fnameescape(l:dir)
    silent! NERDTreeFind
    execute 'cd' fnameescape(l:cwd)
    wincmd p
  else
    NERDTree
    wincmd p
  endif
endfunction

augroup user_nerdtree
  autocmd!
  autocmd VimEnter * call s:open_nerdtree_on_start()
augroup END
