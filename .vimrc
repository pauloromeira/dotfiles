" Use Vim settings, rather than Vi settings.
" This must be first, because it changes other options as a side effect.
set nocompatible

" --- Vundle ---
" set the runtime path to include Vundle and initialize
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Plugins
" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

Plugin 'SirVer/ultisnips' 
Plugin 'honza/vim-snippets'
Plugin 'scrooloose/nerdtree'
Plugin 'altercation/vim-colors-solarized'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-unimpaired'

call vundle#end()            " required
filetype plugin indent on    " required
" --- // ---

" Allow backspacing over everything in insert mode.
set backspace=indent,eol,start

syntax enable

" Set line numbers.
set number

" Python space/tab rules.
set tabstop =4
set softtabstop =4
set shiftwidth =4
set expandtab

" Treat numbers with leading zeros as decimals instead of octals (<C-a> and <C-x>).
set nrformats=

" Go up and down one position in a wrapped line.
nnoremap k gk
nnoremap j gj

" Ex command autocomplete options
set wildmenu
set wildmode=full

set history=5000

" Set <C-p> and <C-n> to behave like up and down arrows (that can filter the
" history)
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>

if has('gui_running')
    set background=dark
    colorscheme solarized
endif

" Alternate buffers without having to save
set hidden

" Simplify shortcut for changing window
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" UltiSnips
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsListSnippets="<S-tab>"
