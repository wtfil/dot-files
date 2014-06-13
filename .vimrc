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

" backup and swap
set backupdir=~/.vim/tmp/backup
set backup
set directory=~/.vim/tmp/swap

" bundle
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'

Plugin 'comments.vim'
Plugin 'snipMate'
Plugin 'wincent/Command-T'
Plugin 'jeetsukumaran/vim-buffergator'

filetype plugin indent on

" syntastic
Plugin 'scrooloose/syntastic'
let g:syntastic_always_populate_loc_list=1
let g:syntastic_javascript_checkers = ['jsxhint']
map <Leader>n :lnext<CR>

" fuzzy finder
" TODO fix fuzzy finder
"Plugin 'FuzzyFinder'
"map <Leader>e :FufCoverageFile<CR>
"let g:fuf_coveragefile_exclude = '\v\~$|debian|lego|node_modules|18n|examples|\.(o|png|wiki|xml|exe|dll|bak|orig|swp)$|(^|[/\\])\.(hg|git|bzr)($|[/\\])'

" nerd tree
Plugin 'scrooloose/nerdtree'
hi Directory term=standout cterm=standout ctermfg=0 ctermbg=6
map <Leader>t :NERDTreeFocus<CR>
map <Leader>r :NERDTreeClose<CR>

" expand-region
Plugin 'terryma/vim-expand-region'
map K <Plug>(expand_region_expand)
map L <Plug>(expand_region_shrink)


" custom settings
so ~/.vim/custom/highlight.vim
so ~/.vim/custom/maps.vim
so ~/.vim/custom/cyrillic-maps.vim
so ~/.vim/custom/functions.vim
