" Plugin manager
 Specify a directory for plugins
call plug#begin(expand('~\AppData\Local\nvim\plugged'))
	" Use NerdTree for file browsing
	Plug 'scrooloose/nerdtree'
	let g:NERDTreeChDirMode = 2
	let g:NERDTreeIgnore = ['\.rbc$', '\~$', '\.pyc$', '\.db$', '\.sqlite$', '__pycache__']
	let g:NERDTreeSortOrder = ['^__\.py$', '\/$', '*', '\.swp$', '\.bak$', '\~$']
	let g:NERDTreeShowBookmarks = 1
	let g:nerdtree_tabs_focus_on_files = 1
	let g:NERDTreeMapOpenInTabSilent = '<RightMouse>'
	let g:NERDTreeWinSize = 50

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

	" python
	Plug 'davidhalter/jedi-vim'
	Plug 'raimon49/requirements.txt.vim', {'for': 'requirements'}
	Plug 'w0rp/ale'

	" Nice status bar
	Plug 'bling/vim-airline'
	Plug 'vim-airline/vim-airline-themes'
	let g:airline_powerline_fonts = 0
	"" let g:airline_theme = 'powerlineish'
	let g:airline#extensions#tabline#enabled = 1
	let g:airline#extensions#tabline#left_sep = ' '
	let g:airline#extensions#tabline#left_alt_sep = '|'
	let g:airline#extensions#virtualenv#enabled = 1

call plug#end()

" Habit
let mapleader = ','
let tabstop = 4
filetype plugin on

" Display hidden characters
set list
set listchars=tab:▸\ ,eol:¬

" Highligth the line the cursor is on.
set cursorline

" Show the cursor position all the time.
set ruler

" allow backspacin over everything in insert mode
set backspace=indent,eol,start

" save file when switching buffers
set autowrite

"******************************************************************************
"" Abbreviations
"******************************************************************************
"" no one is really happy until you have this shotcuts
inoremap <F1> <Esc>
inoremap <C-c> <Esc>
inoremap <C-c> :w<CR>
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
"" Copy/Paste/Cut
"******************************************************************************
if has('unnamedplus')
  set clipboard=unnamed,unnamedplus
endif

noremap YY "+y<CR>
noremap <leader>p "+gP<CR>
noremap XX "+x<CR>

if has('macunix')
  " pbcopy for OSX copy/paste
  vmap <C-x> :!pbcopy<CR>
  vmap <C-c> :w !pbcopy<CR><CR>
endif

"" Buffer nav
noremap <leader>z :bp<CR>
noremap <leader>q :bp<CR>
noremap <leader>x :bn<CR>
noremap <leader>w :bn<CR>

"" Close buffer
noremap <leader>c :bd<CR>

"" quickly cancel search highlighting
nnoremap <leader><space> :nohlsearch<CR>

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
let g:jedi#popup_on_dot = 0
let g:jedi#goto_assignments_command = "<leader>g"
let g:jedi#goto_definitions_command = "<leader>d"
let g:jedi#documentation_command = "K"
let g:jedi#usages_command = "<leader>n"
let g:jedi#rename_command = "<leader>r"
let g:jedi#show_call_signatures = "0"
let g:jedi#completions_command = "<C-Space>"
let g:jedi#smart_auto_mappings = 0
let g:jedi#force_py_version = 3
let g:jedi#use_tabs_not_buffers = 1

" ale
:call extend(g:ale_linters, {
    \'python': ['flake8'], })

"******************************************************************************
"" auto-pairs configuration
"******************************************************************************
" let g:AutoPairsMultilineClose = 0
let g:AutoPairsMapSpace = 0

"******************************************************************************
"" Enable Windows clipboard copy/paste
"******************************************************************************
source $VIMRUNTIME/mswin.vim

"******************************************************************************
"" vim-airline configuration
"******************************************************************************
let g:airline#extensions#virtualenv#enabled = 1

"******************************************************************************
"" Windows Font
"******************************************************************************
"" set guifont=Menlo:11
"" set guifont=Ubuntu\ Mono\ derivative\ Powerline:14
"" set guifont=Go\ Mono\ for\ Powerline:12
"" set guifont=InconsolataForPowerline\ NF:h10
"" set guifont=Fira\ Mono\ for\ Powerline:h12
set guifont=Anonymous\ Pro\ for\ Powerline:h13

"******************************************************************************
"" Colors schema
"******************************************************************************
let g:molokai_original = 1
colorscheme molokai

"******************************************************************************
"" NERDTree configuration
"******************************************************************************
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,*.db,*.sqlite
nnoremap <silent> <F2> :NERDTreeFind<CR>
nnoremap <silent> <F3> :NERDTreeToggle<CR>
nnoremap <leader>a :NERDTreeToggle<CR>

"******************************************************************************
"" NERDComment Settings 
"******************************************************************************
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1

" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 
		\ 'c': { 'left': '/**','right': '*/' },
		\ 'py': { 'left': '#' },
		\ 'sshconfig': { 'left': '#' },
		\ 'sshdconfig': { 'left': '#' }
		\ }

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1
