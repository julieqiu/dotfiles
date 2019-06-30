" Specify a directory for plugins
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')
  Plug 'altercation/vim-colors-solarized'
  Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }
  Plug 'ctrlpvim/ctrlp.vim'
  Plug 'junegunn/fzf'

  " Initialize plugin system
call plug#end()

filetype plugin indent on
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line


" My stuff

" Settings: Go Configuration
set autowrite " writes the content of the file automatically if you call :make
" Shortcuts for the quickfix list
map <C-n> :cnext<CR>
map <C-m> :cprevious<CR>
nnoremap <leader>a :cclose<CR>

" run :GoRun
autocmd FileType go nmap <leader>r  <Plug>(go-run)

" run :GoTest
autocmd FileType go nmap <leader>t  <Plug>(go-test)

" Set all lists to type quickfix
let g:go_list_type = "quickfix"


" Settings: Color Scheme
" Change cursor shape between insert and normal mode in iTerm2.app
if $TERM_PROGRAM =~ "iTerm"
    let &t_SI = "\<Esc>]50;CursorShape=1\x7" " Vertical bar in insert mode
    let &t_EI = "\<Esc>]50;CursorShape=0\x7" " Block in normal mode
endif


" Settings: Solarized
set background=light
let g:solarized_termtrans = 1
let g:solarized_termcolors=16
colorscheme solarized
set t_Co=256            " 256 colors


" Settings: General
syntax on
syntax enable           " enable syntax processing
let mapleader = "\<Space>"
set noswapfile

" Settings: Remove trailing whitespace
autocmd BufWritePre * :%s/\s\+$//e
" highlight trailing whitespace characters
" http://vim.wikia.com/wiki/Highlight_unwanted_spaces
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()


" Settings: Display
set encoding=utf-8
set gfn=Monaco:h18
set textwidth=79
highlight ColorColumn ctermfg=Red
match ColorColumn /\%81v.\+/
set cursorline          " highlight current line
set lazyredraw          " redraw only when we need to.
set nowrap              " don't wrap lines
set number              " show line numbers
" set relativenumber      " show relative numbers
set showcmd             " show command in bottom bar
set showmatch           " show matching parenthesis
set wildmenu
set ruler


" Settings: Navigation
set splitbelow
set splitright
nnoremap <C-a> <S-^>
nnoremap <C-e> <S-$>
nnoremap j gj
nnoremap k gk


" Settings: Mouse & Scrolling
set mouse=a
nnoremap <2-LeftMouse> <nop>
inoremap <2-LeftMouse> <nop>
vnoremap <2-LeftMouse> <nop>
nnoremap <ScrollWheelUp> <C-y>
nnoremap <ScrollWheelDown> <C-e>
nnoremap <Up> <C-y>
nnoremap <Down> <C-e>


" Settings: Typing
set autoindent
set backspace=2
set copyindent		" copy structure of existing lines indent
set paste
set smartindent
set sts=4 sw=4 ts=4 et
" nnoremap <C-s-v> :set paste <CR><Insert>
nnoremap <S-Enter> i<Enter><Esc>
" When using << or >> to shift indents, line the text up to the next logical
" indentation rather than just a hard indent. E.g., if a line is two spaces off
" and indent is supposed to be four spaces, >> will fix it, but only if
" shiftwidth is set. Otherwise it would just move it four spaces to the right.
set shiftround


" Settings: Search
set hlsearch
set incsearch
nmap <silent> ,/ :nohlsearch<CR>
						" clears search buffer with ,/
nnoremap <leader><space> :nohlsearch<CR>
                        " turn off search highlight

set nostartofline
			" Stop certain movements from
			" always going to the first character of a line.
set ignorecase
set smartcase

" Edit Buffers
nnoremap <leader>w :w<CR>
nnoremap <leader>e :edit<Space>
" Show the buffer number in the status line.
set laststatus=2

" don't use spaces for makefiles
autocmd FileType make set noexpandtab

" set html tab-width to 2
autocmd FileType html setlocal shiftwidth=2 tabstop=2

" set javascript tab-width to 2
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2

" set css tab-width to 2
autocmd FileType css setlocal shiftwidth=2 tabstop=2
autocmd FileType scss setlocal shiftwidth=2 tabstop=2
autocmd FileType sass setlocal shiftwidth=2 tabstop=2

nnoremap <Leader>n :ll<CR>
nnoremap <Leader>m :lnext<CR>

set clipboard=unnamed

" Required for operations modifying multiple buffers like rename.
set hidden

" Settings: autozimu/LanguageClient-neovim: BEGIN
let g:LanguageClient_serverCommands = {
    \ 'rust': ['~/.cargo/bin/rustup', 'run', 'stable', 'rls'],
    \ 'javascript': ['/usr/local/bin/javascript-typescript-stdio'],
    \ 'javascript.jsx': ['tcp://127.0.0.1:2089'],
    \ 'python': ['/usr/local/bin/pyls'],
    \ 'ruby': ['~/.rbenv/shims/solargraph', 'stdio'],
    \ 'go': ['gopls']
    \ }

nnoremap <F5> :call LanguageClient_contextMenu()<CR>
" Or map each action separately
nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>
" Run gofmt and goimports on save
autocmd BufWritePre *.go :call LanguageClient#textDocument_formatting_sync()
" autozimu/LanguageClient-neovim: END

" Settings: Ctrl-P: BEGIN
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc,.pyc,__pycache__
let g:ctrlp_custom_ignore = '\v[\/](node_modules|darwin_amd64|dist)|(\.(swp|ico|git|svn))$'
let g:ctrlp_user_command = "find %s -type f | grep -Ev '"+ g:ctrlp_custom_ignore +"'"
let g:ctrlp_use_caching = 0
let g:ctrlp_map = '<c-p>'

let g:ctrlp_max_files=0
let g:ctrlp_max_depth=40

" ctrl-p speed ups
let g:ctrlp_user_command = 'ag %s -i --nocolor --nogroup --hidden
      \ --ignore .git
      \ --ignore .svn
      \ --ignore .hg
      \ --ignore .DS_Store
      \ --ignore "**/*.pyc"
      \ -g ""'

let g:ctrlp_open_new_file = 'r'
let g:ctrlp_working_path_mode = 'r'
" 'c' - the directory of the current file.
" 'r' - the nearest ancestor that contains one of these directories or files: .git .hg .svn .bzr
" 'a' - like c, but only if the current working directory outside of CtrlP is not a direct ancestor of the directory of the current file.
" 0 or '' (empty string) - disable this feature.
" Ctrl-P: BEGIN
