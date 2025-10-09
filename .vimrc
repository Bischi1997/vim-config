" Enable source code highlighting
syntax on

" Special indent sizes, per language (i.e. file extension)
filetype plugin indent on

let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()
Plug 'morhetz/gruvbox' " colorscheme
Plug 'chase/vim-ansible-yaml'
Plug 'davidhalter/jedi-vim'
Plug 'tpope/vim-rails'
Plug 'vim-ruby/vim-ruby'
Plug 'preservim/nerdtree'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'} " autocompletion
Plug 'gergap/vim-ollama'
call plug#end()

colorscheme gruvbox

" Load config files for Plugin Configurations from ~/.vim/config/
for config in split(glob('~/.vim/config/*.vim'), '\n')
  execute 'source' config
endfor


" `matchit.vim` is built-in so let's enable it!
" Hit `%` on `if` to jump to `else`.
runtime macros/matchit.vim

" various settings
set updatetime=500             " trigger highlight after 0.5s idle time
set termguicolors              " enable 24-bit RGB color
set autoindent                 " Minimal automatic indenting for any filetype.
set backspace=indent,eol,start " Intuitive backspace behavior.
set hidden                     " Possibility to have more than one unsaved buffers.
set incsearch                  " Incremental search, hit `<CR>` to stop.
set ruler                      " Shows the current line number at the bottom-right of the screen.
set wildmenu                   " Great command-line completion, use `<Tab>` to move around and `<CR>` to validate.
set number                     " Add linenumbers in editor
set background=dark            " Start Theme in darkmode

