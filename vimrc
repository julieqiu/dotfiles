set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

"" If we're not in vi-compatible mode, then load advanced VIM code
"" like Bundles and colors
if !has("compatible")
  " Vundle code here
  call vundle#begin()

  " let Vundle manage Vundle, required
  Plugin 'VundleVim/Vundle.vim'
  Plugin 'altercation/vim-colors-solarized'
  Plugin 'bling/vim-airline'
  Plugin 'ctrlpvim/ctrlp.vim'
  Plugin 'fatih/vim-go'
  Plugin 'kien/rainbow_parentheses.vim'
  Plugin 'scrooloose/nerdcommenter'
  Plugin 'scrooloose/nerdtree'
  Plugin 'tpope/vim-fugitive'
  Plugin 'tpope/vim-surround'
  Plugin 'vim-syntastic/syntastic'
  " All of your Plugins must be added before the following line
  call vundle#end()            " required
endif

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


" Settings: Ctrl-P
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlPMRU'
" Ignore stuff with ctrl-p
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git\|dist'
"CtrlP settings to make it find all files
let g:ctrlp_max_files=0
let g:ctrlp_max_depth=40
let g:ctrlp_custom_ignore = '\v[\/](node_modules|darwin_amd64|dist)|(\.(swp|ico|git|svn))$'
nnoremap <C-b> :CtrlPBuffer <CR>


" Settings: NERDTree
nmap <C-n> :NERDTreeToggle <CR>


" Settings: Rainbow Parentheses
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces


" Settings: General
filetype plugin indent on
syntax on
syntax enable           " enable syntax processing
let mapleader = "\<Space>"
set clipboard=unnamed
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
" set textwidth=79
highlight ColorColumn ctermfg=Red
match ColorColumn /\%81v.\+/
set cursorline          " highlight current line
set lazyredraw          " redraw only when we need to.
set nowrap              " don't wrap lines
set number              " show line numbers
set relativenumber      " show relative numbers
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

" less-css syntax highlighting
au BufNewFile,BufRead *.less set filetype=less

" Syntastic
let g:syntastic_always_populate_loc_list=1
let g:syntastic_python_checkers = ['pylint']
let g:syntastic_python_mypy_args = '-s --incremental'
let g:syntastic_python_pylint_args = '--rcfile=/Users/julie/Code/branded/py3/pylint.ini'

nnoremap <Leader>n :ll<CR>
nnoremap <Leader>m :lnext<CR>

let g:ycm_server_python_interpreter = '/usr/bin/python'

"python with virtualenv support
py << EOF
import os
import sys

if 'VIRTUAL_ENV' in os.environ:
  project_base_dir = os.environ['VIRTUAL_ENV']
  activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
  execfile(activate_this, dict(__file__=activate_this))
EOF
