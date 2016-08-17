set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'bling/vim-airline'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'ervandew/supertab'
Plugin 'fatih/vim-go'
Plugin 'rking/ag.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-surround'
Plugin 'klen/python-mode'
Plugin 'nvie/vim-flake8'
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on


" My stuff

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

" Settings: Color Scheme
set background=dark
let g:solarized_termtrans = 1
let g:solarized_termcolors=16
colorscheme solarized


" Settings: Remove trailing whitespace
 autocmd BufWritePre * :%s/\s\+$//e


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

" Suppose I have a really long comment and it's way too long and we want to
" make it multiline.  But this should be on the same line.

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
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
nnoremap j gj
nnoremap k gk


" Settings: Mouse & Scrolling
set mouse=n
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


" Settings: NERDTree
nmap <C-t> :NERDTreeToggle <CR>


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
nnoremap <leader>l :wincmd l<CR>
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
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
nnoremap <Leader>b :e#<CR>
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

" supertab should use omnicomplete
let g:SuperTabDefaultCompletionType = "<c-x><c-o>"
" supertab should finish autocomplete when enter is hit
let g:SuperTabCrMapping = 1
" Let me continue typing for autocomplete
set completeopt=longest,menuone
let g:omni_sql_no_default_maps = 1

" vim swap files make crontab unhappy. This allows `crontab -e` to work
" correctly.
autocmd filetype crontab setlocal nobackup nowritebackup
