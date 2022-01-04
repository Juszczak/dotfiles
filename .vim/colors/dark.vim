highlight clear
syntax reset

set background=dark
let g:colors_name='dark'

if (has('gui_running'))
  highlight Normal       guibg=#212121 guifg=#f5f5f5 gui=NONE
  highlight EndOfBuffer  guibg=#212121 guifg=#242424
else
  highlight Normal       guibg=NONE    guifg=#f5f5f5 gui=NONE
  highlight EndOfBuffer  guibg=NONE    guifg=#242424
endif

highlight VertSplit    guibg=NONE    guifg=#2d2d2d gui=reverse

highlight Cursor       guibg=NONE    guifg=NONE    gui=reverse
highlight CursorLine   guibg=#2d2d2d               gui=NONE cterm=NONE
highlight CursorLineNR guibg=#2d2d2d guifg=#f5f5f5 gui=NONE cterm=NONE
highlight Folded       guibg=#2d2d2d guifg=#999999

highlight clear SignColumn
highlight CursorColumn guibg=#2d2d2d guifg=NONE    gui=NONE
highlight ColorColumn  guibg=#303030 guifg=NONE    gui=NONE

highlight StatusLine   guibg=#212121 guifg=#808080 gui=NONE cterm=NONE
highlight StatusLineNC guibg=#212121 guifg=#555555 gui=NONE cterm=NONE
highlight WildMenu     guibg=#555555 guifg=#f5f5f5

highlight Search       guibg=#585858 guifg=NONE    gui=NONE
highlight MatchParen   guibg=#626262               gui=bold
highlight MatchTag     guibg=#444444               gui=bold

highlight Pmenu        guibg=#444444 guifg=#f5f5f5 gui=NONE
highlight PmenuSel     guibg=#cccccc guifg=#000000 gui=NONE
highlight PmenuSbar    guibg=#2d2d2d guifg=#f5f5f5 gui=NONE
highlight PmenuThumb   guibg=#aaaaaa guifg=#aaaaaa gui=NONE

highlight BufTabLineCurrent guibg=#444444 guifg=#ffffff gui=bold
highlight BufTabLineActive  guibg=#303030 guifg=#f5f5f5
highlight BufTabLineHidden  guibg=#212121 guifg=#eeeeee
highlight BufTabLineFill    guibg=#212121

highlight Conceal      guibg=NONE guifg=#f5f5f5
highlight SpecialKey   guibg=NONE    guifg=#3a3a3a gui=NONE

highlight QuickFixLine guibg=#242424               gui=NONE
highlight qfSeparator  guibg=NONE    guifg=#555555

highlight Visual       guibg=#444444 guifg=NONE    gui=NONE
highlight LineNr       guibg=NONE guifg=#808080    gui=NONE

highlight Comment      guibg=NONE    guifg=#808080 gui=italic
highlight NonText      guibg=NONE    guifg=#3a3a3a gui=NONE

highlight Directory    guibg=NONE    guifg=#a8a8a8 gui=bold
highlight Constant     guibg=NONE    guifg=#ffd700 gui=italic

highlight GitGutterAdd    guifg=#009900 ctermfg=2
highlight GitGutterChange guifg=#bbbb00 ctermfg=3
highlight GitGutterDelete guifg=#ff2222 ctermfg=1

highlight  ALEErrorSign        guibg=NONE    guifg=#f54d27
highlight  ALEWarningSign      guibg=NONE    guifg=#cdd129

highlight SpellBad term=NONE guibg=#f54d27 gui=undercurl guisp=#f54d27

highlight CSVColumnOdd   term=bold gui=bold guifg=#ffff60
highlight CSVColumnEven  term=underline gui=bold guifg=#60ff60
highlight CSVDelimiter   guibg=NONE guifg=#a8a8a8

