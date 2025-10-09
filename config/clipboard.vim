" Use system clipboard
set clipboard=unnamed
" Copy visual selection with Ctrl+C
vnoremap <C-c> "+y
" Cut visual selection with Ctrl+X
vnoremap <C-x> "+d
" Paste in normal and visual mode with Ctrl+V
nnoremap <C-v> "+gP
vnoremap <C-v> "+gP
