set bg=dark
hi clear
if exists('syntax_on')
  syntax reset
endif

let g:colors_name = 'custom'

highlight Normal        guifg=#d8d8d8 guibg=#0e0e16
highlight NormalFloat   guifg=#d8d8d8 guibg=#252532
highlight Comment       guifg=#8ac490
highlight TSComment     guifg=#8ac490
highlight Conceal       guifg=#707c8c guibg=#1a1a24
highlight Constant      guifg=#ef8a90
highlight DiffAdd       guifg=#d8d8d8 guibg=#1a2e1f
highlight DiffChange    guifg=#d8d8d8 guibg=#33415c
highlight DiffDelete    guifg=#d8d8d8 guibg=#3a2020
highlight DiffText      guifg=#0e0e16 guibg=#d1b77a
highlight Directory     guifg=#70a8a8
highlight Error         guifg=#ef8a90 gui=undercurl
highlight ErrorMsg      guifg=#ef8a90
highlight Function      guifg=#b0c0e0
highlight Identifier    guifg=#d8d8d8
highlight LineNrAbove   guifg=#707c8c guibg=#0e0e16
highlight LineNrBelow   guifg=#707c8c guibg=#0e0e16
highlight LineNr        guifg=#707c8c guibg=#0e0e16
highlight MatchParen    guifg=#d8d8d8 guibg=#33415c
highlight NonText       guifg=#707c8c
highlight Operator      guifg=#858d95
highlight Pmenu         guifg=#d8d8d8 guibg=#1a1a24
highlight PmenuSbar     guifg=#707c8c guibg=#1a1a24
highlight PmenuSel      guifg=#0e0e16 guibg=#b0c0e0
highlight PmenuThumb    guifg=#707c8c guibg=#33415c
highlight PreProc       guifg=#858d95
highlight Question      guifg=#5fa6a6
highlight QuickFixLine  guibg=#1a1a24
highlight Search        guifg=#0e0e16 guibg=#d1b77a
highlight Special       guifg=#d8d8d8
highlight SpecialChar   guifg=#ef8a90
highlight SpecialKey    guifg=#707c8c
highlight Statement     guifg=#858d95
highlight StatusLine    guifg=#d8d8d8 guibg=#1a1a24
highlight String        guifg=#d58ca6
highlight Structure     guifg=#70a8a8
highlight Substitute    guifg=#0e0e16 guibg=#b0c0e0
highlight TabLine       guifg=#707c8c guibg=#1a1a24
highlight TabLineFill   guifg=#707c8c guibg=#1a1a24
highlight TabLineSel    guifg=#d8d8d8 guibg=#252532
highlight Title         guifg=#d8d8d8 term=none cterm=none
highlight Todo          guifg=#0e0e16 guibg=#8ac490
highlight Type          guifg=#70a8a8
highlight Underlined    gui=underline guifg=#b0c0e0
highlight VertSplit     guifg=#707c8c
highlight Visual        guibg=#33415c
highlight WarningMsg    guifg=#d1b77a
highlight Float         guifg=#5fa6a6
highlight Number        guifg=#ef8a90
highlight Boolean       guifg=#ef8a90
highlight WinSeparator  guifg=#707c8c guibg=#0e0e16
highlight CursorLine    guibg=#1a1a24
highlight CursorLineNr  guifg=#d8d8d8 guibg=#1a1a24

highlight @markup.link.label.markdown_inline cterm=NONE
