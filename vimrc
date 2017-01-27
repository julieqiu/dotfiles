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
  Plugin 'ctrlpvim/ctrlp.vim'
  Plugin 'fatih/vim-go'
  Plugin 'kien/rainbow_parentheses.vim'
  Plugin 'nvie/vim-flake8'
  Plugin 'rking/ag.vim'
  Plugin 'scrooloose/nerdtree'
  Plugin 'tpope/vim-fugitive'
  Plugin 'tpope/vim-ragtag'
  Plugin 'tpope/vim-surround'
  Plugin 'Valloric/YouCompleteMe'
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

" automatically reload vimrc when it's saved
au BufWritePost .vimrc so ~/.vimrc

" Settings: General
filetype plugin indent on
syntax on
syntax enable           " enable syntax processing
let mapleader = "\<Space>"
set shell=/bin/zsh
set encoding=utf-8
set timeoutlen=1000 ttimeoutlen=10
nnoremap ; :
highlight ColorColumn ctermfg=Red
match ColorColumn /\%81v.\+/
set textwidth=79
set clipboard=unnamed
set noswapfile
imap <C-q> <Esc>


" Settings: Color Scheme
" Change cursor shape between insert and normal mode in iTerm2.app
if $TERM_PROGRAM =~ "iTerm"
    let &t_SI = "\<Esc>]50;CursorShape=1\x7" " Vertical bar in insert mode
    let &t_EI = "\<Esc>]50;CursorShape=0\x7" " Block in normal mode
endif


" Settings: Color Scheme
set background=dark
let g:solarized_termtrans = 1
let g:solarized_termcolors=16
colorscheme solarized
set t_Co=256            " 256 colors

set wildmenu
" highlight Normal guibg=black ctermbg=black ctermfg=white

" Remove menu bar
set guioptions-=m

" Remove toolbar
set guioptions-=T

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
set cursorline          " highlight current line
set lazyredraw          " redraw only when we need to.
set nowrap              " don't wrap lines
set number              " show line numbers
set relativenumber      " show relative numbers
set showcmd             " show command in bottom bar
set showmatch           " show matching parenthesis
set ruler

" Number Toggle between Relative and Absolute Numbers
au FocusLost * :set number
au FocusGained * :set relativenumber
function! NumberToggle()
    if(&relativenumber == 1)
        set number
    else
        set relativenumber
    endif
endfunc

nnoremap <leader>n :call NumberToggle()<CR>

" Settings: Navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
set splitbelow
set splitright
nnoremap ,rs  :resize
nnoremap ,vrs :vertical resize
nnoremap <C-a> <S-^>
nnoremap <C-e> <S-$>
nnoremap j gj
nnoremap k gk


" Settings: Mouse & Scrolling
set mouse=a
"noremap! <LeftDrag> <nop>
"noremap <LeftDrag> <nop>
nnoremap <2-LeftMouse> <nop>
inoremap <2-LeftMouse> <nop>
vnoremap <2-LeftMouse> <nop>
nnoremap <ScrollWheelUp> <C-y>
nnoremap <ScrollWheelDown> <C-e>
nnoremap <Up> <C-y>
nnoremap <Down> <C-e>


" Switch to paste mode if you're getting autoindent problems.
nmap <Leader>p :set paste!<CR>:set paste?<CR>


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


" Plugin Settings: Silver Searcher
nnoremap \ :Ag<SPACE>
let g:ackprg = 'ag --vimgrep'
let g:ag_working_path_mode= 'r'


" Plugin Settings: VIM-airline
					" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1
					" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'


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



" Settings: Buffer
set confirm
set hidden

" Use ctrl-[hjkl] to select the active split
nmap <silent> <c-k> :wincmd k<CR>
nmap <silent> <c-j> :wincmd j<CR>
nmap <silent> <c-h> :wincmd h<CR>
nmap <silent> <c-l> :wincmd l<CR>

nnoremap <C-s> :update<CR>
inoremap <C-s> <C-o>:Update<CR>
vnoremap <C-s> <C-o>:Update<CR>
nnoremap <leader>ma :set modifiable<CR>
" Open and Close Buffers
nnoremap <leader>q  :bp <BAR> bd #<CR>
nnoremap <leader>bw :bw <BAR> bw #<CR>
nnoremap <leader>T :enew<cr>
" Edit Buffers
nnoremap <leader>w :w<CR><CR>
nnoremap <leader>e :edit<Space>
nnoremap :w :w<CR>
" Prints a numbered list of filenames when F5 is pressed
nnoremap <F5> :buffers<CR>:buffer<Space>
" Mappings to access buffers (don't use "\p" because a
" delay before pressing "p" would accidentally paste).
" Previous, Next, Last Used
" \b \f \g : go back/forward/last-used
nnoremap <Leader>[ :bp<CR>
nnoremap <Leader>] :bn<CR>
" Jump to Buffer Number
" \1 \2 \3 : go to buffer 1/2/3 etc
nnoremap <Leader>1 :1b<CR>
nnoremap <Leader>2 :2b<CR>
nnoremap <Leader>3 :3b<CR>
nnoremap <Leader>4 :4b<CR>
nnoremap <Leader>5 :5b<CR>
nnoremap <Leader>6 :6b<CR>
nnoremap <Leader>7 :7b<CR>
nnoremap <Leader>8 :8b<CR>
nnoremap <Leader>9 :9b<CR>
nnoremap <Leader>0 :10b<CR>
" Show the buffer number in the status line.
set laststatus=2


" " supertab should use omnicomplete
" let g:SuperTabDefaultCompletionType = "<c-x><c-o>"
" " supertab should finish autocomplete when enter is hit
" let g:SuperTabCrMapping = 1
" " Let me continue typing for autocomplete
" set completeopt=longest,menuone
" let g:omni_sql_no_default_maps = 1

" vim swap files make crontab unhappy. This allows `crontab -e` to work
" correctly.
autocmd filetype crontab setlocal nobackup nowritebackup

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

set gfn=Monaco:h18

" automatically reload vimrc when it's saved
au BufWritePost .vimrc so ~/.vimrc

" auto-resize window splits after screen change
augroup Misc
    autocmd!
    autocmd VimResized * exe "normal! \<c-w>="
augroup END

" disable autofolding in vim-markdown
let g:vim_markdown_folding_disabled=1

" Disable beeping in vim
set noerrorbells visualbell t_vb=
if has('autocmd')
    autocmd GUIEnter * set visualbell t_vb=
endif
