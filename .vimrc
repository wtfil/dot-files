syntax on
filetype plugin indent on
set shiftwidth=4
set expandtab
set autoindent
set softtabstop=4
set tabstop=4
set foldmethod=indent
set encoding=utf-8
set nocompatible
set fileencodings=utf-8,cp1251,cp866
set tags+=~/.tags
set tags+=./tags
set ruler 
set laststatus=2
set nowrap
set wildmode=longest:full
set wildmenu
set so=7
set backspace=indent,eol,start
" reload vimrc
map <F5> :so ~/.vimrc<cr>
" usefull keys
map <space> i<space><esc>l
map <c-h> hdl
map <c-o> i<CR><ESC>k$l
map  <c-p> o<ESC>p
imap <c-o> <ESC>o
imap <c-v> <ESC>lv
imap <c-u> <ESC>
imap <c-c> <ESC>lc
imap <c-d> <ESC>cl
imap <c-s-o> <ESC>O
imap <c-p> <ESC>pi
imap <c-h> <Left>
imap <c-l> <Right>
imap <c-j> <ESC>ja
imap <c-k> <ESC>ka
imap <c-w> <ESC>lwi
imap <c-b> <ESC>lbi
imap <c-u> <ESC>uli
imap <c-r> <ESC>$i
imap <c-c><c-w> <ESC>lciw
map <c-f> 10j
map F 10k
map <Leader>q :1,100bd<CR>

" auto creating file
command! -nargs=* E call MkdirP(<f-args>)
function! MkdirP(file)
    call system('echo  '.a:file.' | sed -E "s/(.*)\/([^\/]+)/\1/" | xargs mkdir -p')
    execute ":e ".a:file
endfunction

" making () and {}
function! Brackets(addition)
  let ln = line(".")
  let cn = col(".")
  let fullLine =  getline(ln)
  let before = strpart(fullLine, 0, cn) 
  let after = strpart(fullLine, cn, 999)
  if &ft == 'javascript'
    let operators2way = '\(if\|function\|for\|while\)'
    let operators1way = '\(else\|return\|=\|,\|:\|)\)'
    if before =~ operators2way.'[ ]*$'
      let command = "a ()\<esc>h"
    elseif before =~ operators2way.' ('
      if a:addition
        let command = "t)la {}.bind(this)\<esc>11hi\<cr>\<esc>O\<tab>"
      else 
        let command = "t)la {}\<esc>i\<cr>\<esc>O\<tab>"
      endif
    elseif before =~ operators1way.'[ ]*$'
      let command = "a {}\<esc>i\<cr>\<esc>O\<tab>"
    else
      let command = "a()\<esc>i"
    endif
  elseif &ft == 'css'
    let command = "o{}\<esc>i\<cr>\<esc>O"
  endif
  exe "normal" command
endfunction
imap <c-f> <ESC>:call Brackets(0)<cr>a
imap <c-e> <ESC>:call Brackets(1)<cr>a

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
cmap ц w
cmap цй qw
cmap й q

" bundle
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'

Bundle 'L9'
Bundle 'comments.vim'
Bundle 'snipMate'
" non github repos
Bundle 'git://git.wincent.com/command-t.git'
"Bundle 'https://github.com/jelera/vim-javascript-syntax.git'
Bundle 'https://github.com/jeetsukumaran/vim-buffergator.git'
filetype plugin indent on

" intents
Bundle 'https://github.com/pangloss/vim-javascript.git'

" syntastic
Bundle 'scrooloose/syntastic'
let g:syntastic_always_populate_loc_list=1
map <Leader>n :lnext<CR>

" fuzzy finder
Bundle 'FuzzyFinder'
map <Leader>e :FufCoverageFile<CR>
let g:fuf_coveragefile_exclude = '\v\~$|debian|lego|node_modules|18n|examples|\.(o|png|wiki|xml|exe|dll|bak|orig|swp)$|(^|[/\\])\.(hg|git|bzr)($|[/\\])'

" nerd tree
Bundle 'https://github.com/scrooloose/nerdtree.git'
hi Directory term=standout cterm=standout ctermfg=0 ctermbg=6
map <Leader>t :NERDTreeFocus<CR>
map <Leader>r :NERDTreeClose<CR>

" expand-region
Bundle 'https://github.com/terryma/vim-expand-region.git'
map K <Plug>(expand_region_expand)
map L <Plug>(expand_region_shrink)

" css syntax
Bundle 'https://github.com/groenewege/vim-less.git'

filetype plugin on
runtime! ftplugin/man.vim
noremap <F4> :set hlsearch! hlsearch?<CR>
hi Comment term=standout cterm=standout ctermfg=0 guifg=DarkGrey ctermbg=6
hi LineNr term=bold ctermfg=7 ctermbg=0
hi CursorLine   cterm=NONE ctermbg=magenta ctermfg=white guibg=darkred guifg=white 
if &term =~ "screen"
  hi String ctermfg=2
  hi Pmenu ctermbg=5 ctermfg=7
  hi PmenuSel ctermbg=7
else
  set t_Co=256
  hi String ctermfg=48
  hi PmenuSel ctermbg=246
  hi Pmenu ctermfg=255 ctermbg=92
endif
