" Vim color file
"
" Author: Lukas 'Cr4ckonosh' Hais
"
" Note: Inanis color theme based by my needs
"   will update soon I think (last commit was 5 years ago; aged well : - ))
"   steal as you please
"

hi clear

if version > 580
    " no guarantees for version 5.8 and below, but this makes it stop
    " complaining
    hi clear
    if exists("syntax_on")
        syntax reset
    endif
endif
let g:colors_name="Inanis"


hi Constant        guifg=#AA66FF               gui=bold
hi String          guifg=#FFFB00
hi Character       guifg=#FFFB00
hi Number          guifg=#AA66FF
hi Boolean         guifg=#AA66FF
hi Float           guifg=#AA66FF

hi Function        guifg=#4DD800
hi Identifier      guifg=#4DD800

hi Statement       guifg=#E93EC1               gui=bold
hi Conditional     guifg=#E93EC1               gui=bold
hi Repeat          guifg=#E93EC1               gui=bold
hi Label           guifg=#FFFB00               gui=none
hi Operator        guifg=#E93EC1
hi Keyword         guifg=#E93EC1               gui=bold
hi Exception       guifg=#4DD800               gui=bold

hi PreCondit       guifg=#4DD800               gui=bold
hi PreProc         guifg=#4DD800
hi Define          guifg=#00C2FF
hi Macro           guifg=#AAA133               gui=italic

hi Typedef         guifg=#00C2FF
hi Type            guifg=#00C2FF               gui=none
hi StorageClass    guifg=#FF9911               gui=italic
hi Structure       guifg=#00C2FF

hi SpecialChar     guifg=#E93EC1               gui=bold
hi SpecialComment  guifg=#7E8E9E               gui=bold
hi Special         guifg=#00C2FF guibg=bg      gui=italic
hi Tag             guifg=#E93EC1               gui=italic
hi Delimiter       guifg=#8F8F8F
hi Debug           guifg=#DDA3A3               gui=bold

hi Cursor          guifg=#000000 guibg=#F8F8F0
hi iCursor         guifg=#000000 guibg=#F8F8F0
hi DiffAdd                       guibg=#13354A
hi DiffChange      guifg=#89807D guibg=#4C4745
hi DiffDelete      guifg=#960050 guibg=#2E0000
hi DiffText                      guibg=#4C4745 gui=italic,bold

hi Directory       guifg=#4DD800               gui=bold
hi Error           guifg=#FFFB00 guibg=#2E0000
hi ErrorMsg        guifg=#E93EC1 guibg=#252525 gui=bold
hi FoldColumn      guifg=#465457 guibg=#000000
hi Folded          guifg=#465457 guibg=#000000
hi Ignore          guifg=#808080 guibg=bg
hi IncSearch       guifg=#AAA133 guibg=#000000

hi SpecialKey      guifg=#00C2FF               gui=italic

hi MatchParen      guifg=#000000 guibg=#FF9911 gui=bold
hi ModeMsg         guifg=#FFFB00
hi MoreMsg         guifg=#FFFB00

" complete menu
hi Pmenu           guifg=#00CF22 guibg=#000000
hi PmenuSel                      guibg=#808080
hi PmenuSbar                     guibg=#080808
hi PmenuThumb      guifg=#00C2FF

hi Question        guifg=#00C2FF
hi Search          guifg=#000000 guibg=#FFE792
" marks
hi SignColumn      guifg=#4DD800 guibg=#252525
if has("spell")
    hi SpellBad    guisp=#FF0000 gui=undercurl
    hi SpellCap    guisp=#7070F0 gui=undercurl
    hi SpellLocal  guisp=#70F0F0 gui=undercurl
    hi SpellRare   guisp=#FFFFFF gui=undercurl
endif
hi StatusLine      guifg=#445555 guibg=fg
hi StatusLineNC    guifg=#808080 guibg=#080808
hi Title           guifg=#FF5544
hi Todo            guifg=#FFFFFF guibg=bg      gui=bold

hi Underlined      guifg=#808080               gui=underline

hi VertSplit       guifg=#808080 guibg=#080808 gui=bold
hi VisualNOS                     guibg=#403D3D
hi Visual                        guibg=#403D3D
hi WarningMsg      guifg=#FFFFFF guibg=#333333 gui=bold
hi WildMenu        guifg=#00C2FF guibg=#000000

hi TabLineFill     guifg=#1B1D1E guibg=#1B1D1E
hi TabLine         guibg=#1B1D1E guifg=#808080 gui=none

hi Normal          guifg=#F8F8F8 guibg=#181818
hi Comment         guifg=#7E8E9E
hi CursorLine                    guibg=#3E3D32
hi CursorLineNr    guifg=#FF9911               gui=none
hi CursorColumn                  guibg=#3E3D32
hi ColorColumn                   guibg=#3B3A32
hi LineNr          guifg=#BCBCBC guibg=#3B3A32
hi NonText         guifg=#75715E
hi SpecialKey      guifg=#75715E

"
" Support for 256-color terminal
"
if &t_Co > 255
  hi Normal       ctermfg=231 ctermbg=233
  hi CursorLine               ctermbg=237   cterm=none
  hi CursorLineNr ctermfg=208               cterm=none
  hi Boolean         ctermfg=135
  hi Character       ctermfg=226
  hi Number          ctermfg=135
  hi String          ctermfg=226
  hi Conditional     ctermfg=165               cterm=bold
  hi Constant        ctermfg=135               cterm=bold
  hi Cursor          ctermfg=16  ctermbg=231
  hi Debug           ctermfg=181               cterm=bold
  hi Define          ctermfg=14
  hi Delimiter       ctermfg=102

  hi DiffAdd                     ctermbg=23
  hi DiffChange      ctermfg=102 ctermbg=59
  hi DiffDelete      ctermfg=89  ctermbg=52
  hi DiffText                    ctermbg=59 cterm=bold

  hi Directory       ctermfg=76               cterm=bold
  hi Error           ctermfg=226 ctermbg=52
  hi ErrorMsg        ctermfg=165 ctermbg=59    cterm=bold
  hi Exception       ctermfg=76               cterm=bold
  hi Float           ctermfg=135
  hi FoldColumn      ctermfg=60  ctermbg=16
  hi Folded          ctermfg=60  ctermbg=16
  hi Function        ctermfg=76
  hi Identifier      ctermfg=76               cterm=none
  hi Ignore          ctermfg=102 ctermbg=bg
  hi IncSearch       ctermfg=148 ctermbg=16

  hi keyword         ctermfg=165               cterm=bold
  hi Label           ctermfg=226               cterm=none
  hi Macro           ctermfg=135
  hi SpecialKey      ctermfg=14

  hi MatchParen      ctermfg=16  ctermbg=214 cterm=bold
  hi ModeMsg         ctermfg=226
  hi MoreMsg         ctermfg=226
  hi Operator        ctermfg=165

  " complete menu
  hi Pmenu           ctermfg=14  ctermbg=16
  hi PmenuSel        ctermfg=231 ctermbg=102
  hi PmenuSbar                   ctermbg=102
  hi PmenuThumb      ctermfg=14

  hi PreCondit       ctermfg=76               cterm=bold
  hi PreProc         ctermfg=76
  hi Question        ctermfg=14
  hi Repeat          ctermfg=165               cterm=bold
  hi Search          ctermfg=0   ctermbg=228   cterm=NONE

  " marks column
  hi SignColumn      ctermfg=76  ctermbg=59
  hi SpecialChar     ctermfg=165               cterm=bold
  hi SpecialComment  ctermfg=103               cterm=bold
  hi Special         ctermfg=14
  if has("spell")
    hi SpellBad                ctermbg=196
    hi SpellCap                ctermbg=105
    hi SpellLocal              ctermbg=105
    hi SpellRare  ctermfg=none ctermbg=none  cterm=reverse
  endif
  hi Statement       ctermfg=165               cterm=bold
  hi StatusLine      ctermfg=60  ctermbg=fg
  hi StatusLineNC    ctermfg=102 ctermbg=232
  hi StorageClass    ctermfg=208
  hi Structure       ctermfg=14
  hi Tag             ctermfg=165
  hi Title           ctermfg=209
  hi Todo            ctermfg=231 ctermbg=bg   cterm=bold

  hi Typedef         ctermfg=14
  hi Type            ctermfg=14                cterm=none
  hi Underlined      ctermfg=102               cterm=underline

  hi VertSplit       ctermfg=102 ctermbg=232   cterm=bold
  hi VisualNOS                   ctermbg=59
  hi Visual                      ctermbg=59
  hi WarningMsg      ctermfg=231 ctermbg=237   cterm=bold
  hi WildMenu        ctermfg=14  ctermbg=16

  hi Comment         ctermfg=103
  hi CursorColumn                ctermbg=237
  hi ColorColumn                 ctermbg=237
  hi LineNr          ctermfg=250 ctermbg=237
  hi NonText         ctermfg=243

  hi SpecialKey      ctermfg=243
end

" Must be at the end, because of ctermbg=234 bug.
" https://groups.google.com/forum/#!msg/vim_dev/afPqwAFNdrU/nqh6tOM87QUJ
set background=dark
