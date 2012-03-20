syntax on
filetype plugin indent on
set shiftwidth=2
set expandtab
set autoindent
set softtabstop=2
set tabstop=2
set foldmethod=indent
set encoding=utf-8
set fileencodings=utf-8,cp1251,cp866
set nocp
set tags+=~/.tags
set tags+=./tags
set ruler 
set laststatus=2
set nowrap
set wildmode=longest:full
set wildmenu
set number
set so=7
" usefull keys
map <c-o> i<CR><ESC>k$l
map  <c-p> o<ESC>p
"map <c-j> ddp
"map <c-k> ddkP
imap <c-o> <ESC>o
imap <c-e> (ctx){},<ESC>hi<CR><ESC>k$o<tab>
imap <c-f> <Space>()<Space>{}<ESC>i<CR><ESC>k$o<tab>
imap <c-l> <ESC>lli
"imap <c-h> <ESC>i
imap <c-j> <ESC>ja
imap <c-k> <ESC>ka
imap <c-w> <ESC>lwi
imap <c-W> <ESC>lWi
imap <c-b> <ESC>lbi
imap <c-B> <ESC>lBi
imap <c-u> <ESC>uli
imap <c-c><c-w> <ESC>lcw
cmap ww w<CR>
imap jj <ESC>l
ia try try<space>{}<ESC>i<CR><CR><ESC>$a<space>catch<space>(e)<space>{};<ESC>ki<space><space> 
" comments C-c
au BufRead,BufNewFile * if &ft=='javascript' | map <C-c> mn^i//<ESC>`n2l | endif
"au BufRead,BufNewFile * if &ft=='javascript' | map 1<C-c> mn^i//<ESC>`n2l | endif
au BufRead,BufNewFile * if &ft=='css' | map <C-c> mn^i/*<ESC>$a*/<ESC>`nl | endif
for i in range(2,99)
  exec "au BufRead,BufNewFile * if &ft=='javascript' | map ".i."<C-c> mn^<C-v>".(i-1)."jI//<ESC>`n2l | endif"
  exec "au BufRead,BufNewFile * if &ft=='css' | map ".i."<C-c> mn^<C-v>".(i-1)."jI/*<ESC>`nv".(i-1)."j:s/$/*\\/<CR>`n | endif"
endfor
" uncomment C-e
map <C-e> mn^<C-v>ld`n2h
"map 1<C-e> mn^<C-v>ld`n2h
for i in range(2,99)
  exec "au BufRead,BufNewFile * if &ft=='javascript' | map ".i."<C-e> mn^<C-v>".(i-1)."jld`n2h | endif"
  exec "au BufRead,BufNewFile * if &ft=='css' | map ".i."<C-e> mnv".(i-1)."j:s/\\/\\*//<CR>`nv".(i-1)."j:s/\*\\//<CR>`n2h | endif"
endfor

"backup and swap
set backupdir=~/.vim/tmp/backup
set backup
set directory=~/.vim/tmp/swap
" bind russian keyboard
map ё `
map й q
map ц w
map у e
map к r
map е t
map н y
map г u
map ш i
map щ o
map з p
map х [
map ъ ]
map ф a
map ы s
map в d
map а f
map п g
map р h
map о j
map л k
map д l
map ж ;
map э '
map я z
map ч x
map с c
map м v
map и b
map т n
map ь m
map б ,
map ю .
map . /

map Ё ~
map Й Q
map Ц W
map У E
map К R
map Е T
map Н Y
map Г U
map Ш I
map Щ O
map З P
map Х {
map Ъ }
map Ф A
map Ы S
map В D
map А F
map П G
map Р H
map О J
map Л K
map Д L
map Ж :
map Э "
map Я Z
map Ч X
map С C
map М V
map И B
map Т N
map Ь M
map Б <
map Ю >
map , ?
cmap ц w
cmap цй qw
cmap й q

au BufNewFile,BufRead *.mxml set filetype=mxml
au BufNewFile,BufRead *.as set filetype=actionscript
filetype plugin on
runtime! ftplugin/man.vim
noremap <F4> :set hlsearch! hlsearch?<CR>
"hi Comment ctermfg=DarkGrey guifg=DarkGrey
hi Comment term=standout cterm=standout ctermfg=0 guifg=DarkGrey ctermbg=6
hi LineNr term=bold ctermfg=7 ctermbg=0
hi CursorLine   cterm=NONE ctermbg=magenta ctermfg=white guibg=darkred guifg=white 
if &term =~ "screen"
  hi String ctermfg=2
  hi Pmenu ctermbg=5
  hi PmenuSel ctermbg=7
else
  set t_Co=256
  hi String ctermfg=48
  hi PmenuSel ctermbg=246
  hi Pmenu ctermfg=255 ctermbg=92
endif
map <c-T> <ESC>bmnde:r ! ~/.vim/translate en ru <C-R>=escape(@", '/\')<CR><CR>^d$`nhpmnjdd`n
imap <c-T> <ESC>bmnde:r ! ~/.vim/translate en ru <C-R>=escape(@", '/\')<CR><CR>^d$`npmnjdd`ni
"map <c-Е> <ESC>bmnde:r ! ~/translate ru en <C-R>=escape(@", '/\')<CR><CR>^d$`nhp
