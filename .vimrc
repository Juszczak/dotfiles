syntax on
filetype plugin indent on

colorscheme dark

set number
set hidden

set tabstop=2
set softtabstop=2
set shiftwidth=2

set expandtab
set shiftround
set termguicolors

set noswapfile
set undofile
set undodir=$HOME/.vim/undodir

set noerrorbells vb t_vb=
set mouse=a

set hlsearch
set incsearch
set ignorecase
set smartcase
set showmatch

set cursorline
set ruler

set autoindent
set autoread
set showcmd
set wildmenu
set nowrap

cnoremap <c-p> <Up>
cnoremap <c-n> <Down>

nmap <silent> [a <Plug>(coc-diagnostic-prev)
nmap <silent> ]a <Plug>(coc-diagnostic-next)

"nmap <silent> gd <Plug>(coc-definition)
nmap <silent> ty <Plug>(coc-type-definition)
nmap <silent> go <Plug>(coc-implementation)
nmap <silent> <c-]> <Plug>(coc-definition)
nmap <silent> ge <Plug>(coc-definition)
nmap <silent> gr <Plug>(coc-references)

nmap <silent> to :call CocAction('runCommand', 'editor.action.organizeImport')<cr>
nmap <silent> rn <Plug>(coc-rename)

nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

nmap <silent> [c <Plug>(coc-git-prevchunk)
nmap <silent> ]c <Plug>(coc-git-nextchunk)
nmap <silent> gs <Plug>(coc-git-chunkinfo)

nmap <silent> ff <Plug>(coc-fix-current)
nmap <silent> fa <Plug>(coc-codeaction)
nmap <silent> fo <Plug>(coc-format)

nmap <silent> tt :NERDTreeToggle<cr>
nmap <silent> tf :NERDTreeFind<cr>

