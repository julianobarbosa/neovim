" Set VIM home
if has('win32')
    let g:VIM_HOME = expand('$HOME\AppData\Local\nvim\plugged')
    let g:python_host_prog=expand('$HOME\.virtualenvs\neovim3\Scripts\python')
    let g:python2_host_prog=expand('$HOME\.virtualenvs\neovim2\Scripts\python')
    let g:python3_host_prog=expand('$HOME\.virtualenvs\neovim3\Scripts\python')
else
    let g:VIM_HOME = expand('$HOME/.config/nvim/plugged')
    let g:python_host_prog=expand('$HOME/.pyenv/versions/neovim3/bin/python')
    let g:python2_host_prog=expand('$HOME/.pyenv/versions/neovim2/bin/python')
    let g:python3_host_prog=expand('$HOME/.pyenv/versions/neovim3/bin/python')
endif

" Plugin manager
call plug#begin(g:VIM_HOME)
    " Use NerdTree for file browsing
    Plug 'scrooloose/nerdtree'
    Plug 'Xuyuanp/nerdtree-git-plugin'
    let NERDTreeQuitOnOpen = 1
    let g:NERDTreeChDirMode=2
    let g:NERDTreeIgnore=['\.rbc$', '\~$', '\.pyc$', '\.db$', '\.sqlite$', '__pycache__']
    let g:NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$', '\.bak$', '\~$']
    let g:NERDTreeShowBookmarks=1
    let g:nerdtree_tabs_focus_on_files=1
    let g:NERDTreeMapOpenInTabSilent='<RightMouse>'
    let g:NERDTreeWinSize=50
    let g:NERDTreeDirArrowExpandable = '▸'
    let g:NERDTreeDirArrowCollapsible = '▾'

    " Use nerdcommenter for comment
    Plug 'scrooloose/nerdcommenter'

    " Move to and from Tmux panes and Vim panes
    Plug 'christoomey/vim-tmux-navigator'

    " Colors!
    Plug 'tomasr/molokai'

    " Show white space
    Plug 'ntpeters/vim-better-whitespace'

    " Auto close parens, braces, brackets, etc
   Plug 'jiangmiao/auto-pairs'

    " Indicator for what was yanked
    Plug 'machakann/vim-highlightedyank'

    " Show git stuff in gutter
    Plug 'airblade/vim-gitgutter'

    " Git integration glore
    Plug 'tpope/vim-fugitive'
    Plug 'tpope/vim-rhubarb'

    " Better than grepprg
    Plug 'mileszs/ack.vim'

    " Aligning stuff
    Plug 'junegunn/vim-easy-align'

    " Fuzzy finder
    Plug 'junegunn/fzf'

    " Autoformat
    Plug 'Chiel92/vim-autoformat'

    " Syntax For languages
    Plug 'keith/swift.vim'
    Plug 'fatih/vim-go'
    Plug 'cespare/vim-toml'
    Plug 'rust-lang/rust.vim'
    Plug 'uarun/vim-protobuf'
    Plug 'plasticboy/vim-markdown'
    Plug 'rust-lang/rust.vim'

    " python
    Plug 'davidhalter/jedi-vim'
    Plug 'raimon49/requirements.txt.vim', {'for': 'requirements'}
    Plug 'w0rp/ale'
    Plug 'plytophogy/vim-virtualenv'

    " Language Protocol Server and autocompelete
    Plug 'prabirshrestha/async.vim'
    Plug 'prabirshrestha/vim-lsp'
    Plug 'ncm2/ncm2'
    Plug 'ncm2/ncm2-bufword'
    Plug 'ncm2/ncm2-match-highlight'
    Plug 'ncm2/ncm2-path'
    Plug 'ncm2/ncm2-vim-lsp'
    Plug 'roxma/nvim-yarp'
    Plug 'ncm2/ncm2-jedi'

    " Wakatime
    Plug 'wakatime/vim-wakatime'

    " Icons
    Plug 'ryanoasis/vim-devicons'

    " Nice status bar
    Plug 'bling/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    let g:airline_powerline_fonts=0
    "" let g:airline_theme='powerlineish'
    let g:airline#extensions#tabline#enabled=1
    let g:airline#extensions#tabline#left_sep=' '
    let g:airline#extensions#tabline#left_alt_sep='|'
    let g:airline#extensions#virtualenv#enabled=1

call plug#end()

" Habit
let mapleader=','
let tabstop=4

filetype plugin on

"" Tabs
nnoremap <Tab> gt
nnoremap <S-Tab> gT
nnoremap <silent> <S-t> :tabnew<cr>

" edit vimrc/zshrc and load vimrc bindings
nnoremap <leader>ev :vsp $MYVIMRC<CR>
nnoremap <leader>ez :vsp ~/.zshrc<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>

" See help fo
set formatoptions=qrnj1

" List candidates in wildmenu after tabbing, complete longest common part in
" matched results. Tabbing again will trigger selection among the matches.
set wildmode=list:longest,full

" Display hidden characters
set list
set listchars=tab:▸\ ,eol:¬

" Highligth the line the cursor is on.
set cursorline

" Show the cursor position all the time.
set ruler

" allow backspacin over everything in insert mode
set backspace=indent,eol,start

" read/write file when switching buffers
set autowrite
set autoread

" line settings
set number
set relativenumber

" tab settings
set shiftwidth=4
set tabstop=4
set softtabstop=4
set expandtab
set smarttab

" accelerated scrolling
" set scrolljump=15

" Searching
nnoremap / /\v
vnoremap / /\v
set ignorecase
set smartcase

" better vertial movement for wrapped lines
nnoremap j gj
nnoremap k gk

" Put plugins and dictionaries in this dir (also on Windows)
if has('win32')
  let &runtimepath.=','.expand(g:VIM_HOME)
endif

" Keep undo history across sessions by storing it in a file
if has('persistent_undo')
    if has("win32")
        let myUndoDir=expand(g:VIM_HOME . '\undodir')
    else
        let myUndoDir=expand(g:VIM_HOME . '/undodir')
    endif

    " Create dirs
    call system('mkdir ' . g:VIM_HOME)
    call system('mkdir ' . myUndoDir)
    let &undodir=myUndoDir
    set undofile
endif

"******************************************************************************
"" Abbreviations
"******************************************************************************
"" no one is really happy until you have this shotcuts
inoremap <F1> <Esc>
inoremap <C-c> <Esc>
inoremap <C-c> :w<cr>
cnoreabbrev W! w!
cnoreabbrev Q! q!
cnoreabbrev Qall! qall!
cnoreabbrev Wq wq
cnoreabbrev Wa wa
cnoreabbrev WQ wq
cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev Qall qall

"******************************************************************************
"" TERMINAL Configuration
"******************************************************************************
nnoremap <silent> <leader>t :terminal<CR>

augroup vimrc-terminal
  autocmd!
  autocmd TermOpen * setl nocursorline | IndentLinesDisable
augroup END

"******************************************************************************
"" Copy/Paste/Cut
"******************************************************************************
if has('unnamedplus')
  set clipboard=unnamed,unnamedplus
endif

noremap YY "+y<cr>
noremap <leader>p "+gP<cr>
noremap XX "+x<cr>

if has('macunix')
  " pbcopy for OSX copy/paste
  vmap <C-x> :!pbcopy<cr>
  vmap <C-c> :w !pbcopy<cr><cr>
endif

"" Git
noremap <Leader>ga :Gwrite<CR>
noremap <Leader>gc :Gcommit<CR>
noremap <Leader>gsh :Gpush<CR>
noremap <Leader>gll :Gpull<CR>
noremap <Leader>gs :Gstatus<CR>
noremap <Leader>gb :Gblame<CR>
noremap <Leader>gd :Gvdiff<CR>
noremap <Leader>gr :Gremove<CR>

"" Buffer nav
noremap <leader>z :bp<cr>
noremap <leader>q :bp<cr>
noremap <leader>x :bn<cr>
noremap <leader>w :bn<cr>
nnoremap <silent> <leader>b :ls<cr>:b<space>

"" Close buffer
noremap <leader>c :bd<cr>

"" quickly cancel search highlighting
nnoremap <leader><space> :nohlsearch<cr>

"" Strip all trailing whitespace
nnoremap <leader>f :StripWhitespace<cr>

" Sort lines in alphabetical order
vnoremap <leader>s :'<,'>!sort -f<cr>

" Quickly insert a timestamp
nnoremap tt "=strftime("%F %T%z")<cr>p

"******************************************************************************
"" FZF Settings
"******************************************************************************
" nnoremap <silent> <leader>e :FZF -m<cr>

" ale
let g:ale_linters = {}

"******************************************************************************
"" Python configuration
"******************************************************************************
" vim-python
augroup vimrc-python
  autocmd!
  autocmd FileType python setlocal expandtab shiftwidth=4 tabstop=8 colorcolumn=79
      \ formatoptions+=croq softtabstop=4
      \ cinwords=if,elif,else,for,while,try,except,finally,def,class,with
augroup END

" jedi-vim
let g:jedi#popup_on_dot=0
let g:jedi#goto_assignments_command="<leader>g"
let g:jedi#goto_definitions_command="<leader>d"
let g:jedi#documentation_command="K"
let g:jedi#usages_command="<leader>n"
let g:jedi#rename_command="<leader>r"
let g:jedi#show_call_signatures="0"
let g:jedi#completions_command="<C-Space>"
let g:jedi#smart_auto_mappings=0
let g:jedi#force_py_version=3
let g:jedi#use_tabs_not_buffers=1

" ale
:call extend(g:ale_linters, {
    \'python': ['flake8'], })

"******************************************************************************
"" auto-pairs configuration
"******************************************************************************
let g:AutoPairsMultilineClose=0
let g:AutoPairsMapSpace=0

"******************************************************************************
"" Enable Windows clipboard copy/paste
"******************************************************************************
source $VIMRUNTIME/mswin.vim

"******************************************************************************
"" Windows Font
"******************************************************************************
"" set guifont=Menlo:13
"" set guifont=Ubuntu\ Mono\ derivative\ Powerline:14
"" set guifont=Go\ Mono\ for\ Powerline:12
"" set guifont=InconsolataForPowerline\ NF:h10
"" set guifont=Fira\ Mono\ for\ Powerline:h12
set guifont=Anonymous\ Pro\ for\ Powerline:h14

"******************************************************************************
"" Colors schema
"******************************************************************************
let g:molokai_original=1
colorscheme molokai

"******************************************************************************
"" fzf
"******************************************************************************
if executable('fzf')
    nnoremap <c-p> :fzf<cr>
endif

"******************************************************************************
"" [mileszs/ack.vim]
"******************************************************************************
if executable('ag')
  let g:ackprg='ag --vimgrep'
  nnoremap <leader>r :Ack!
endif

" Toggle quickfix windown
nnoremap <leader><leader> :call ToggleQuickfix()<cr>
function! ToggleQuickfix()
  for buffer in tabpagebuflist()
    if bufname(buffer) == ''
      " then it should be the quickfix window
      cclose
      return
    endif
  endfor

  copen
endfunction

"******************************************************************************
"" [Chiel92/vim-autoformat]
"******************************************************************************
noremap <F4> :Autoformat<cr>

"******************************************************************************
"" [scrooloose/nerdtree]
"******************************************************************************
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,*.db,*.sqlite
nnoremap <silent> <F2> :NERDTreeFind<cr>
nnoremap <silent> <F3> :NERDTreeToggle<cr>
nnoremap <silent> <C-n> :NERDTreeToggle<cr>
nnoremap <leader>o :NERDTreeToggle<cr>

" auto open or close NERDTree
autocmd vimenter * if !argc() | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

"******************************************************************************
"" NERDComment Settings
"******************************************************************************
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims=1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs=1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign='left'

" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java=1

" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters={
		\ 'c': { 'left': '/**','right': '*/' },
		\ 'py': { 'left': '#' },
		\ 'sshconfig': { 'left': '#' },
		\ 'sshdconfig': { 'left': '#' }
		\ }

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines=1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace=1
