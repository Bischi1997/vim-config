" Configure autocompletion via coc plugin
let g:coc_global_extensions = ['coc-snippets', 'coc-css', 'coc-json', 'coc-yaml', 'coc-html', 'coc-highlight']
let g:coc_user_config = get(g:, 'coc_user_config', {})

if executable('solargraph')
  call add(g:coc_global_extensions, 'coc-solargraph')
else
  let g:coc_user_config['solargraph.enable'] = v:false
  let g:coc_user_config['solargraph.promptDownload'] = v:false
endif

highlight CocHighlightText  guifg=#282828 guibg=#bdae93 gui=NONE
highlight CocHighlightRead  guifg=#282828 guibg=#d5c4a1 gui=NONE
highlight CocHighlightWrite guifg=#282828 guibg=#fabd2f gui=NONE

" Use tab for trigger completion with characters ahead and navigate
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config
inoremap <silent><expr> <TAB>
      \ exists('*coc#pum#visible') && coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ exists('*coc#refresh') ? coc#refresh() : "\<Tab>"
inoremap <silent><expr><S-TAB> exists('*coc#pum#visible') && coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"
inoremap <silent><expr> <Down> exists('*coc#pum#visible') && coc#pum#visible() ? coc#pum#next(1) : "\<Down>"
inoremap <silent><expr> <Up> exists('*coc#pum#visible') && coc#pum#visible() ? coc#pum#prev(1) : "\<Up>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice
inoremap <silent><expr> <CR> exists('*coc#pum#visible') && coc#pum#visible() ? coc#pum#confirm()
                              \: exists('*coc#on_enter') ? "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>" : "\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use K to show documentation in preview window
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if exists('*CocAction') && CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor
function! HighlightCocSymbol() abort
  if exists('*CocActionAsync')
    silent call CocActionAsync('highlight')
  endif
endfunction

augroup user_coc
  autocmd!
  autocmd CursorHold * call HighlightCocSymbol()
augroup END
