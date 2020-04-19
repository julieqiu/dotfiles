" Specify a directory for plugins
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')
  Plug 'altercation/vim-colors-solarized'
  Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }
  Plug 'ctrlpvim/ctrlp.vim'
  Plug 'govim/govim'
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
set background=dark
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

set clipboard^=unnamed,unnamedplus

" Required for operations modifying multiple buffers like rename.
set hidden

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


" go-vim

" To get hover working in the terminal we need to set ttymouse. See
"
" :help ttymouse
"
" for the appropriate setting for your terminal. Note that despite the
" automated tests using xterm as the terminal, a setting of ttymouse=xterm
" does not work correctly beyond a certain column number (citation needed)
" hence we use ttymouse=sgr
set ttymouse=sgr

" Suggestion: By default, govim populates the quickfix window with diagnostics
" reported by gopls after a period of inactivity, the time period being
" defined by updatetime (help updatetime). Here we suggest a short updatetime
" time in order that govim/Vim are more responsive/IDE-like
set updatetime=500

" Suggestion: To make govim/Vim more responsive/IDE-like, we suggest a short
" balloondelay
set balloondelay=250

" Suggestion: Turn on the sign column so you can see error marks on lines
" where there are quickfix errors. Some users who already show line number
" might prefer to instead have the signs shown in the number column; in which
" case set signcolumn=number
" set signcolumn=yes

" Suggestion: Turn on syntax highlighting for .go files. You might prefer to
" turn on syntax highlighting for all files, in which case
"
" syntax on
"
" will suffice, no autocmd required.
autocmd! BufEnter,BufNewFile *.go syntax on
autocmd! BufLeave *.go syntax off

" Suggestion: show info for completion candidates in a popup menu
if has("patch-8.1.1904")
  set completeopt+=popup
  set completepopup=align:menu,border:off,highlight:Pmenu
endif


call govim#config#Set("FormatOnSave", "gofmt")
