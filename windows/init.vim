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

	" Auto close parens, braces, brackets, etc
	Plug 'jiangmiao/auto-pairs'

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

"******************************************************************************
"" auto-pairs configuration
"******************************************************************************
" let g:AutoPairsMultilineClose = 0
let g:AutoPairsMapSpace = 0


"******************************************************************************
"" vim-airline configuration
"******************************************************************************
let g:airline#extensions#virtualenv#enabled = 1

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

2t6U3&PzS6X!
