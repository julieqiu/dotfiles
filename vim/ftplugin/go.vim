set autoindent
set noexpandtab
set copyindent
set preserveindent
set softtabstop=0
set shiftwidth=4
set tabstop=4

" Settings: Go
let g:go_fmt_command = "goimports" "run goimports on write
nnoremap <leader>r :GoReferrers<CR>
nmap <Leader>e <Plug>(go-rename)
