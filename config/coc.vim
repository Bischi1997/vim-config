"""""""""""""""""""""""""""""""""""""""""""
" Configure autocompletion via coc plugin "
"""""""""""""""""""""""""""""""""""""""""""
let g:coc_global_extensions = ['coc-snippets', 'coc-css', 'coc-json', 'coc-yaml', 'coc-tabnine', 'coc-html', 'coc-highlight', 'coc-solargraph']

highlight CocHighlightText  guifg=#282828 guibg=#bdae93 gui=NONE
highlight CocHighlightRead  guifg=#282828 guibg=#d5c4a1 gui=NONE
highlight CocHighlightWrite guifg=#282828 guibg=#fabd2f gui=NONE

" Use tab for trigger completion with characters ahead and navigate
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use K to show documentation in preview window
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor
autocmd CursorHold * silent call CocActionAsync('highlight')

