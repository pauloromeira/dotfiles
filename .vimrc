" vim: foldmethod=marker
" Use Vim settings, rather than Vi settings.
" This must be first, because it changes other options as a side effect.
set nocompatible

" {{{1 Plugins

" {{{2 Init
" Set the runtime path to include Vundle and initialize
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" Let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" {{{2 Def
Plugin 'SirVer/ultisnips' 
Plugin 'honza/vim-snippets'
Plugin 'scrooloose/nerdtree'
Plugin 'altercation/vim-colors-solarized'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-unimpaired'
Plugin 'tpope/vim-fugitive'
Plugin 'bling/vim-airline'
Plugin 'majutsushi/tagbar'
Plugin 'tmhedberg/SimpylFold'

" {{{2 End
call vundle#end() " required
filetype plugin indent on " required

" {{{2 Config
" UltiSnips
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsListSnippets="<S-tab>"
" Airline
set laststatus=2
" Tagbar
nmap <F8> :TagbarToggle<CR>
" NERDTree
nmap <F7> :NERDTreeToggle<CR>
" SimplyFold
if has('autocmd')
    autocmd BufWinEnter *.py setlocal foldexpr=SimpylFold(v:lnum) foldmethod=expr
    autocmd BufWinLeave *.py setlocal foldexpr< foldmethod<
    " Start unfolded
    autocmd BufRead * normal zR
endif

" {{{1 Preferences

syntax enable
set backspace=indent,eol,start " Allow backspacing over everything in insert mode.
set number " Set line numbers.
set nrformats= " Treat numbers with leading zeros as decimals instead of octals (<C-a> and <C-x>).
set history=5000
set hidden " Alternate buffers without having to save
" Set colorscheme only for gui
if has('gui_running')
    set background=dark
    colorscheme solarized
endif
" Python space/tab rules.
set tabstop =4
set softtabstop =4
set shiftwidth =4
set expandtab
" Ex command autocomplete options
set wildmenu
set wildmode=full

" {{{1  Mappings
" Simplify shortcut for changing window
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
" Change <C-p> and <C-n> behave to filter the history
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>
" Go up and down one position in a wrapped line.
nnoremap k gk
nnoremap j gj
