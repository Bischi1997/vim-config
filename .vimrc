let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" CoC owns the popup menu; Ollama gets explicit mappings in config/ollama.vim.
let g:ollama_no_tab_map = v:true

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

" Enable source code highlighting
syntax on
" Special indent sizes, per language (i.e. file extension)
filetype plugin indent on
" Set colorscheme
silent! colorscheme gruvbox

" Load config files for Plugin Configurations from ~/.vim/config/
for config in split(glob('~/.vim/config/*.vim'), '\n')
  execute 'source' config
endfor

" `matchit.vim` is built-in so let's enable it!
" Hit `%` on `if` to jump to `else`.
runtime macros/matchit.vim

" various settings
set updatetime=300             " trigger highlight after 0.3s idle time
set termguicolors              " enable 24-bit RGB color
set autoindent                 " Minimal automatic indenting for any filetype.
set backspace=indent,eol,start " Intuitive backspace behavior.
set hidden                     " Possibility to have more than one unsaved buffers.
set incsearch                  " Incremental search, hit `<CR>` to stop.
set ruler                      " Shows the current line number at the bottom-right of the screen.
set wildmenu                   " Great command-line completion, use `<Tab>` to move around and `<CR>` to validate.
set number                     " Add linenumbers in editor
set background=dark            " Start Theme in darkmode
set mouse=a                  " Enable mouse support
set undofile                   " Persist undo history across sessions
set undodir=~/.vim/undo        " Directory for undo files
