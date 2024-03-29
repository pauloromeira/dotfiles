" .vimrc of Paulo Romeira {pauloromeira.com}                              {{{1
" vim: set foldmethod=marker:
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set nocompatible " Use Vim settings, rather than Vi settings.
set encoding=utf-8
filetype off
let mapleader = "\<Space>"
let g:mapleader = "\<Space>"
let s:vimhome = $HOME."/.vim"
let s:tempdir = s:vimhome."/temp"
let s:plugdir = s:vimhome."/plugged"
let g:localdir = s:vimhome."/local"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                   Plugins                              {{{1 "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

call plug#begin(s:plugdir)
  Plug 'bling/vim-airline' | Plug 'vim-airline/vim-airline-themes' " Status tabline

  Plug 'mhinz/vim-startify' " A fancy start screen for Vim (also session manager)
  Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }
  Plug 'powerline/fonts', { 'do': './install.sh' }
  Plug 'majutsushi/tagbar'
  Plug 'scrooloose/nerdtree' " , { 'on':  ['NERDTreeToggle', 'NERDTreeFind'] }
  Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
  Plug 'tpope/vim-fugitive' " Gateway to git
  Plug 'tpope/vim-repeat' | Plug 'vim-scripts/visualrepeat' " Visual mode repetition
  Plug 'tpope/vim-commentary', { 'on': '<Plug>Commentary' }
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-unimpaired'
  Plug 'tpope/vim-rsi' " Readline style insertion
  Plug 'vim-scripts/IndexedSearch'
  Plug 'michaeljsmith/vim-indent-object' " ii / ai
  Plug 'tommcdo/vim-exchange', { 'on': ['<Plug>(Exchange)', '<Plug>(ExchangeLine)'] } " Easy text exchange
  Plug 'bling/vim-bufferline' " Show the list of buffers in the command bar
  Plug 'mbbill/undotree', { 'on': 'UndotreeToggle' }
  Plug 'osyo-manga/vim-hopping', { 'on': '<Plug>(hopping-start)' } " Search and replace
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all --no-update-rc' } | Plug 'junegunn/fzf.vim'
  Plug 'airblade/vim-rooter', { 'on': '<Plug>RooterChangeToRootDirectory' }
  Plug 'junegunn/vim-easy-align', { 'on': ['<Plug>(EasyAlign)', 'EasyAlign'] } " Align text
  Plug 'kshenoy/vim-signature' " Place, toggle and display marks
  " " TODO (romeira): Lazy load {16/11/15 14:39}
  " Plug 'AndrewRadev/splitjoin.vim' " Switch between single-line and a multi-line statement
  " TODO (romeira): Lazy load {25/12/15 14:08}
  Plug 'kana/vim-textobj-user' | Plug 'kana/vim-textobj-lastpat' " Text object for search matches (i/)
  " TODO (romeira): Lazy load {08/01/16 16:35}
  Plug 'tpope/vim-jdaddy' " mapping for working with JSON
  Plug 'junegunn/goyo.vim', { 'on': 'Goyo' } " Distraction-free writing
  Plug 'mattn/gist-vim' | Plug 'mattn/webapi-vim' " vimscript for gist
  " Plug 'gregsexton/gitv', {'on': 'Gitv'}
  Plug 'junegunn/gv.vim' " A git commit browser
  Plug 'nelstrom/vim-visual-star-search' " use * to search current visual selection (vim-evanesco does that too)
  Plug 'romainl/vim-cool' " Disables search highlighting when you are done (simpler than vim-evanesco)
  Plug 'vimwiki/vimwiki' ", { 'for': 'vimwiki' }  Notes
  Plug 'ludovicchabant/vim-gutentags' " A Vim plugin that manages your tag files
  Plug 'metakirby5/codi.vim', {'on': 'Codi'} " The interactive scratchpad for hackers.
  Plug 'Asheq/close-buffers.vim' " Ads functionalities like close hiden buffers
  Plug 'mhinz/vim-signify' " Shows VCS (not only git) diff in the sign column
  Plug 'Vimjas/vim-python-pep8-indent'

  " Experimenting
  " Plug 'janko-m/vim-test' | Plug 'tpope/vim-dispatch'

  " Locals
  Plug g:localdir.'/vim-tomorrow-theme'
  Plug g:localdir.'/vim-custom-snippets'
  Plug g:localdir.'/restore_view.vim'
  " Plug g:localdir.'/vim-startmode'

  " Colorschemes
  " Plug 'chriskempson/base16-vim' " Tomorrow-theme
  " Plug 'jonathanfilip/vim-lucius'
  " Plug 'morhetz/gruvbox'
  " Plug 'kristijanhusak/vim-hybrid-material'
  " Plug 'altercation/vim-colors-solarized'
  " Plug 'w0ng/vim-hybrid'
  " Plug 'nanotech/jellybeans.vim'
  " Plug 'tomasr/molokai'
  " Plug 'dracula/vim', { 'as': 'dracula' }
  " Plug 'arcticicestudio/nord-vim'

  " Fun
  " Plug 'natw/keyboard_cat.vim', { 'on': 'PlayMeOff' } " Pretend you can type fast
  " Plug 'junegunn/limelight.vim', { 'on': 'Limelight' } " Focus tool

  " To Test "
  " Plug 'othree/html5.vim'
  " Plug 'pangloss/vim-javascript'
  " Plug 'tpope/vim-obsession' " Save editing session
  " Plug 'vim-scripts/sessionman.vim' " Save editing session
  " Plug 'xolox/vim-misc' | Plug 'xolox/vim-session' " Save editing session
  " Alternative to YouCompleteMe + UltiSnipets:
  " Plug 'Shougo/neocomplete'
  " Plug 'Shougo/neosnippet'
  " Plug 'Shougo/neosnippet-snippets'
  " Plug 'davidhalter/jedi-vim' " Autocompletion for python. Obs: unset pymode autocompletion: let g:pymode_rope = 0
  " Plug 'christoomey/vim-tmux-navigator' " Navitate freely between tmux and vim
  " Plug 'benmills/vimux' " Vim plugin to interact with tmux
  " Plug 'vim-scripts/SmartCase'
  " Plug 'vim-scripts/gitignore'
  " Plug 'Shougo/unite.vim'
  " Plug 'editorconfig/editorconfig-vim'
  " Plug 'Rykka/riv.vim' " Take Notes in rst
  " Plug 'Rykka/InstantRst' " Preview markdown files
  " Plug 'AndrewRadev/switch.vim'
  " Plug 'vim-scripts/ReplaceWithRegister'
  " Plug 'christoomey/vim-titlecase'
  " Plug 'tpope/vim-vinegar' " http://vimcasts.org/blog/2013/01/oil-and-vinegar-split-windows-and-project-drawer/
  " Plug 'w0rp/ale' " Asynchronous Lint Engine
  " Plug 'ambv/black'

  " Deactivated but still cool "
  " Plug 'osyo-manga/vim-over' " Preview in the command line
  " Plug 'terryma/vim-multiple-cursors' " is it working properly?
  " Plug 'nathanaelkane/vim-indent-guides' " Visually displays indent levels
  " Plug 'tmhedberg/SimpylFold' " Python folding (depend upon restore_view)
  " Plug 'jeetsukumaran/vim-indentwise' " Indent motions
  " Plug 'flazz/vim-colorschemes'
  " Plug 'rking/ag.vim' " alternative to ack.vim
  " Plug 'godlygeek/tabular' " Align text (using junegunn/vim-easy-align)
  " Plug 'justinmk/vim-gtfo' " Go to Terminal or File manager (gof, got)
  " Plug 'dhruvasagar/vim-table-mode' " Create neat tables as you type
  " Plug 'easymotion/vim-easymotion' , { 'on': '<Plug>(easymotion-s)' }
  " Plug 'kien/ctrlp.vim', { 'on': 'CtrlP' }
  " Plug 'klen/python-mode', { 'for': 'python' }
  " Plug 'mileszs/ack.vim'
  " Plug 'pgdouyon/vim-evanesco' " Disables search highlighting when you are done + visual star search
  " Plug 'junegunn/vim-peekaboo'  Extends " and @ in normal mode and <CTRL-R> in insert mode so you can see the contents of the registers. - sometomes annoying
  " Plug 'sjl/vitality.vim' " Restores FocusLost and FocusGained autocommands (tmux)
  " Plug 'scrooloose/syntastic'
  " Plug 'suan/vim-instant-markdown', { 'do': 'npm -g install instant-markdown-d', 'for': 'markdown' } " Preview markdown files
  " Plug 'mattn/emmet-vim' " provides support for expanding html abbreviations
  " Plug 'itchyny/lightline.vim' " Light status tabline
  " Plug 'airblade/vim-gitgutter' " Shows a git diff in the 'gutter' (sign column)
  " Plug 'vim-python/python-syntax' " Python syntax highlighting for Vim
  " Plug 'tpope/vim-eunuch' " Vim sugar for the UNIX shell commands that need it the most

call plug#end()

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
set hlsearch
set incsearch
" Autocmd settings
if has('autocmd')
  au InsertEnter * :set norelativenumber
  au InsertLeave * :set relativenumber
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
  set undoreload=10000 " maximum number lines to save for undo
endif

set nostartofline " Keep the cursor on the same column
set ignorecase smartcase
set virtualedit=block " Allow cursor to be anywhere in Visual block mode.
set autoread " Reload a file when changed outside Vim
set ttyfast " Faster redrawing
set completeopt=menuone " prevent YouCompleteMe to open preview

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                  Appearance                            {{{1 "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

syntax enable
set t_Co=256 " 256 colors in terminal
" set background=dark
set shortmess=I " Don’t show the intro message when starting Vim

" Use the first available colorscheme in this list
for scheme in [
      \ 'Tomorrow',
      \ 'Tomorrow-Night',
      \ 'lucius',
      \ 'nord',
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
" set colorcolumn=80

set cursorline
if has('autocmd')
  au WinEnter * :set cursorline
  au WinLeave * :set nocursorline
endif
" hi CursorLine ctermbg=black guibg=black
" Invisible characters
set nolist
set listchars=tab:▸\ ,eol:¬,trail:⋅,extends:❯,precedes:❮
" set showbreak=…
" let &showbreak="↪\ "
set noshowmode " Don't output mode
set title " Set terminal title

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
set smartindent

" set textwidth=79 " Wrap at 79 characters
" autocmd filetype c,asm,python setlocal shiftwidth=4 tabstop=4 softtabstop=4
" autocmd filetype make setlocal noexpandtab

" File Types
autocmd FileType javascript setlocal shiftwidth=4 tabstop=4 softtabstop=4

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
" let g:airline#extensions#tabline#enabled = 1
" let g:airline#extensions#tabline#show_buffers = 0
" let g:airline#extensions#tabline#tab_nr_type = 2 " splits and tab number
" let g:airline#extensions#tabline#show_tab_type = 0
" let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
" let g:airline#extensions#tabline#tab_min_count = 2
" let g:airline#extensions#tabline#show_close_button = 0
" let g:airline#extensions#tabline#left_sep = ''
" let g:airline#extensions#tabline#left_alt_sep = ''
" let g:airline#extensions#tabline#right_sep = ''
" let g:airline#extensions#tabline#right_alt_sep = ''

" Tagbar
nmap <silent> <Leader>tt :TagbarToggle<CR>

" NERDTree
nmap <silent> <Leader>nt :NERDTreeToggle<CR>
nmap <silent> <Leader>nf :NERDTreeFocus<CR>
nmap <silent> <Leader>nF :NERDTreeFind<CR>
let g:NERDTreeIgnore = ['\.pyc$']

" Undotree
" Native 'U' is a weird command
nmap <silent> U :UndotreeToggle<CR>
" Follows the 'toggle' convention
nmap <silent> <Leader>ut :UndotreeToggle<CR>
let g:undotree_WindowLayout = 4
let g:undotree_SetFocusWhenToggle = 1

" UltiSnipets
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsExpandTrigger="<C-j>"
let g:UltiSnipsJumpForwardTrigger="<C-j>"
let g:UltiSnipsJumpBackwardTrigger="<C-k>"
let g:UltiSnipsListSnippets="<C-l>"
let g:UltiSnipsSnippetsDir=g:localdir."/vim-custom-snippets/UltiSnips"

" YouCompleteMe
let g:ycm_collect_identifiers_from_tags_files = 1 " Let YCM read tags from Ctags file
let g:ycm_use_ultisnips_completer = 1 " Default 1, just ensure
let g:ycm_seed_identifiers_with_syntax = 1 " Completion for programming language's keyword
let g:ycm_complete_in_comments = 1 " Completion in comments
let g:ycm_complete_in_strings = 1 " Completion in string
let g:ycm_auto_hover = '' " Disable documentation popup
" let g:ycm_add_preview_to_completeopt = 1
" let g:ycm_autoclose_preview_window_after_completion = 1
" let g:ycm_autoclose_preview_window_after_insertion = 1
" let g:ycm_python_binary_path = 'python3' " relative search - to work with pyenv
" let g:ycm_python_binary_path = $HOME.'.pyenv/shims/python' " to work with pyenv
let g:ycm_semantic_triggers =  {
      \   'python' : ['.', 'from ', 'import '],  
      \ } " match python identifiers


" restore_view
set viewoptions=cursor,folds,slash,unix

" Syntastic
let g:syntastic_check_on_wq = 0
" let g:syntastic_mode_map = {
"       \ "mode": "active",
"       \ "passive_filetypes": ["python"] } " if python mode


" bufferline
let g:bufferline_echo = 0 " Do not echo to the command bar
let g:bufferline_active_buffer_left = ''
let g:bufferline_active_buffer_right = ''
let g:bufferline_rotate = 1
let g:bufferline_fixed_index = -1 " always second

" vim-hopping
nmap <Space>/ <Plug>(hopping-start)
let g:hopping#keymapping = {
      \ "\<C-n>" : "<Over>(hopping-next)",
      \ "\<C-p>" : "<Over>(hopping-prev)",
      \ "\<C-u>" : "<Over>(scroll-u)",
      \ "\<C-d>" : "<Over>(scroll-d)"
      \ }

" vim-rooter
let g:rooter_manual_only = 1
let g:rooter_disable_map = 1
nmap <silent> <Leader>cd <Plug>RooterChangeToRootDirectory

" vim-easy-align
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" vim-commentary (just to lazy load the plugin)
map gc <Plug>Commentary
nmap gcc <Plug>CommentaryLine
autocmd FileType markdown setlocal commentstring=[comment]:\ #\ (%s)
autocmd FileType markdown setlocal comments=s:[comment]:\ #\ (,m:\ ,e:)
autocmd FileType csv setlocal commentstring=#%s

" vim-exchange (just to lazy load the plugin)
nmap cx <Plug>(Exchange)
nmap cxx <Plug>(ExchangeLine)
xmap X <Plug>(Exchange)

" matchit.vim
runtime macros/matchit.vim " (native)

" vim-startify
set viminfo='100,n$HOME/.vim/files/info/viminfo
let g:startify_session_dir = s:tempdir.'/session'
" TODO (romeira): change ~ to $HOME {07/12/15 00:22}
" TODO [romeira]: create system-specific vimrc {21/04/17 21:08}
let g:startify_bookmarks = [ 
      \ {'v': '~/.vimrc'}, 
      \ {'p': '~/.dotfiles/bash/.bashrc'},
      \ {'g': '~/.gitconfig'},
      \ {'t': '~/.tmux.conf'},
      \ {'d': 'diary' },
      \ ]
let g:startify_files_number = 7
let g:startify_relative_path = 1
let g:startify_session_delete_buffers = 1
autocmd User Startified setlocal cursorline
autocmd User Startified setlocal buftype= " Reuses startify window
let g:startify_list_order = [
      \ ['   Last files:'],
      \ 'files',
      \ ['   Last files in the current directory:'],
      \ 'dir',
      \ ['   Sessions:'],
      \ 'sessions',
      \ ['   Bookmarks:'],
      \ 'bookmarks',
      \ ]
hi StartifyBracket ctermfg=240
hi StartifyFile    ctermfg=180
hi StartifyHeader  ctermfg=114
hi StartifyNumber  ctermfg=144
hi StartifyPath    ctermfg=245
hi StartifySlash   ctermfg=240
hi StartifySpecial ctermfg=240

let g:startify_custom_header = [
      \ '    ┌────┬─────────────┐ ',
      \ '    │ '.strftime("%d").' │   ╦  ╦╦╔╦╗  │ ',
      \ '    │ '.strftime("%b").'│   ╚╗╔╝║║║║  │ ',
      \ '    ├────┘    ╚╝ ╩╩ ╩╝ │ ',
      \ '    └─────────── '. v:version[0].'.'. v:version[2].' ──┘',
      \ '']

autocmd User Startified nnoremap <silent> <buffer> q :confirm q<CR>
autocmd User Startified nnoremap <silent> <buffer> d :VimwikiMakeDiaryNote<CR>
autocmd User Startified nnoremap <silent> <buffer> w :VimwikiIndex<CR>

" TO DO: single mapping to preview files based on extension
" vim-instant-markdown
let g:instant_markdown_autostart = 0

" signify
let g:signify_sign_change = '~'
let g:signify_vcs_list = [ 'git']

omap ic <plug>(signify-motion-inner-pending)
xmap ic <plug>(signify-motion-inner-visual)
omap ac <plug>(signify-motion-outer-pending)
xmap ac <plug>(signify-motion-outer-visual)

highlight SignifySignAdd             ctermfg=119
highlight SignifySignChange          ctermfg=214
highlight SignifySignDelete          ctermfg=167
highlight SignifySignChangeDelete    ctermfg=202


" ack.vim
if executable('ag')
  let g:ackprg = 'ag --vimgrep --silent'
endif

" vimwiki
" TODO (romeira): organize autocmds {07/12/15 01:22}
au BufNewFile,BufRead *.wiki setlocal ft=vimwiki

if empty($INTELIVIX)
  let g:vimwiki_list = [{ 'path': '~/vimwiki' }]
else
  let g:vimwiki_list = [{ 'path': $INTELIVIX . '/vimwiki' }]
endif

function! VimwikiLinkHandler(link)
  " Use Vim to open external files with the 'vfile:' scheme.  E.g.:
  "   1) [[vfile:~/Code/PythonProject/abc123.py]]
  "   2) [[vfile:./|Wiki Home]]
  let link = a:link
  if link =~# '^vfile:'
    let link = link[1:]
  else
    return 0
  endif
  let link_infos = vimwiki#base#resolve_link(link)
  if link_infos.filename == ''
    echomsg 'Vimwiki Error: Unable to resolve link!'
    return 0
  else
    exe 'tabnew ' . fnameescape(link_infos.filename)
    return 1
  endif
endfunction


" FZF
" Customize fzf colors to match color scheme
let $BAT_THEME='GitHub' " Tomorrow
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }


" Vim8 terminal: https://github.com/junegunn/fzf/issues/1860#issuecomment-584522269
let g:fzf_layout = { 'window': { 'width': 1, 'height': 0.4, 'yoffset': 1, 'border': 'horizontal' } }

" " Older vim versions
" let g:fzf_layout = { 'window': 'bot'.float2nr(&lines * 0.4).'new' }

" Gist
let g:gist_post_private = 1

" Gutentags
let g:gutentags_cache_dir = s:tempdir.'/tags/'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                           Functions and Commands                       {{{1 "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Userful for tab move mappings
function! CircularShift(pos, shift, first_pos, last_pos)
  let total_pos = a:last_pos - a:first_pos + 1
  let new_pos = (a:pos + a:shift) % total_pos
  if new_pos < a:first_pos
    let new_pos += total_pos
  endif
  return new_pos
endfunction

" Based on window movement shortcuts by 'nicknisi/dotfiles'
function! WinCreate(key)
  if (match(a:key,'[jk]'))
    wincmd v
  else
    wincmd s
  endif
  if (match(a:key,'[kh]'))
    exec "wincmd ".a:key
  endif
  Startify
endfunction

" TODO List
" Based on junegunn dotfile
function! s:todo() abort
  let entries = []
  for cmd in ['git grep -niI -e "todo.*romeira" 2> /dev/null',
            \ 'grep -rniI -e "todo.*romeira" 2> /dev/null']
    let lines = split(system(cmd), '\n')
    if v:shell_error != 0 | continue | endif
    for line in lines
      let [fname, lno, text] = matchlist(line, '^\([^:]*\):\([^:]*\):\(.*\)')[1:3]
      call add(entries, { 'filename': fname, 'lnum': lno, 'text': text })
    endfor
    break
  endfor
  if !empty(entries)
    call setqflist(entries)
    copen
  endif
endfunction
command! Todo call s:todo()

" fugitive
set diffopt+=vertical " Splits Gdiff vertically

" make test commands execute using dispatch.vim
let test#strategy = "dispatch"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                   Mappings                             {{{1 "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Simplify shortcut for creating windows
nnoremap <silent> c<C-h> :call WinCreate('h')<CR>
nnoremap <silent> c<C-j> :call WinCreate('j')<CR>
nnoremap <silent> c<C-k> :call WinCreate('k')<CR>
nnoremap <silent> c<C-l> :call WinCreate('l')<CR>
" Simplify shortcut for changing windows
nnoremap <silent> <C-h> <C-w>h
nnoremap <silent> <C-j> <C-w>j
nnoremap <silent> <C-k> <C-w>k
nnoremap <silent> <C-l> <C-w>l
" Change <C-p> and <C-n> behave to filter the history
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>
" Expand %% to the current file path
cnoremap <expr> %%  getcmdtype() == ':' ? expand('%:h').'/' : '%%'

" Leader mappings
nnoremap <Leader>d "+d
nnoremap <Leader>P "+P
nnoremap <Leader>p "+p
nnoremap <Leader>y "+y

" TODO [romeira]: remap: (c)lipboard + (...) {06/11/17 03:13}
" problema: visual remappings
" nnoremap cd "+d
" nnoremap cD "+D
" nnoremap cp "+p
" nnoremap cP "+P
" nnoremap cy "+y

vnoremap <Leader>d "+d
vnoremap <Leader>P "+P
vnoremap <Leader>p "+p
vnoremap <Leader>y "+y

nnoremap <silent> <Leader>q :confirm q<CR>
nnoremap <silent> <Leader><S-q> :confirm qall<CR>
nnoremap <Leader>s :update<CR>
nnoremap <Leader><S-s> :wall<CR>
nnoremap <Leader>l :set list!<CR>
" Run mappings
nnoremap <Leader>rv :source $MYVIMRC<CR>
nnoremap <Leader>rr :source %<CR>

" Go to tabs
nnoremap <silent> [<Tab> :exe "tabnext"
      \ CircularShift(tabpagenr(), -v:count1, 1, tabpagenr('$'))<CR>
nnoremap <silent> ]<Tab> :exe "tabnext"
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
nnoremap <silent> <<Tab> :exe "tabm -".v:count1<CR>
nnoremap <silent> ><Tab> :exe "tabm +".v:count1<CR>
nnoremap <silent> <<S-Tab> :tabm 0<CR>
nnoremap <silent> ><S-Tab> :tabm<CR>
nnoremap <silent> c<Tab> :tabnew \| Startify<CR>
nnoremap <silent> c<S-Tab> :-tabnew \| Startify<CR>
nnoremap <silent> d<Tab> :tabclose<CR>
nnoremap <silent> t<Tab> :tabonly<CR>

" Make Y behave like other capitals
nnoremap Y y$
" qq to record, Q to replay
nnoremap Q @q

" Resize windows with arrowkeys
" nnoremap <Up> <C-w>5+
" nnoremap <Down> <C-w>5-
" nnoremap <Left> <C-w>5<
" nnoremap <Right> <C-w>5>
" nnoremap <S-Up> <C-w>+
" nnoremap <S-Down> <C-w>-
" nnoremap <S-Left> <C-w><
" nnoremap <S-Right> <C-w>>

" Scroll the viewport faster
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>

" Clear highlighting with <Esc>
" nnoremap <silent> <Esc> :<C-u>noh<CR><Esc>
" nnoremap <silent> <C-l> :<C-u>noh<CR><C-l>
" nnoremap <Esc>^[ <Esc>^[

" FZF
nnoremap <silent> <expr> <Leader><Leader>
      \ (expand('%') =~ 'NERD_tree' ? "\<c-w>\<c-w>" : '').":Files\<cr>"

nnoremap <silent> <Leader><Enter>  :Buffers<CR>
nnoremap <silent> <Leader>`        :Marks<CR>

" TODO [romeira]: mapear ctrl+p/ctrl+n para scroll do preview {03/05/17 10:06}
command! -bang -nargs=? -complete=dir Files
  \ call fzf#vim#files(<q-args>,
  \                    fzf#vim#with_preview('right:50%:hidden', '?'),
  \                    <bang>0)

command! -bang -nargs=* Ag
  \ call fzf#vim#ag(<q-args>,
  \                 <bang>0 ? fzf#vim#with_preview('up:60%')
  \                         : fzf#vim#with_preview('right:50%:hidden', '?'),
  \                 <bang>0)


" Vim-test
nmap <silent> t<C-n> :TestNearest<CR> " t Ctrl+n
nmap <silent> t<C-f> :TestFile<CR>    " t Ctrl+f
nmap <silent> t<C-s> :TestSuite<CR>   " t Ctrl+s
nmap <silent> t<C-l> :TestLast<CR>    " t Ctrl+l
nmap <silent> t<C-g> :TestVisit<CR>   " t Ctrl+g

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
