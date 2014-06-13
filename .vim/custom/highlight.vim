hi Comment term=standout cterm=standout ctermfg=0 guifg=DarkGrey ctermbg=6
hi LineNr term=bold ctermfg=7 ctermbg=0
hi CursorLine   cterm=NONE ctermbg=magenta ctermfg=white guibg=darkred guifg=white 
if &term =~ 'screen'
  hi String ctermfg=2
  hi Pmenu ctermbg=5 ctermfg=7
  hi PmenuSel ctermbg=7
else
  "set t_Co=256
  hi String ctermfg=48
  hi PmenuSel ctermbg=246
  hi Pmenu ctermfg=255 ctermbg=92
endif
