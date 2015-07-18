" Use Vim settings, rather than Vi settings.
" This must be first, because it changes other options as a side effect.
set nocompatible
let mapleader="\<Space>"
" vim: foldmethod=marker


" Plugins  "

" Initialize  "
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim' " Let Vundle manage Vundle - required

" Definitions  "
Plugin 'altercation/vim-colors-solarized'
Plugin 'bling/vim-airline'
Plugin 'majutsushi/tagbar'
Plugin 'scrooloose/nerdtree'
Plugin 'SirVer/ultisnips'
Plugin 'tmhedberg/SimpylFold'
Plugin 'scrooloose/syntastic'
Plugin 'easymotion/vim-easymotion'
Plugin 'kien/ctrlp.vim'
Plugin 'honza/vim-snippets'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-unimpaired'
Plugin 'tpope/vim-rsi'
Plugin 'vim-scripts/IndexedSearch'
Plugin 'michaeljsmith/vim-indent-object' " ii / ai
Plugin 'jeetsukumaran/vim-indentwise'

if !has('gui_running')
    Plugin 'Valloric/YouCompleteMe'
endif

" To Test  "
" Plugin 'mileszs/ack.vim' " ou 'rking/ag.vim'
" Plugin 'vim-scripts/LustyExplorer'
" Automatically find root project directory
" Plugin 'airblade/vim-rooter'
" Navitate freely between tmux and vim
" Plug 'christoomey/vim-tmux-navigator'
" " Better search tools
" Plug 'vim-scripts/SmartCase'
" Plug 'vim-scripts/gitignore'
" Plugin 'nathanaelkane/vim-indent-guides'
" Plugin 'vim-scripts/repeatable-motions.vim'

" End  "
call vundle#end() " required
filetype plugin indent on " required

" Settings  "
" (  Solarized  )
set background=dark
colorscheme solarized
" (  Airline  )
set laststatus=2
let g:airline_powerline_fonts=1
let g:airline_left_sep=''
let g:airline_right_sep=''

" (  Tagbar  )
nmap <F8> :TagbarToggle<CR>
" (  NERDTree  )
nmap <F7> :NERDTreeToggle<CR>
" (  UltiSnipets  )
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsExpandTrigger="<C-j>"
let g:UltiSnipsJumpForwardTrigger="<C-j>"
let g:UltiSnipsJumpBackwardTrigger="<C-k>"
let g:UltiSnipsListSnippets="<C-l>"
let g:UltiSnipsSnippetsDir="~/.vim/custom-snippets/UltiSnips"
set rtp+=~/.vim/custom-snippets " Include custom snippets directory in runtime path
" (  SimpylFold  )
if has('autocmd')
    au BufWinEnter *.py setlocal foldexpr=SimpylFold(v:lnum) foldmethod=expr
    au BufWinLeave *.py setlocal foldexpr< foldmethod<
endif
" (  Syntastic  )
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*
" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 0
" (  YouCompleteMe  )
if !has('gui_running')
    let g:ycm_collect_identifiers_from_tags_files = 1 " Let YCM read tags from Ctags file
    let g:ycm_use_ultisnips_completer = 1 " Default 1, just ensure
    let g:ycm_seed_identifiers_with_syntax = 1 " Completion for programming language's keyword
    let g:ycm_complete_in_comments = 1 " Completion in comments
    let g:ycm_complete_in_strings = 1 " Completion in string
    let g:ycm_add_preview_to_completeopt = 1
    let g:ycm_autoclose_preview_window_after_completion = 1
endif
" (  CtrlP  )
let g:ctrlp_map = '<C-o>'

" Preferences  "
syntax enable
set backspace=indent,eol,start " Allow backspacing over everything in insert mode.
" Set lines numbering
set number relativenumber
set nrformats= " Treat numbers with leading zeros as decimals instead of octals (<C-a> and <C-x>).
set history=5000
" set hidden " Alternate buffers without having to save
" Python space/tab rules.
set tabstop =4
set softtabstop =4
set shiftwidth =4
set expandtab
" set cursorline cursorcolumn
set showcmd
" set hlsearch
set incsearch
" Autocmd settings
if has('autocmd')
    au InsertEnter * :set norelativenumber
    au InsertLeave * :set relativenumber
    " Enable Spell Checking for markdown files
    au BufRead,BufNewFile *.md setlocal spell
    au BufRead,BufNewFile *.markdown setlocal spell
    " au WinEnter * :set cursorline cursorcolumn
    " au WinLeave * :set nocursorline nocursorcolumn
    " Starts unfolded
    au BufRead,BufNewFile * normal zR
    au BufWritePost .vimrc source $MYVIMRC " reload vimrc after change
    " This beauty remembers where you were the last time you edited the file, and returns to the same position.
    au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif
endif
" Ex command autocomplete options
set wildmenu
set wildmode=full

" Mappings  "
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
" Copy & paste to system clipboard
nmap <Leader>d "+d
nmap <Leader>P "+P
nmap <Leader>p "+p
nmap <Leader>y "+y
vmap <Leader>d "+d
vmap <Leader>P "+P
vmap <Leader>p "+p
vmap <Leader>y "+y

nmap <Leader>q :confirm q<CR>
nmap <Leader><S-q> :confirm qall<CR>
nmap <Leader>s :update<CR>
nmap <Leader><S-s> :wall<CR>
nmap <Leader>ev :tabedit $MYVIMRC<CR>
nmap <Leader>eb :tabedit ~/.bash_profile<CR>

" Tab mapping
" Also possible to use 'n<Tab>' to go to a specific tab
nnoremap <Tab> gt
nnoremap <S-Tab> gT
nmap <silent> [<Tab> :tabm -1<CR>
nmap <silent> ]<Tab> :tabm +1<CR>
nmap <silent> [<S-Tab> :tabm 0<CR>
nmap <silent> ]<S-Tab> :tabm<CR>
nmap <silent> y<Tab> :tabnew<CR>
nmap <silent> d<Tab> :tabclose<CR>
" Change the jump-motions, since <Tab> affects the ctrl-i
nnoremap <C-p> <C-o>
nnoremap <C-n> <C-i>
