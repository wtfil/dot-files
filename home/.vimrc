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
" reload vimrc
map <F5> :so ~/.vimrc<cr>
" usefull keys
map <space> i<space><esc>l
map <c-h> hdl
map <c-o> i<CR><ESC>k$l
map  <c-p> o<ESC>p
imap <c-o> <ESC>o
imap <c-f> <space>()<esc>i
" making () and {}
" imap <c-e> <esc>$a<space>{}<esc>i<cr><esc>ko<tab>
" imap <c-E> <esc>$a<space>{},<esc>hi<cr><esc>ko<tab>
" imap <c-r> <esc>$a<space>{}.bind(this)<esc>11hi<cr><esc>ko<tab>
" imap <c-R> <esc>$a<space>{}.bind(this),<esc>12hi<cr><esc>ko<tab>
function! Brackets(addition)
  let ln = line(".")
  let cn = col(".")
  let fullLine =  getline(ln)
  let before = strpart(fullLine, 0, cn)
  let after = strpart(fullLine, cn, 999)
  if &ft == 'javascript'
    let operators2way = '\(if\|function\|for\|while\)'
    let operators1way = '\(else\|return\|=\)'
    if before =~ operators2way.'[ ]*$'
      exe "normal" "a ()\<esc>h"
    elseif before =~ operators2way.' ('
      if a:addition
        exe "normal" "t)la {}.bind(this)\<esc>11hi\<cr>\<esc>O\<tab>"
      else 
        exe "normal" "t)la {}\<esc>i\<cr>\<esc>O\<tab>"
      endif
    elseif before =~ operators1way
      exe "normal" "a {}\<esc>i\<cr>\<esc>O\<tab>"
    endif
  elseif &ft == 'css'
    exe "normal" "o{}\<esc>i\<cr>\<esc>O"
  endif
endfunction
map <c-f> <ESC>:call Brackets(0)<cr>
imap <c-f> <ESC>:call Brackets(0)<cr>a
imap <c-e> <ESC>:call Brackets(1)<cr>a
" maping contorlls in insert mode
"imap <c-h> <ESC>i
imap <c-l> <ESC>lli
imap <c-j> <ESC>ja
imap <c-k> <ESC>ka
imap <c-w> <ESC>lwi
imap <c-W> <ESC>lWi
imap <c-b> <ESC>lbi
imap <c-B> <ESC>lBi
imap <c-u> <ESC>uli
imap <c-c><c-w> <ESC>lcw
cmap ww w<CR>
ia try try<space>{}<ESC>i<CR><CR><ESC>$a<space>catch<space>(e)<space>{};<ESC>ki<space><space> 
" comments
function! ToggleComments(start, end)
  let ft = &filetype
  let start = getline(a:start)
  if ft == 'javascript' || ft == 'css' || ft == 'php'
    if start =~ '\/\*'
      " removing /* */
      exe a:start 's/\/\*[ ]*//'
      exe a:end 's/[ ]*\*\///'
    else
      " adding /* */
      exe a:start 's/[^ ]/\/* \0/'
      exe a:end 's/$/ *\//'
    endif
  endif
  if ft == 'html'
    if start =~ '<\!\-\-'
      " removing <!-- -->
      exe a:start 's/<\!\-\-[ ]*//'
      exe a:end 's/[ ]*\-\->//'
    else
      " adding <!-- -->
      exe a:start 's/[^ ]/<!-- \0/'
      exe a:end 's/$/ -->/'
    endif
  endif
endfunction
command! -range ToggleComments call ToggleComments(<line1>, <line2>)
vmap <c-c> :ToggleComments<cr>
map <c-c> :ToggleComments<cr>

" OnlineDoc
function! OnlineDoc()
  if &ft =~ "cpp"
    let s:urlTemplate = "http://doc.trolltech.com/4.1/%.html"
  elseif &ft =~ "ruby"
    let s:urlTemplate = "http://www.ruby-doc.org/core/classes/%.html"
  elseif &ft =~ "perl"
    let s:urlTemplate = "http://perldoc.perl.org/functions/%.html"
  elseif &ft =~ "javascript"
    let s:urlTemplate = "https://developer.mozilla.org/en-US/search?q=%"
  else
    return
  endif
  let s:browser = "\"D:\\Applications\\Mozilla Firefox\\firefox.exe\""
  let s:wordUnderCursor = expand("<cword>")
  let s:url = substitute(s:urlTemplate, "%", s:wordUnderCursor, "g")
  let s:cmd = "silent !start " . s:browser . " " . s:url
  execute s:cmd
endfunction
map <silent> <F2> :call OnlineDoc()<CR>

" backup and swap
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
