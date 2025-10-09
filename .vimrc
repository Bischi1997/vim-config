" Load config files for Plugin Configurations from ~/.vim/config/
for config in split(glob('~/.vim/config/*.vim'), '\n')
  execute 'source' config
endfor

colorscheme gruvbox

" `matchit.vim` is built-in so let's enable it!
" Hit `%` on `if` to jump to `else`.
runtime macros/matchit.vim

" various settings
set autoindent                 " Minimal automatic indenting for any filetype.
set backspace=indent,eol,start " Intuitive backspace behavior.
set hidden                     " Possibility to have more than one unsaved buffers.
set incsearch                  " Incremental search, hit `<CR>` to stop.
set ruler                      " Shows the current line number at the bottom-right of the screen.
set wildmenu                   " Great command-line completion, use `<Tab>` to move around and `<CR>` to validate.
set number                     " Add linenumbers in editor
set background=dark            " Start Theme in darkmode

" Enable source code highlighting
syntax on

" Special indent sizes, per language (i.e. file extension)
filetype plugin indent on

