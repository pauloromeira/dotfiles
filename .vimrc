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

Plugin 'altercation/vim-colors-solarized'
Plugin 'bling/vim-airline'
Plugin 'easymotion/vim-easymotion'
Plugin 'kien/ctrlp.vim'
Plugin 'majutsushi/tagbar'
Plugin 'pauloromeira/vim-snippets'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'SirVer/ultisnips' 
Plugin 'tmhedberg/SimpylFold'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-unimpaired'
" Plugin 'Valloric/YouCompleteMe'

" {{{2 End
call vundle#end() " required
filetype plugin indent on " required

" {{{2 Config
" UltiSnips
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsListSnippets="<S-tab>"
let g:UltiSnipsSnippetsDir="~/.vim/custom-snippets/UltiSnips"
set rtp+=~/.vim/custom-snippets " Include custom snippets directory in runtime path
" Airline
set laststatus=2
" Tagbar
nmap <F8> :TagbarToggle<CR>
" NERDTree
nmap <F7> :NERDTreeToggle<CR>
" SimplyFold
if has('autocmd')
    au BufWinEnter *.py setlocal foldexpr=SimpylFold(v:lnum) foldmethod=expr
    au BufWinLeave *.py setlocal foldexpr< foldmethod<
    " Starts unfolded
    au BufRead * normal zR
endif
" Solarized Colorscheme
if has('gui_running') " Only GUI
    set background=dark
    colorscheme solarized
endif

" {{{1 Preferences

syntax enable
set backspace=indent,eol,start " Allow backspacing over everything in insert mode.
" Set lines numbering
set number
set relativenumber
nnoremap <silent><Leader>n :set relativenumber!<cr>
if has('autocmd')
    au InsertEnter * :set norelativenumber
    au InsertLeave * :set relativenumber
endif

set nrformats= " Treat numbers with leading zeros as decimals instead of octals (<C-a> and <C-x>).
set history=5000
set hidden " Alternate buffers without having to save
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
