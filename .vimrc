filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'

Plugin 'comments.vim'
Plugin 'snipMate'


Plugin 'bronson/vim-trailing-whitespace'
Plugin 'jeetsukumaran/vim-buffergator'

Plugin 'Lokaltog/vim-powerline'

Plugin 'tpope/vim-surround'
Plugin 'mattn/emmet-vim'

Plugin 'terryma/vim-multiple-cursors'

" syntax
Plugin 'groenewege/vim-less'
Plugin 'othree/javascript-libraries-syntax.vim'
Plugin 'othree/yajs.vim'
Plugin 'othree/es.next.syntax.vim'
Plugin 'mxw/vim-jsx'
let g:jsx_ext_required = 0

" color schemas
Plugin 'mhartington/oceanic-next'
Plugin 'altercation/vim-colors-solarized'

Plugin 'kien/ctrlp.vim'
let g:ctrlp_custom_ignore = '\v[\/](\.git|\.hg|\.svn|node_modules|production|build)$'
map <Leader>e <c-p>

call vundle#end()

filetype plugin indent on
set expandtab
set autoindent
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
set noet ci pi sts=0 sw=4 ts=4
set autoread

" backup and swap
set backupdir=~/.vim/tmp/backup
set backup
set directory=~/.vim/tmp/swap

" hightlight
syntax enable
syntax on
set background=dark
set t_Co=256
set term=screen-256color
let g:solarized_termcolors=256
let g:airline_theme='oceanicnext'
colorscheme OceanicNext

hi Comment term=bold cterm=bold guibg=Grey40
hi CursorLine   cterm=NONE ctermbg=23
hi CursorColumn cterm=NONE ctermbg=23
nnoremap <Leader>c :set cursorline! cursorcolumn!<CR>

" spelling
autocmd BufRead,BufNewFile *.md setlocal spell
set complete+=kspell

set foldtext=CustomFoldText()
hi Folded term=NONE cterm=NONE gui=NONE

syn sync fromstart
syn sync maxlines=100

" custom settings
so ~/.vim/custom/maps.vim
so ~/.vim/custom/cyrillic-maps.vim
so ~/.vim/custom/functions.vim
