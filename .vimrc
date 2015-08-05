" .vimrc of Paulo Romeira                                                 {{{1
" vim: set foldmethod=marker:
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set nocompatible " Use Vim settings, rather than Vi settings.
let mapleader=" "
filetype off

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                   Plugins                              {{{1 "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let s:firstrun=0
if !filereadable(expand("~/.vim/autoload/plug.vim"))
  let s:firstrun=1
  silent !mkdir -p ~/.vim/autoload
  silent !curl -fLo ~/.vim/autoload/plug.vim
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
        \ || wget -O ~/.vim/autoload/plug.vim
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

call plug#begin('~/.vim/plugged')

Plug 'altercation/vim-colors-solarized'
Plug 'morhetz/gruvbox'
Plug 'bling/vim-airline'
Plug 'majutsushi/tagbar'
Plug 'scrooloose/nerdtree', { 'on':  ['NERDTreeToggle', 'NERDTreeFind'] }
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
      \ | Plug 'pauloromeira/vim-custom-snippets'
Plug 'scrooloose/syntastic'
Plug 'easymotion/vim-easymotion', { 'on': ['<Plug>(easymotion-w)',
      \ '<Plug>(easymotion-s)'] }
Plug 'kien/ctrlp.vim'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-rsi'
Plug 'vim-scripts/IndexedSearch'
Plug 'michaeljsmith/vim-indent-object' " ii / ai
Plug 'natw/keyboard_cat.vim', { 'on': 'PlayMeOff' } " Pretend you can type fast
Plug 'pauloromeira/restore_view.vim'
Plug 'klen/python-mode', { 'for': 'python' }

" Plug 'tmhedberg/SimpylFold' " Python folding (depend upon restore_view)
" Plug 'jeetsukumaran/vim-indentwise' " Indent motions

if !has('gui_running')
  Plug 'Valloric/YouCompleteMe', { 'do': './install.sh' }
endif

" To Test "
" Plug 'mileszs/ack.vim' " ou 'rking/ag.vim'
" Plug 'airblade/vim-gitgutter'
" Plug 'terryma/vim-multiple-cursors'
" Plug 'vim-scripts/LustyExplorer'
" Plug 'airblade/vim-rooter' " Automatically find root project directory
" Plug 'christoomey/vim-tmux-navigator' " Navitate freely between tmux and vim
" " Better search tools
" Plug 'vim-scripts/SmartCase'
" Plug 'vim-scripts/gitignore'
" Plug 'nathanaelkane/vim-indent-guides'
" Plug 'vim-scripts/repeatable-motions.vim'

" End "
call plug#end() " required
if s:firstrun == 1
  :PlugInstall
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                 Vim Behavior                           {{{1 "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set backspace=indent,eol,start " Sane backspacing in insert mode
set nrformats= " Treat numbers with leading zeros as decimals instead of octals
set history=2000
set undolevels=1000
set hidden " Alternate buffers without having to save
set number relativenumber
set showcmd
set scrolloff=10 " Scroll so we can always see 10 lines around the cursor
set textwidth=79 " Wrap at 79 characters
" set hlsearch
set incsearch
" Autocmd settings
if has('autocmd')
  au InsertEnter * :set norelativenumber
  au InsertLeave * :set relativenumber
  " Enable Spell Checking for markdown files
  au BufRead,BufNewFile *.md setlocal spell
  au BufRead,BufNewFile *.markdown setlocal spell
  au BufWritePost .vimrc source $MYVIMRC " reload vimrc after change
endif
" Ex command autocomplete options
set wildmenu
set wildmode=full

" Disable backup and swap files
" set nobackup
" set nowritebackup
" set noswapfile

set nostartofline " Keep the cursor on the same column
set ignorecase smartcase

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                  Appearance                            {{{1 "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

syntax enable
set t_Co=256 " 256 colors in terminal
set background=dark

" Use the first available colorscheme in this list
for scheme in [ 'solarized', 'gruvbox', 'desert' ]
  try
    execute 'colorscheme '.scheme
    break
  catch
    continue
  endtry
endfor

let &colorcolumn=join(range(80,999),",")

" set cursorline
" hi CursorLine ctermbg=black guibg=black
" au WinEnter * :set cursorline
" au WinLeave * :set nocursorline

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                  Formatting                            {{{1 "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

filetype plugin indent on
set shiftwidth=2 tabstop=2 softtabstop=2 expandtab autoindent
autocmd filetype c,asm,python setlocal shiftwidth=4 tabstop=4 softtabstop=4
autocmd filetype make setlocal noexpandtab

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                Plugin Helpers                          {{{1 "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Airline
set laststatus=2
let g:airline_powerline_fonts=1
let g:airline_left_sep=''
let g:airline_right_sep=''

" Tagbar
nmap <F8> :TagbarToggle<CR>

" NERDTree
nmap <F7> :NERDTreeToggle<CR>

" UltiSnipets
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsExpandTrigger="<C-j>"
let g:UltiSnipsJumpForwardTrigger="<C-j>"
let g:UltiSnipsJumpBackwardTrigger="<C-k>"
let g:UltiSnipsListSnippets="<C-l>"
let g:UltiSnipsSnippetsDir="~/.vim/plugged/vim-custom-snippets/UltiSnips"

" YouCompleteMe
let g:ycm_collect_identifiers_from_tags_files = 1 " Let YCM read tags from Ctags file
let g:ycm_use_ultisnips_completer = 1 " Default 1, just ensure
let g:ycm_seed_identifiers_with_syntax = 1 " Completion for programming language's keyword
let g:ycm_complete_in_comments = 1 " Completion in comments
let g:ycm_complete_in_strings = 1 " Completion in string
let g:ycm_add_preview_to_completeopt = 1
let g:ycm_autoclose_preview_window_after_completion = 1

" EasyMotion (just to load the plugin)
nmap <Leader><Leader>w <Plug>(easymotion-w)
nmap <Leader><Leader>s <Plug>(easymotion-s)

" restore_view
set viewoptions=cursor,folds,slash,unix

" Syntastic
" let g:pymode_lint_write = 0 " :h syntastic-pymode
let g:syntastic_mode_map = {
    \ "mode": "active",
    \ "passive_filetypes": ["python"] } " redundant because of python mode

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                   Mappings                             {{{1 "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Simplify shortcut for changing window
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
" Change <C-p> and <C-n> behave to filter the history
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>
" Expands %% to the current file path
cnoremap <expr> %%  getcmdtype() == ':' ? expand('%:h').'/' : '%%'
" Change display and real lines mappings.
" nnoremap k gk
" nnoremap gk k
" nnoremap j gj
" nnoremap gj j

" Leader mappings
nnoremap <Leader>d "+d
nnoremap <Leader>P "+P
nnoremap <Leader>p "+p
nnoremap <Leader>y "+y
vnoremap <Leader>d "+d
vnoremap <Leader>P "+P
vnoremap <Leader>p "+p
vnoremap <Leader>y "+y
nnoremap <Leader>q :confirm q<CR>
nnoremap <Leader><S-q> :confirm qall<CR>
nnoremap <Leader>s :update<CR>
nnoremap <Leader><S-s> :wall<CR>
nnoremap <Leader>ev :tabedit $MYVIMRC<CR>
nnoremap <Leader>eb :tabedit ~/.bash_profile<CR>
nnoremap <Leader>ec :tabedit ~/Estudos/checkpoints.txt<CR>

" Tab mappings
function! CircularShift(pos, shift, first_pos, last_pos)
  let total_pos = a:last_pos - a:first_pos + 1
  let new_pos = (a:pos + a:shift) % total_pos
  if new_pos < a:first_pos
    let new_pos += total_pos
  endif
  return new_pos
endfunction

" Go to tabs
nnoremap <silent> [<Tab> :<C-U>exe "tabnext"
      \ CircularShift(tabpagenr(), -v:count1, 1, tabpagenr('$'))<CR>
nnoremap <silent> ]<Tab> :<C-U>exe "tabnext"
      \ CircularShift(tabpagenr(), v:count1, 1, tabpagenr('$'))<CR>
nnoremap <silent> [<S-tab> :tabfirst<CR>
nnoremap <silent> ]<S-tab> :tablast<CR>
nnoremap 1<Tab> 1gt
nnoremap 2<Tab> 2gt
nnoremap 3<Tab> 3gt
nnoremap 4<Tab> 4gt
nnoremap 5<Tab> 5gt
nnoremap 6<Tab> 6gt
nnoremap 7<Tab> 7gt
nnoremap 8<Tab> 8gt
nnoremap 9<Tab> 9gt
" Tab moves
nnoremap <silent> <<Tab> :<C-U>exe "tabm -".v:count1<CR>
nnoremap <silent> ><Tab> :<C-U>exe "tabm +".v:count1<CR>
nnoremap <silent> <<S-Tab> :tabm 0<CR>
nnoremap <silent> ><S-Tab> :tabm<CR>
" (C)reate (n)ew
nnoremap <silent> <C-n> :tabnew<CR>
" (d)elete <tab>
nnoremap <silent> d<Tab> :tabclose<CR>
" (t)his <tab> only
nnoremap <silent> t<Tab> :tabonly<CR>

" Make Y behave like other capitals
nnoremap Y y$
" qq to record, Q to replay
nmap Q @q

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
