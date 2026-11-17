" Use Python virtual environment (and install packages via pip)
let g:ollama_use_venv = 1
" A Homebrew Python upgrade breaks the venv's interpreter link, and the plugin
" only rebuilds a missing venv, so drop a broken one to have it recreated.
let s:venv = expand('~/.vim/venv/ollama')
if isdirectory(s:venv) && !executable(s:venv . '/bin/python')
  call delete(s:venv, 'rf')
endif
" Ollama base URL
let g:ollama_host = 'http://localhost:11434'
" tab completion model
let g:ollama_model = 'qwen2.5-coder:1.5b'
" number of context lines to use for code completion
"let g:ollama_context_lines = 10
" debounce time to wait before triggering a completion
"let g:ollama_debounce_time = 300
" If you want to enable completion for a limited set of
" filetypes only, list them here.
"let g:ollama_completion_allowlist_filetype = []
" If you do not want to run completion for certain 
" filetypes, list them here.
"let g:ollama_completion_denylist_filetype = []

" chat model
let g:ollama_chat_model = 'qwen2.5-coder:7b'
" override chat system prompt
"let g:ollama_chat_systemprompt = 'Give funny answers.'

" edit model
let g:ollama_edit_model = 'qwen2.5-coder:7b'
" when disabled, LLM changes are applied directly. Useful when tracking changes via Git.
"let g:ollama_use_inline_diff = 0

imap <silent> ,a <Plug>(ollama-tab-completion)
imap <silent> ,w <Plug>(ollama-insert-word)
imap <silent> ,l <Plug>(ollama-insert-line)

" debug settings
"let g:ollama_debug = 4
" general log file location
"let g:ollama_logfile = '/tmp/logs/vim-ollama.log'
" ollama chat conversation log
"let g:ollama_review_logfile = '/tmp/logs/vim-ollama-review.log'

" vim: filetype=vim
