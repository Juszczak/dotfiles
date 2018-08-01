syntax on
colorscheme artefakt
scriptencoding utf-8
set encoding=utf-8
set hidden
set modeline
set cmdheight=2
set showtabline=2
set wildmenu
set ttyfast
set ttymouse=xterm2
set showcmd
set autoread
set nobackup
set nowritebackup
set noswapfile
set undofile
set undodir=$HOME/.vim/undodir
set autowrite
set backspace=indent,eol,start
set noerrorbells vb t_vb=
set mouse=a
set lazyredraw
set synmaxcol=140
set showmatch
set matchpairs+=<:>
set incsearch
set ignorecase
set hlsearch
set smartcase
set shiftwidth=2
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set shiftround
set smarttab
set nowrap
set linebreak
set ruler
set colorcolumn=140
set titlestring=%f title
set sidescroll=2
set number
set listchars+=tab:·\ ,extends:,eol:$
set list
let &showbreak = '⤷ '
set breakindent
set fillchars+=vert:⎸
" set fillchars+=vert:│
set showmode
set formatoptions+=j

if !has('gui_running')
	if exists('$TMUX')
		let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
		let &t_SR = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=2\x7\<Esc>\\"
		let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
	else
		let &t_SI = "\<Esc>]50;CursorShape=1\x7"
		let &t_SR = "\<Esc>]50;CursorShape=2\x7"
		let &t_EI = "\<Esc>]50;CursorShape=0\x7"
	endif
	set termguicolors
	set t_Co=256
	let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
	let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
	let g:guicolors=1
	set t_ZH=[3m
	set t_ZR=[23m
endif

if &diff
	set nocursorline
	set norelativenumber
	set foldcolumn=2
endif

set viewoptions=
	\folds,
	\options,
	\cursor,
	\unix,
	\slash

cnoremap <c-k> <up>
cnoremap <c-j> <down>

cmap w!! w !sudo tee > /dev/null %

vnoremap J :m '>+1<cr>gv=gv
vnoremap K :m '<-2<cr>gv=gv

" http://vim.wikia.com/wiki/Improved_hex_editing
nmap <f12> :%!xxd<cr>

if !has('gui_running')
	function! ToggleCopyPasteMode()
		set invpaste paste?
		if &paste
			setlocal clipboard=unnamed
		else
			setlocal clipboard=
		endif
	endfunction
	map <silent> <F2> :call ToggleCopyPasteMode()<cr>
endif

function! ToggleHome()
	let l:position = getpos('.')
	execute 'normal! ^'
	if l:position == getpos('.')
		execute 'normal! 0'
	endif
endfunction
nnoremap <silent> 0 :call ToggleHome()<cr>

function! s:WindowEnter()
	if &number
		setlocal relativenumber
	endif
	highlight CursorLineNR guibg=#2d2d2d guifg=#f5f5f5 gui=bold
	setlocal cursorline
endfunction

function! s:WindowLeave()
	if &number && &relativenumber
		setlocal norelativenumber
	endif
	highlight CursorLineNR guibg=#242424 guifg=#f5f5f5 gui=bold
	setlocal nocursorline
endfunction

if has('gui_running')
	augroup CurrentWindow
		autocmd!
		autocmd VimEnter,WinEnter,BufWinEnter * call s:WindowEnter()
		autocmd WinLeave * call s:WindowLeave()
	augroup END
endif

call plug#begin('~/.vim/plugged')

Plug 'sheerun/vim-polyglot' " https://github.com/sheerun/vim-polyglot
let g:jsx_ext_required = 1
let g:typescript_opfirst='\%([<>=,?^%|*/&]\|\([-:+]\)\1\@!\|!=\|in\%(stanceof\)\=\>\)'

Plug 'tpope/vim-commentary' " https://github.com/tpope/vim-commentary
Plug 'itchyny/vim-cursorword' " https://github.com/itchyny/vim-cursorword
Plug 'scrooloose/nerdtree' " https://github.com/scrooloose/nerdtree
nmap <silent> tt :NERDTreeToggle<cr>
nmap <silent> tf :NERDTreeFind<cr>
let g:NERDTreeIgnore = ['\.DS_Store$', '\Icon$', '\~$']
let g:NERDTreeShowBookmarks = 1
let g:NERDTreeBookmarksSort = 0
let g:NERDTreeMinimalUI = 1
let g:NERDTreeSortOrder = [
	\ '\.git/$',
	\ 'bower_components',
	\ 'node_modules',
	\ '\/$',
	\ '*',
	\ '\.editorconfig',
	\ 'README',
	\ 'LICENSE',
	\ ]

Plug 'Xuyuanp/nerdtree-git-plugin' | Plug 'tpope/vim-fugitive' " https://github.com/Xuyuanp/nerdtree-git-plugin
let g:NERDTreeShowIgnoredStatus = 0
let g:NERDTreeUseSimpleIndicator = 0
let g:NERDTreeIndicatorMapCustom = {
	\ 'Modified'  : '~',
	\ 'Staged'    : '+',
	\ 'Untracked' : '•',
	\ 'Renamed'   : '→',
	\ 'Unmerged'  : '═',
	\ 'Deleted'   : '-',
	\ 'Dirty'     : '×',
	\ 'Clean'     : '*',
	\ 'Ignored'   : '¬',
	\ 'Unknown'   : '?'
	\ }

Plug 'airblade/vim-gitgutter' | Plug 'tpope/vim-fugitive' " https://github.com/airblade/vim-gitgutter
let g:gitgutter_sign_added = '·'
let g:gitgutter_sign_modified = '·'
let g:gitgutter_sign_removed = '·'
let g:gitgutter_sign_removed_first_line = '·'
let g:gitgutter_sign_modified_removed = '·'

Plug 'natebosch/vim-lsc' " https://github.com/natebosch/vim-lsc
let g:lsc_server_commands = {'dart': 'dart_language_server'}
let g:lsc_enable_autocomplete = v:false
let g:lsc_auto_map = {
	\ 'GoToDefinition': '<C-]>',
	\ 'FindReferences': 'gr',
	\ 'ShowHover': 'ty',
	\ 'Completion': 'omnifunc',
	\}

Plug 'Valloric/YouCompleteMe', { 'do': './install.py --all' }
let g:ycm_error_symbol = '!'
let g:ycm_warning_symbol = '△'
let g:ycm_semantic_triggers = {}
let g:ycm_filetype_specific_completion_to_disable = {
	\ 'gitcommit': 1
	\ }
let g:ycm_add_preview_to_completeopt = 1
let g:ycm_confirm_extra_conf = 0
let g:ycm_always_populate_location_list = 1
let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_rust_src_path = $RUST_SRC_PATH

let g:ycm_mappings_filetypes = ['typescript', 'javascript', 'python', 'rust', 'go']
function! MapYcmCompleter()
	if (!empty(&filetype) && join(g:ycm_mappings_filetypes) =~ &filetype)
		noremap <buffer> <silent> <C-LeftMouse> :YcmCompleter GoToDefinition<cr>
		nnoremap <buffer> <silent> <M-LeftMouse> :YcmCompleter GoToReferences<cr>
		nmap <buffer> <silent> <C-]> :YcmCompleter GoToDefinition<cr>
		nmap <buffer> <silent> gr :YcmCompleter GoToReferences<cr>
		nmap <buffer> <silent> ty :YcmCompleter GetType<cr>
	endif
endfunction

augroup MapYcmCompleter
	autocmd!
	autocmd VimEnter,WinEnter,BufWinEnter * call MapYcmCompleter()
augroup END

Plug 'ElmCast/elm-vim' " https://github.com/ElmCast/elm-vim
Plug 'ctrlpvim/ctrlp.vim' " https://github.com/ctrlpvim/ctrlp.vim
nmap <leader>cc :CtrlPClearAllCaches<cr>
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

Plug 'vim-airline/vim-airline' " https://github.com/vim-airline/vim-airline
let g:airline#extensions#ctrlspace#enabled = 1
let g:airline#extensions#tabline#switch_buffers_and_tabs = 0
let g:airline_left_sep=''
let g:airline_right_sep=''
let g:airline_exclude_preview = 0
let g:airline_skip_empty_sections = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 1
let g:airline#extensions#tabline#show_tabs = 1
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tabline#buffer_nr_format = '%s '
let g:airline#extensions#tabline#fnamemod = ':s?NERD_tree_1?tree?:s?ControlP?open?:t:.'
let g:airline#extensions#tabline#fnamecollapse = 1
let g:airline#extensions#tabline#fnametruncate = 0
let g:airline#extensions#tabline#buffer_min_count = 1
let g:airline#extensions#tabline#tab_min_count = 2

let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = ''
let g:airline#extensions#tabline#right_sep = ''
let g:airline#extensions#tabline#right_alt_sep = ''

let g:airline#extensions#tabline#reverse_buffers_and_tabs = 1
let g:airline#extensions#tabline#show_close_button = 1
let g:airline#extensions#tabline#close_symbol = '×'

let g:airline#extensions#tabline#tabs_label = ''
let g:airline#extensions#tabline#buffers_label = ''

let g:airline#extensions#tabline#ignore_bufadd_pat = '\c\vgundo|undotree|vimfiler|tagbar|nerd_tree'

if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif

let g:airline_symbols.linenr = '☰'
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''

let g:airline_theme_patch_func = 'AirlineThemePatch'
function! AirlineThemePatch(palette)
	if g:airline_theme ==? 'dark'
		let s:a = ['#d0d0d0', '#444444', 252, 238]
		let s:b = ['#d0d0d0', '#303030', 252, 236]
		if (has('gui_running'))
			let s:c = ['#eeeeee', '#212121', 255, 235]
		else
			let s:c = ['#eeeeee', 'NONE', 255, 235]
		endif
		let s:modified = {'airline_c': ['#bcbcbc', '#585858', 250, 240, '']}

		let g:airline#themes#dark#palette.normal = airline#themes#generate_color_map(s:a, s:b, s:c)
		let g:airline#themes#dark#palette.normal_modified = s:modified
		let g:airline#themes#dark#palette.insert = copy(g:airline#themes#dark#palette.normal)
		let g:airline#themes#dark#palette.insert_modified = g:airline#themes#dark#palette.normal_modified
		let g:airline#themes#dark#palette.visual = copy(g:airline#themes#dark#palette.normal)
		let g:airline#themes#dark#palette.visual_modified = g:airline#themes#dark#palette.normal_modified
		let g:airline#themes#dark#palette.replace = copy(g:airline#themes#dark#palette.normal)
		let g:airline#themes#dark#palette.replace_modified = g:airline#themes#dark#palette.insert_modified
		let g:airline#themes#dark#palette.insert_paste = copy(g:airline#themes#dark#palette.normal)

		if get(g:, 'loaded_ctrlp', 0)
			let g:airline#themes#dark#palette.ctrlp = airline#extensions#ctrlp#generate_color_map(s:a, s:b, s:c)
		endif
	endif
endfunction

if has('gui_running')
	nmap <d-1> <Plug>AirlineSelectTab1
	nmap <d-2> <Plug>AirlineSelectTab2
	nmap <d-3> <Plug>AirlineSelectTab3
	nmap <d-4> <Plug>AirlineSelectTab4
	nmap <d-5> <Plug>AirlineSelectTab5
	nmap <d-6> <Plug>AirlineSelectTab6
	nmap <d-7> <Plug>AirlineSelectTab7
	nmap <d-8> <Plug>AirlineSelectTab8
	nmap <d-9> <Plug>AirlineSelectTab9
endif

Plug 'jaxbot/semantic-highlight.vim' " https://github.com/jaxbot/semantic-highlight.vim
nmap <leader>s :SemanticHighlight<cr>

let g:semantic_highlight_filetypes = ['typescript', 'javascript', 'python', 'rust', 'java', 'dart', 'go', 'erlang', 'solidity', 'haskell']
function! s:Escape()
	" MacVim issue
	:silent nohlsearch
	if (!empty(&filetype) && join(g:semantic_highlight_filetypes) =~ &filetype)
		:SemanticHighlight
	endif
endfunction

augroup SemanticHighlightFiletypeEvents
	autocmd!
	autocmd FileType * :call s:Escape()
	autocmd InsertLeave,InsertEnter * :call s:Escape()
augroup END

Plug 'editorconfig/editorconfig-vim' " https://github.com/editorconfig/editorconfig-vim
Plug 'w0rp/ale' " https://github.com/w0rp/ale
let g:ale_sign_error = '!'
let g:ale_sign_warning = '!'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
nmap <silent> [a <Plug>(ale_previous_wrap)
nmap <silent> ]a <Plug>(ale_next_wrap)
let g:ale_fixers = {
	\ 'typescript': ['tslint'],
	\ 'javascript': ['prettier']
	\ }
let g:ale_completion_enabled = 0
let g:ale_fix_on_save = 0
let g:ale_dart_dartanalyzer_executable = '/usr/local/bin/dartanalyzer'
let g:ale_linters = {
	\'rust': ['rustc'],
\ }

Plug 'vim-erlang/vim-erlang-runtime' " https://github.com/vim-erlang/vim-erlang-runtime
let g:polyglot_disabled = ['erlang']

Plug 'https://github.com/nbouscal/vim-stylish-haskell' " https://github.com/nbouscal/vim-stylish-haskell

Plug 'eagletmt/neco-ghc' " https://github.com/eagletmt/neco-ghc

Plug 'vim-erlang/vim-erlang-omnicomplete' " https://github.com/vim-erlang/vim-erlang-omnicomplete
Plug 'sbdchd/neoformat' " https://github.com/sbdchd/neoformat
nmap <leader>f :Neoformat<cr>
let g:neoformat_enabled_typescript = ['prettier']
let g:neoformat_enabled_javascript = ['prettier']

let g:format_on_save_filetypes = ['dart', 'go']
function! Format()
	if (!empty(&filetype) && join(g:format_on_save_filetypes) =~ &filetype)
		Neoformat
	endif
endfunction

Plug 'alvan/vim-closetag' " https://github.com/alvan/vim-closetag
Plug 'jiangmiao/auto-pairs' " https://github.com/jiangmiao/auto-pairs
Plug 'tpope/vim-surround' " https://github.com/tpope/vim-surround
Plug 'tmhedberg/matchit' " https://github.com/tmhedberg/matchit
Plug 'Valloric/MatchTagAlways' " https://github.com/Valloric/MatchTagAlways
Plug 'kshenoy/vim-signature' " https://github.com/kshenoy/vim-signature
let g:SignatureMarkTextHLDynamic = 1

Plug 'ap/vim-css-color' " https://github.com/ap/vim-css-color
Plug 'mbbill/undotree' " https://github.com/mbbill/undotree
Plug 'tpope/vim-scriptease' " https://github.com/tpope/vim-scriptease

call plug#end()

map <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>
