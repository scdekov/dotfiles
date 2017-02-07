set shell=/usr/bin/zsh
set nocompatible
filetype off

set clipboard+=unnamedplus

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'jiangmiao/auto-pairs'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'scrooloose/nerdtree'
Plugin 'vim-airline/vim-airline'
Plugin 'tpope/vim-fugitive'
Plugin 'kien/ctrlp.vim'
Plugin 'dyng/ctrlsf.vim'
Plugin 'tomasr/molokai'
Plugin 'altercation/vim-colors-solarized'
"Plugin 'airblade/vim-gitgutter'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'pangloss/vim-javascript'
Plugin 'nfvs/vim-perforce'
Plugin 'nvie/vim-flake8'
Plugin 'Valloric/YouCompleteMe'
Plugin 'scrooloose/nerdcommenter'
Plugin 'jmcantrell/vim-virtualenv'
Plugin 'python-mode/python-mode'

call vundle#end()

execute pathogen#infect()

filetype plugin on

set omnifunc=syntaxcomplete#Complete

set autoindent
set clipboard=unnamed
set nowrap
set copyindent
set relativenumber
set number
set showmatch
set shiftwidth=4
set shiftround
set ignorecase
set smartcase
set smarttab
set hlsearch
set incsearch
set history=1000
set undolevels=1000
set wildignore=*.swp,*.bak,*.pyc,*.class
set title
set visualbell
set noerrorbells
set expandtab
set showcmd
set wildmenu
set lazyredraw
set foldenable
set foldlevelstart=10
set foldnestmax=10
set foldmethod=indent
set encoding=utf-8
set list
set listchars=tab:>∙,trail:∙,extends:#,nbsp:∙
autocmd filetype html,xml set listchars-=tab:>.
set pastetoggle=<F2>
set mouse=a
set laststatus=2
set fillchars+=stl:\ ,stlnc:\
let tabstop=4
set linebreak showbreak=+

" highlight current line
set cursorline
set cmdheight=1
set showtabline=2
set display+=lastline

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" display incomplete commands
set showcmd

" Show editing mode
set showmode
set lazyredraw

" Disable EX mode
:map Q <Nop>

" Undo {{{
if exists("&undodir")
    set undofile          "Persistent undo! Pure money.
    let &undodir=&directory
    set undolevels=500
    set undoreload=500
endif
" }}}
" Cursorline {{{
" Only show cursorline in the current window and in normal mode.

augroup cline
    au!
    au WinLeave,InsertEnter * set nocursorline
    au WinEnter,InsertLeave * set cursorline
augroup END

" }}}
" Trailing whitespace {{{
" Only shown when not in insert mode so I don't go insane.

augroup trailing
    au!
    au InsertEnter * :set listchars-=trail:.
augroup END

" }}}
" Wildmenu completion {{{

" make tab completion for files/buffers act like bash
set wildmenu


" Make sure Vim returns to the same line when you reopen a file.
" Thanks, Amit
augroup line_return
    au!
    au BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \     execute 'normal! g`"zvzz' |
        \ endif
augroup END


filetype plugin indent on

" set leader to ,
let mapleader = ","


" map sorting to leader s
vnoremap <Leader>s :sort<CR>

" easier moving of code blocks
vnoremap < <gv
vnoremap > >gv


:imap <C-Space> <C-X><C-O>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap ; :
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
nmap <silent> ,/ :nohlsearch<CR>
cmap w!! w !sudo tee % >/dev/null


" moving around tabs
noremap tn :tabnew<Space>
noremap th :tabprev<CR>
nnoremap tl :tabnext<CR>

" NERDTreeCommenter
nmap <C-/> <Plug>NERDComToggleComment

syntax on


let g:airline#extensions#tmuxline#enabled = 0
let g:tmuxline_theme='molokai'
let g:airline_powerline_fonts = 1
let g:airline_enable_branch=1
let g:airline_enable_syntastic=1
let g:airline#extensions#branch#enabled=1
let g:airline_theme='molokai'


colorscheme solarized
set background=dark
set t_Co=256


if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

let g:airline_symbols.space = "\ua0"
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

let g:multi_cursor_use_default_mapping=0
let g:multi_cursor_next_key='<C-b>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'


" You complete me plugin
"let g:ycm_python_binary_path = '/home/svetlio/Projects/VW/venvcustomers/bin/python'
"nmap <C-g> :YcmCompleter GoTo<CR>


" Python mode plugin
let g:pymode_rope_goto_definition_bind = "<C-g>"



"colors of matched bracket
hi MatchParen cterm=bold ctermbg=none ctermfg=magenta

"Quickly edit/reload the vimrc file
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>"

"ruler line
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%121v.\+/


"Linting
let g:pymode_lint = 1
let g:pymode_lint_checker = "pyflakes,pep8"
"" Auto check on save
let g:pymode_lint_on_write = 1
autocmd BufWritePost *.py call Flake8()
let g:pymode_lint_ignore = "E501,E126,E127,E128,W"


"Perforce
let g:perforce_open_on_save = 1

"fix tabs inden/unindent
vnoremap <Tab> >
vnoremap <S-Tab> <


" CtrlSF
nmap <C-F>f <Plug>CtrlSFPrompt
