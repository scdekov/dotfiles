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
Plugin 'airblade/vim-gitgutter'
Plugin 'vim-airline/vim-airline-themes'
"Plugin 'pangloss/vim-javascript'
Plugin 'nfvs/vim-perforce'
"Plugin 'nvie/vim-flake8'
Plugin 'Valloric/YouCompleteMe'
Plugin 'scrooloose/nerdcommenter'
Plugin 'jmcantrell/vim-virtualenv'
Plugin 'python-mode/python-mode'
Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-session'
Plugin 'calebsmith/vim-lambdify'
Plugin 'janko-m/vim-test'
Plugin 'tpope/vim-surround'

call vundle#end()

execute pathogen#infect()

filetype plugin on
syntax on

set omnifunc=syntaxcomplete#Complete

set autoindent
set nowrap
set copyindent
set number
set showmatch
set shiftwidth=4
autocmd FileType less set shiftwidth=2
autocmd FileType pyhton set sts=4
autocmd FileType javascript set sts=4
set shiftround
set ignorecase
"set smartcase
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
autocmd filetype less let tabstop=2
set linebreak showbreak=+
set bg=dark
set colorcolumn=120
set spell

" highlight current line
set cursorline

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

" Cursorline
" Only show cursorline in the current window and in normal mode.
augroup cline
    au!
    au WinLeave,InsertEnter * set nocursorline
    au WinEnter,InsertLeave * set cursorline
augroup END

" Trailing whitespace
" Only shown when not in insert mode so I don't go insane.
augroup trailing
    au!
    au InsertEnter * :set listchars-=trail:.
augroup END

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

" Choose '^' or '0' depending on the cursor position.
function! CleverJumpFirst()
  let l:before = getline('.')[:col('.') - 1]
  if l:before =~ '^\s\+\S$'
    return '0'
  endif
  return '^'
endfunction
nnoremap <expr> 0 CleverJumpFirst()


" Start scrolling when you reach three lines before the end of the screen.
" Helps with the neck pain.
set scrolloff=3


filetype plugin indent on

" set leader to ,
let mapleader = ","


" Enable folding with the spacebar
nnoremap <space> za


" map sorting to leader s
vnoremap <Leader>s :sort<CR>

" easier moving of code blocks
vnoremap < <gv
vnoremap > >gv


:imap <C-Space> <C-X><C-O>
nnoremap <C-t> :NERDTreeToggle<CR>
let g:NERDTreeWinSize=60
let NERDTreeIgnore = ['\.pyc$', '__pycache__']
let g:NERDTreeChDirMode = 2
let g:NERDTreeQuitOnOpen = 1
nnoremap ; :

" Moving between splits
nmap <C-n> <C-w>w
nmap <silent> ,/ :nohlsearch<CR>
cmap w!! w !sudo tee % >/dev/null


" NERDTreeCommenter
nmap <C-/> <Plug>NERDComToggleComment


let g:airline#extensions#tmuxline#enabled = 0
let g:tmuxline_theme='molokai'
let g:airline_powerline_fonts = 1
let g:airline_enable_branch=1
let g:airline_enable_syntastic=1
let g:airline#extensions#branch#enabled=1
let g:airline_theme='molokai'


set t_Co=256
let g:solarized_termcolors=256
set background=dark
colorscheme solarized
call togglebg#map("<F5>")


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
nmap <C-g> :YcmCompleter GoTo<CR>
autocmd CompleteDone * pclose
let g:ycm_goto_buffer_command='horizontal-split'


" Python mode plugin
let g:pymode_rope = 0

" lining
let g:pymode_lint = 1
let g:pymode_lint_checker = "pyflakes,pep8"
let g:pymode_lint_ignore = "E126,E127,E128,W,C901"
let g:pymode_options_max_line_length = 120

let g:pymode_rope_goto_definition_bind = "<C-g>"
let g:pymode_virtualenv = 1
let g:pymode_breakpoint = 0

" syntax highlighting
let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
let g:pymode_syntax_space_errors = g:pymode_syntax_all


nmap <C-j> ]M
nmap <C-k> [M
nmap <C-h> [C
nmap <C-l> ]C

" Flake8
"let g:flake8_show_in_gutter = 1
"let g:flake8_show_in_file = 1
""" Auto check on save
"autocmd BufWritePre *.py call Flake8()

" GitGutter
set updatetime=250


"colors of matched bracket
hi MatchParen cterm=bold ctermbg=none ctermfg=magenta


"Quickly edit/reload the vimrc file
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>"


"ruler line
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%121v.\+/


"Perforce
let g:perforce_open_on_save = 1

"fix tabs inden/unindent
vnoremap <Tab> >
vnoremap <S-Tab> <


" CtrlSF
nmap <C-F>f <Plug>CtrlSFPrompt
let g:ctrlsf_ackprg = '/usr/local/bin/ag'
let g:ctrlsf_extra_backend_args = {'ag': '-U'}
let g:ctrlsf_auto_close = 0


" vim session
let g:session_autosave = 'no'


" set ctrlp working directory to a(the directory of the current working file)
" and r (the nearest ancestor of the current file that contains .git, .hg,
" .svn, .bzr)
"let g:ctrlp_working_path_mode = 'rw'
let g:ctrlp_custom_ignore = '\v[\/]\.(git|tox)$'
let g:ctrlp_switch_buffer = 0
let g:ctrlp_working_path_mode = 0


" stop annoying flashing on esc
set noeb vb t_vb=


" vim-test plugin
let g:test#python#pytest#file_pattern = '.*test.*'
nmap <silent> <leader>t :TestNearest<CR>
nmap <silent> <leader>T :TestFile<CR>


" used for vim-surround plugin
vmap s S


" add mapping for pdb
nmap dbg oimport ipdb;ipdb.set_trace()  # NOQA<Esc>
