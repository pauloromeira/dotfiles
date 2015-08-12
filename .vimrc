" .vimrc of Paulo Romeira                                                 {{{1
" vim: set foldmethod=marker:
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set nocompatible " Use Vim settings, rather than Vi settings.
filetype off
let mapleader = "\<Space>"
let s:vimhome = $HOME."/.vim"
let s:tempdir = s:vimhome."/temp"
let s:plugdir = s:vimhome."/plugged"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                   Plugins                              {{{1 "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let s:firstrun = 0
let s:plugfile = s:vimhome."/autoload/plug.vim"
if !filereadable(s:plugfile)
  let s:firstrun = 1
  " Make directories
  silent execute "!mkdir -p ".
        \ s:vimhome."/autoload ".
        \ s:tempdir."/{undo,backup,swap,view}"
  " Download Vim-plug
  let s:plugurl =
        \ "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
  silent execute
        \ "!curl -fLo ".s:plugfile." ".s:plugurl.
        \ " || wget -O ".s:plugfile." ".s:plugurl
endif

call plug#begin(s:plugdir)

Plug 'powerline/fonts', { 'do': './install.sh' }
      \ | Plug 'bling/vim-airline' " Status tabline
Plug 'pauloromeira/tabline.vim'
Plug 'majutsushi/tagbar'
Plug 'scrooloose/nerdtree', { 'on':  ['NERDTreeToggle', 'NERDTreeFind'] }
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
      \ | Plug 'pauloromeira/vim-custom-snippets'
Plug 'scrooloose/syntastic'
Plug 'easymotion/vim-easymotion', { 'on': ['<Plug>(easymotion-w)',
      \ '<Plug>(easymotion-b)', '<Plug>(easymotion-s)'] }
Plug 'kien/ctrlp.vim', { 'on': 'CtrlP' }
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive' " Gateway to git
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-rsi'
Plug 'vim-scripts/IndexedSearch'
Plug 'michaeljsmith/vim-indent-object' " ii / ai
Plug 'natw/keyboard_cat.vim', { 'on': 'PlayMeOff' } " Pretend you can type fast
Plug 'pauloromeira/restore_view.vim'
Plug 'klen/python-mode', { 'for': 'python' }
Plug 'tommcdo/vim-exchange' " Easy text exchange operator for Vim
Plug 'bling/vim-bufferline' " Show the list of buffers in the command bar
Plug 'airblade/vim-gitgutter' " Shows a git diff in the 'gutter' (sign column)
Plug 'mbbill/undotree', { 'on': 'UndotreeToggle' }
Plug 'osyo-manga/vim-hopping', { 'on': '<Plug>(hopping-start)' } " Search and replace
Plug 'rking/ag.vim' " faster than ack
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': 'yes \| ./install' }
Plug 'airblade/vim-rooter', { 'on': '<Plug>RooterChangeToRootDirectory' }
Plug 'junegunn/vim-easy-align', { 'on': '<Plug>(EasyAlign)' } " Align text

" Colorschemes
Plug 'morhetz/gruvbox'
" Plug 'w0ng/vim-hybrid'
" Plug 'altercation/vim-colors-solarized'
" Plug 'nanotech/jellybeans.vim'
" Plug 'tomasr/molokai'

if !has('gui_running')
  function! BuildYCM(info)
    " info is a dictionary with 3 fields
    " - name:   name of the plugin
    " - status: 'installed', 'updated', or 'unchanged'
    " - force:  set on PlugInstall! or PlugUpdate!
    if a:info.status == 'installed' || a:info.force
      !./install.sh
    endif
  endfunction
  Plug 'Valloric/YouCompleteMe', { 'do': function('BuildYCM') }
endif


" To Test "
" Plug 'tpope/vim-obsession' " Save editing session
" Plug 'vim-scripts/sessionman.vim' " Save editing session
" Plug 'xolox/vim-misc' | Plug 'xolox/vim-session' " Save editing session
" Plug 'kana/vim-textobj-user' " Create your own text objects without pain
" Alternative to YouCompleteMe + UltiSnipets:
" Plug 'Shougo/neocomplete'
" Plug 'Shougo/neosnippet'
" Plug 'Shougo/neosnippet-snippets'
" Plug 'davidhalter/jedi-vim' " Autocompletion for python. Obs: unset pymode autocompletion: let g:pymode_rope = 0
" Plug 'Shougo/unite.vim'
" runtime macros/matchit.vim " (nativo)
" Plug 'christoomey/vim-tmux-navigator' " Navitate freely between tmux and vim
" Plug 'vim-scripts/SmartCase'
" Plug 'vim-scripts/gitignore'


" Deactivated but still cool "
" Plug 'tmhedberg/SimpylFold' " Python folding (depend upon restore_view)
" Plug 'jeetsukumaran/vim-indentwise' " Indent motions
" Plug 'flazz/vim-colorschemes'
" Plug 'mhinz/vim-signify' " Shows VCS (not only git) diff in the sign column
" Plug 'mileszs/ack.vim' " replaced by ag.vim
" Plug 'osyo-manga/vim-over' " Preview in the command line
" Plug 'terryma/vim-multiple-cursors' " is it working properly?
" Plug 'nathanaelkane/vim-indent-guides' " Visually displays indent levels
" Plug 'vim-scripts/ZoomWin' " Zoom into and out of a window (BUG)
" Plug 'godlygeek/tabular' " Align text (using junegunn/vim-easy-align)


call plug#end()
if s:firstrun == 1
  :PlugInstall
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                 Vim Behavior                           {{{1 "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set backspace=indent,eol,start " Sane backspacing in insert mode
set nrformats= " Treat numbers with leading zeros as decimals instead of octals
set history=2000
set hidden " Allow buffer switching without saving
set number relativenumber
set showcmd
set scrolloff=3 " Scroll so we can always see 3 lines around the cursor
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

" Centralize views, swapfiles, backups and undo history
let &viewdir = s:tempdir.'/view//'
let &directory = s:tempdir.'/swap//'
let &backupdir = s:tempdir.'/backup//'
set backup
if has("persistent_undo")
  let &undodir = s:tempdir.'/undo//'
  set undofile
  set undolevels=1000 " maximum number of changes that can be undone
  set undoreload=10000 " maximum number lines to save for undo on a buffer reload
endif

set nostartofline " Keep the cursor on the same column
set ignorecase smartcase

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                  Appearance                            {{{1 "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

syntax enable
set t_Co=256 " 256 colors in terminal
set background=dark
set shortmess=I " Don’t show the intro message when starting Vim

" Use the first available colorscheme in this list
for scheme in [
      \ 'gruvbox',
      \ 'solarized',
      \ 'hybrid',
      \ 'jellybeans',
      \ 'molokai',
      \'desert'
      \ ]
  try
    execute 'colorscheme '.scheme
    break
  catch
    continue
  endtry
endfor

let &colorcolumn=join(range(80,999),",")

set cursorline
if has('autocmd')
  au WinEnter * :set cursorline
  au WinLeave * :set nocursorline
endif
" hi CursorLine ctermbg=black guibg=black

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                  Formatting                            {{{1 "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

filetype plugin indent on
set shiftwidth=2
set tabstop=2
set softtabstop=2
set expandtab
set autoindent
set copyindent " copy the previous indentation on autoindenting

" set textwidth=79 " Wrap at 79 characters
" autocmd filetype c,asm,python setlocal shiftwidth=4 tabstop=4 softtabstop=4
" autocmd filetype make setlocal noexpandtab

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                Plugin Helpers                          {{{1 "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Airline
set laststatus=2
let g:airline_powerline_fonts=1
let g:airline_left_sep=''
let g:airline_right_sep=''
let g:airline_mode_map = {
    \ '__' : '-',
    \ 'n'  : 'N',
    \ 'i'  : 'I',
    \ 'R'  : 'R',
    \ 'c'  : 'C',
    \ 'v'  : 'V',
    \ 'V'  : 'V',
    \ '' : 'V',
    \ 's'  : 'S',
    \ 'S'  : 'S',
    \ '' : 'S',
    \ }

" Tagbar
nmap <silent> <F8> :TagbarToggle<CR>

" NERDTree
nmap <silent> <F7> :NERDTreeToggle<CR>

" Undotree
nmap <silent> <F6> :UndotreeToggle<CR>
let g:undotree_WindowLayout = 4

" UltiSnipets
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsExpandTrigger="<C-j>"
let g:UltiSnipsJumpForwardTrigger="<C-j>"
let g:UltiSnipsJumpBackwardTrigger="<C-k>"
let g:UltiSnipsListSnippets="<C-l>"
let g:UltiSnipsSnippetsDir=s:plugdir."/vim-custom-snippets/UltiSnips"

" YouCompleteMe
let g:ycm_collect_identifiers_from_tags_files = 1 " Let YCM read tags from Ctags file
let g:ycm_use_ultisnips_completer = 1 " Default 1, just ensure
let g:ycm_seed_identifiers_with_syntax = 1 " Completion for programming language's keyword
let g:ycm_complete_in_comments = 1 " Completion in comments
let g:ycm_complete_in_strings = 1 " Completion in string
let g:ycm_add_preview_to_completeopt = 1
let g:ycm_autoclose_preview_window_after_completion = 1

" EasyMotion (just to lazy load the plugin)
nmap <Leader><Leader>w <Plug>(easymotion-w)
nmap <Leader><Leader>b <Plug>(easymotion-b)
nmap <Leader><Leader>s <Plug>(easymotion-s)

" restore_view
set viewoptions=cursor,folds,slash,unix

" Syntastic
" let g:pymode_lint_write = 0 " :h syntastic-pymode
let g:syntastic_mode_map = {
      \ "mode": "active",
      \ "passive_filetypes": ["python"] } " redundant because of python mode

" bufferline
let g:bufferline_echo = 0 " Do not echo to the command bar
let g:bufferline_active_buffer_left = ''
let g:bufferline_active_buffer_right = ''

" vim-hopping
nmap <Space>/ <Plug>(hopping-start)
let g:hopping#keymapping = {
      \ "\<C-n>" : "<Over>(hopping-next)",
      \ "\<C-p>" : "<Over>(hopping-prev)",
      \ "\<C-u>" : "<Over>(scroll-u)",
      \ "\<C-d>" : "<Over>(scroll-d)"
      \ }

" CtrlP (just to lazy load the plugin)
nmap <silent> <C-p> :CtrlP<CR>

" vim-rooter
let g:rooter_manual_only = 1
let g:rooter_disable_map = 1
nmap <silent> <Leader>cd <Plug>RooterChangeToRootDirectory

" vim-easy-align
" Start interactive EasyAlign in visual mode (e.g. vip<Enter>)
vmap <Enter> <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

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
" Expand %% to the current file path
cnoremap <expr> %%  getcmdtype() == ':' ? expand('%:h').'/' : '%%'
" Invert display lines and real lines mappings.
nnoremap k gk
nnoremap gk k
nnoremap j gj
nnoremap gj j
nnoremap 0 g0
nnoremap g0 0
nnoremap $ g$
nnoremap g$ $
nnoremap ^ g^
nnoremap g^ ^

" Leader mappings
nnoremap <Leader>d "+d
nnoremap <Leader>P "+P
nnoremap <Leader>p "+p
nnoremap <Leader>y "+y
vnoremap <Leader>d "+d
vnoremap <Leader>P "+P
vnoremap <Leader>p "+p
vnoremap <Leader>y "+y

nnoremap <silent> <Leader>q :confirm q<CR>
nnoremap <silent> <Leader><S-q> :confirm qall<CR>
nnoremap <Leader>s :update<CR>
nnoremap <Leader><S-s> :wall<CR>
nnoremap <Leader>ev :tabedit $MYVIMRC<CR>
nnoremap <Leader>eb :tabedit ~/.bash_profile<CR>
nnoremap <Leader>ec :tabedit ~/Estudos/checkpoints.txt<CR>
nnoremap <Leader>en :tabedit ~/notes.txt<CR>

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
" Tab operations
nnoremap <silent> <<Tab> :<C-U>exe "tabm -".v:count1<CR>
nnoremap <silent> ><Tab> :<C-U>exe "tabm +".v:count1<CR>
nnoremap <silent> <<S-Tab> :tabm 0<CR>
nnoremap <silent> ><S-Tab> :tabm<CR>
nnoremap <silent> y<Tab> :tabnew<CR>
nnoremap <silent> d<Tab> :tabclose<CR>
nnoremap <silent> t<Tab> :tabonly<CR>

" Make Y behave like other capitals
nnoremap Y y$
" qq to record, Q to replay
nmap Q @q

" Resize windows with arrowkeys
nnoremap <Up> <C-w>5+
nnoremap <Down> <C-w>5-
nnoremap <Left> <C-w>5<
nnoremap <Right> <C-w>5>
nnoremap <S-Up> <C-w>+
nnoremap <S-Down> <C-w>-
nnoremap <S-Left> <C-w><
nnoremap <S-Right> <C-w>>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
