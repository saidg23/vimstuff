set background=dark
hi clear
if exists("syntax_on")
    syntax reset
endif

let g:colors_name = "customblue"

hi Normal        guifg=white guibg=#001a30
hi Comment       guifg=steelBlue
hi Constant      guifg=firebrick1
hi Character     guifg=cyan1
hi String        guifg=cyan1
hi Identifier    guifg=white
hi Statement     cterm=bold guifg=#3fdb37
hi PreProc       guifg=LightCoral
hi Type          cterm=bold guifg=orange
hi Special       guifg=LightCoral

hi Folded        guifg=steelBlue guibg=#012647
hi Visual        cterm=bold guifg=lightcyan guibg=#053f72
hi Pmenu         guifg=LightCyan guibg=#053f72
hi NonText       guifg=steelBlue
hi Question      guifg=white
hi Todo          cterm=bold guifg=gray20 guibg=turquoise3
hi LineNr        guifg=gainsboro

hi MatchParen    guifg=white
