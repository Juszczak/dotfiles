" reset all highlighting to the defaults.
highlight clear

" get default syntax highlighting back
syntax reset

set background=dark

" notice: colors_name must be set after syntax reset
let g:colors_name='artefakt'

if (has('gui_running'))
	highlight Normal       guibg=#212121    guifg=#f5f5f5 gui=NONE      ctermbg=NONE ctermfg=231  cterm=NONE
	highlight EndOfBuffer  guibg=#212121    guifg=#242424               ctermbg=NONE
	highlight VertSplit    guibg=#212121    guifg=#2d2d2d gui=NONE      ctermbg=NONE ctermfg=238  cterm=NONE
else
	" transparent background in terminal
	highlight Normal       guibg=NONE    guifg=#f5f5f5 gui=NONE      ctermbg=NONE ctermfg=231  cterm=NONE
	highlight EndOfBuffer  guibg=NONE    guifg=#242424               ctermbg=NONE
	highlight VertSplit    guibg=NONE    guifg=#2d2d2d gui=NONE      ctermbg=NONE ctermfg=238  cterm=NONE
endif

highlight Cursor       guibg=NONE    guifg=NONE    gui=reverse   ctermbg=NONE ctermfg=NONE cterm=reverse

highlight CursorLine   guibg=#2d2d2d               gui=NONE      ctermbg=236  ctermfg=NONE cterm=NONE
highlight CursorLineNR guibg=#2d2d2d guifg=#f5f5f5 gui=bold      ctermbg=236  ctermfg=255  cterm=bold

highlight clear SignColumn
highlight CursorColumn guibg=#2d2d2d guifg=NONE    gui=NONE      ctermbg=236  ctermfg=NONE cterm=NONE
highlight ColorColumn  guibg=#303030 guifg=NONE    gui=NONE      ctermbg=237  ctermfg=NONE cterm=NONE

highlight StatusLine   guibg=#242424 guifg=#808080 gui=NONE      ctermbg=238  ctermfg=239  cterm=NONE
highlight StatusLineNC guibg=#242424 guifg=#555555 gui=NONE      ctermbg=238  ctermfg=239  cterm=NONE
highlight WildMenu     guibg=#555555 guifg=#f5f5f5

highlight Conceal      guibg=#f5f5f5 guifg=#3a3a3a gui=NONE      ctermbg=NONE ctermfg=237  cterm=NONE
highlight SpecialKey   guibg=NONE    guifg=#3a3a3a gui=NONE      ctermbg=NONE ctermfg=237  cterm=NONE

highlight QuickFixLine guibg=#242424               gui=NONE
highlight qfSeparator  guibg=NONE    guifg=#555555

highlight Visual       guibg=#444444 guifg=NONE    gui=NONE      ctermbg=238  ctermfg=NONE cterm=NONE

highlight LineNr       guibg=NONE guifg=#808080    gui=NONE      ctermbg=NONE  ctermfg=239  cterm=NONE

highlight Comment      guibg=NONE    guifg=#808080 gui=italic    ctermbg=NONE ctermfg=244  cterm=italic
highlight NonText      guibg=NONE    guifg=#3a3a3a gui=NONE

highlight Directory    guibg=NONE    guifg=#a8a8a8 gui=bold      ctermbg=NONE ctermfg=248  cterm=bold

highlight Search       guibg=#585858 guifg=NONE    gui=NONE      ctermbg=240  ctermfg=NONE cterm=NONE
highlight MatchParen   guibg=#626262               gui=bold      ctermbg=241
highlight MatchTag     guibg=#444444               gui=bold      ctermbg=238

highlight Pmenu        guibg=#444444 guifg=#f5f5f5 gui=NONE      ctermbg=238  ctermfg=233  cterm=NONE
highlight PmenuSel     guibg=#cccccc guifg=#000000 gui=NONE      ctermbg=231  ctermfg=233  cterm=NONE
highlight PmenuSbar    guibg=#2d2d2d guifg=#f5f5f5 gui=NONE
highlight PmenuThumb   guibg=#aaaaaa guifg=#aaaaaa gui=NONE

highlight Constant     guibg=NONE    guifg=#dcdb26 gui=NONE                                cterm=NONE
highlight String       guibg=NONE    guifg=#ffd700 gui=italic                              cterm=italic
highlight Character    guibg=NONE    guifg=#ffd700 gui=italic                              cterm=italic
highlight Number       guibg=NONE    guifg=#5f5faf gui=NONE      ctermbg=NONE ctermfg=081
highlight Boolean      guibg=NONE    guifg=#5f5faf gui=NONE      ctermbg=NONE ctermfg=028

highlight Folded       guibg=#1c1c1c guifg=#767676 gui=italic    ctermbg=243  ctermfg=236  cterm=italic
highlight vimFold      guibg=#242424 guifg=#767676 gui=italic    ctermbg=238  ctermfg=236  cterm=italic
highlight FoldColumn   guibg=#242424 guifg=#767676 gui=italic    ctermbg=238  ctermfg=236  cterm=italic

highlight Title        guibg=NONE    guifg=#f5f5f5

" code
highlight Identifier   guibg=NONE    guifg=#00d8ff gui=NONE                   ctermfg=223
highlight Function     guibg=NONE    guifg=NONE
highlight Statement    guibg=NONE    guifg=#60b5cc gui=NONE                                cterm=NONE
highlight Label        guibg=NONE    guifg=#ff8700
highlight Operator     guibg=NONE    guifg=#a8a8a8 gui=NONE
highlight PreProc      guibg=NONE    guifg=#a8a8a8 gui=NONE
highlight Include      guibg=NONE    guifg=#00d8ff gui=NONE
highlight Type         guibg=NONE    guifg=#5fff5f gui=NONE                                cterm=NONE    term=NONE
highlight Structure    guibg=NONE    guifg=#af87ff
highlight StorageClass guibg=NONE    guifg=#00af00 gui=italic                              cterm=italic
highlight Typedef      guibg=NONE    guifg=#f0db4f
highlight Special      guibg=NONE    guifg=#c6538c gui=NONE                   ctermfg=231
highlight Tag          guibg=NONE    guifg=#c6538c

highlight DiffAdd      guibg=#004000                             ctermbg=022
highlight DiffText     guibg=#008700                             ctermbg=022  ctermfg=022
highlight DiffDelete   guibg=#400000 guifg=#400000               ctermbg=124  ctermfg=052
highlight DiffChange   guibg=#404000                             ctermbg=058

" spelling
highlight spellBad     guisp=#f54d27 gui=underline
highlight spellCap     guisp=#73d216 gui=underline
highlight spellRare    guisp=#fcaf3e gui=underline
highlight spellLocal   guisp=#729fcf gui=underline


" youcompleteme
highlight YcmErrorSign guibg=NONE    guifg=#f54d27 gui=NONE      ctermbg=NONE ctermfg=166

" syntastic
highlight SyntasticErrorSign   guibg=NONE    guifg=#f54d27                    ctermbg=NONE ctermfg=166
highlight SyntasticWarningSign guibg=NONE    guifg=#cdd129                    ctermbg=NONE ctermfg=184

" ale
highlight  ALEErrorSign        guibg=NONE    guifg=#f54d27                    ctermbg=NONE ctermfg=166
highlight  ALEWarningSign      guibg=NONE    guifg=#cdd129                    ctermbg=NONE ctermfg=184

" lsc
highlight link lscDiagnosticError SpellBad

" signature
highlight SignatureMarkText  guibg=NONE    guifg=#444444 gui=italic           cterm=italic

" nerdtree
highlight NERDTreeCWD                guibg=NONE guifg=#eeeeee gui=NONE   ctermbg=NONE ctermfg=255  cterm=NONE
highlight NERDTreeFile               guibg=NONE guifg=#d0d0d0 gui=NONE   ctermbg=NONE ctermfg=252  cterm=NONE
highlight NERDTreeDir                guibg=NONE guifg=#a8a8a8 gui=bold   ctermbg=NONE ctermfg=248  cterm=bold
highlight NERDTreeDirSlash           guibg=NONE guifg=#eeeeee gui=NONE   ctermbg=NONE ctermfg=255  cterm=NONE
highlight NERDTreeBookmarksHeader    guibg=NONE guifg=#a8a8a8 gui=bold   ctermbg=NONE ctermfg=248  cterm=bold
highlight NERDTreeBookmarkName       guibg=NONE guifg=#eeeeee gui=NONE   ctermbg=NONE ctermfg=255  cterm=NONE
highlight NERDTreeHelp               guibg=NONE guifg=#a8a8a8 gui=NONE   ctermbg=NONE ctermfg=NONE cterm=NONE
highlight NERDTreeLinkFile           guibg=NONE guifg=#0087d7 gui=NONE   ctermbg=NONE ctermfg=032  cterm=NONE
highlight NERDTreeLinkDir            guibg=NONE guifg=#ffffff gui=NONE   ctermbg=NONE ctermfg=231  cterm=NONE
highlight NERDTreeLinkTarget         guibg=NONE guifg=#f0db4f gui=NONE   ctermbg=NONE ctermfg=184  cterm=NONE
highlight NERDTreeFlags              guibg=NONE guifg=#585858 gui=NONE   ctermbg=NONE ctermfg=240  cterm=NONE
highlight NERDTreeOpenable           guibg=NONE guifg=#767676 gui=NONE   ctermbg=NONE ctermfg=243  cterm=NONE
highlight NERDTreeClosable           guibg=NONE guifg=#767676 gui=NONE   ctermbg=NONE ctermfg=243  cterm=NONE

" nerdtree git plugin
highlight NERDTreeGitStatusStaged               guifg=#008700 gui=NONE   ctermfg=028
highlight NERDTreeGitStatusDirClean             guifg=#008700 gui=NONE   ctermfg=028
highlight NERDTreeGitStatusRenamed              guifg=#cdd129 gui=NONE   ctermfg=184
highlight NERDTreeGitStatusModified             guifg=#cd0000 gui=NONE   ctermfg=009
highlight NERDTreeGitStatusUnmerged             guifg=#cd0000 gui=NONE   ctermfg=009
highlight NERDTreeGitStatusDirDirty             guifg=#cd0000 gui=NONE   ctermfg=009
highlight NERDTreeGitStatusUntracked            guifg=#808080 gui=italic ctermfg=244  cterm=italic
highlight NERDTreeGitStatusIgnored              guifg=#808080 gui=italic ctermfg=244  cterm=italic
