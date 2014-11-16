filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'

Plugin 'comments.vim'
Plugin 'snipMate'
Plugin 'wincent/Command-T'
Plugin 'jeetsukumaran/vim-buffergator'
Plugin 'Lokaltog/vim-powerline'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'pangloss/vim-javascript'
Plugin 'mattn/emmet-vim'

" syntastic
Plugin 'scrooloose/syntastic'
let g:syntastic_always_populate_loc_list=1
let g:syntastic_javascript_checkers = ['jsxhint']
map <Leader>n :lnext<CR>

" color schemas
"Plugin 'ColorSamplerPack'
Plugin 'altercation/vim-colors-solarized'
Plugin 'wesgibbs/vim-irblack'
Plugin 'goatslacker/mango.vim'
Plugin 'Lokaltog/vim-distinguished'
Plugin 'nanotech/jellybeans.vim'

" fuzzy finder                                                                                                                                                                                                     
Plugin 'L9'                                                                                                                                                                                                        
Plugin 'FuzzyFinder'                                                                                                                                                                                               
map <Leader>e :FufCoverageFile<CR>                                                                                                                                                                                 
let g:fuf_coveragefile_exclude = '\v\~$|production|debian|lego|node_modules|18n|examples|\.(o|png|wiki|xml|exe|dll|bak|orig|swp)$|(^|[/\\])\.(hg|git|bzr)($|[/\\])' 

" nerd tree
Plugin 'scrooloose/nerdtree'
"map <Leader>t :NERDTreeFocus<CR>
"map <Leader>r :NERDTreeClose<CR>
map <Leader>t :NERDTreeToggle<CR>   

" expand-region
Plugin 'terryma/vim-expand-region'
map K <Plug>(expand_region_expand)
map L <Plug>(expand_region_shrink)

call vundle#end()


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
set guioptions=egt
if has("gui_running")
  map  <silent>  <S-Insert>  "+p
  imap <silent>  <S-Insert>  <Esc>"+pa
endif

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
colorscheme solarized

" custom settings
so ~/.vim/custom/maps.vim
so ~/.vim/custom/cyrillic-maps.vim
so ~/.vim/custom/functions.vim
