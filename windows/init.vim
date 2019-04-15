" Plugin manager
" Specify a directory for plugins
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
call plug#end()


"******************************************************************************
"" NERDTree configuration
"******************************************************************************
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,*.db,*.sqlite
nnoremap <silent> <F2> :NERDTreeFind<CR>
nnoremap <silent> <F3> :NERDTreeToggle<CR>
nnoremap <leader>a :NERDTreeToggle<CR>
