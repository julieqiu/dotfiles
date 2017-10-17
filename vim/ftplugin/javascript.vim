set tabstop=2
set softtabstop=2
set shiftwidth=2
set textwidth=79
set expandtab
set autoindent
set fileformat=unix

" remove trailing spaces in JS & Markdown
autocmd BufWritePre *.js :%s/\s\+$//e
autocmd BufWritePre *.md :%s/\s\+$//e
