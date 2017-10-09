filetype off
set runtimepath+=~/.vim/bundles/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.vim/bundles')
    call dein#begin('~/.vim/bundles')

    call dein#add('scrooloose/nerdcommenter')
    call dein#add('vim-syntastic/syntastic')
    call dein#add('Lokaltog/vim-powerline')
    call dein#add('tpope/vim-sleuth')
    call dein#add('bronson/vim-trailing-whitespace')
    call dein#add('jeetsukumaran/vim-buffergator')
    call dein#add('ctrlpvim/ctrlp.vim')
    call dein#add('x1024/vim-cyrillic')

    call dein#add('tpope/vim-surround')
    call dein#add('mattn/emmet-vim')

    call dein#add('terryma/vim-multiple-cursors')

    call dein#add('groenewege/vim-less')
    call dein#add('othree/javascript-libraries-syntax.vim')
    call dein#add('othree/yajs.vim')
    call dein#add('othree/es.next.syntax.vim')
    call dein#add('othree/csscomplete.vim')
    call dein#add('mxw/vim-jsx')
    call dein#add('leafgarland/typescript-vim')

    call dein#add('Quramy/tsuquyomi', {'lazy': 1})

    call dein#add('flazz/vim-colorschemes')
    call dein#add('altercation/vim-colors-solarized')

    call dein#end()
    call dein#save_state()
endif

filetype plugin indent on
syntax enable

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
syn sync fromstart
syn sync maxlines=100
let g:mapleader="\\"
let g:netrw_banner=0

" backup and swap
set backupdir=~/.vim/tmp/backup
set backup
set directory=~/.vim/tmp/swap

" hightlight
syntax on
set background=dark
set t_Co=256
"set term=screen-256color
"let g:solarized_termcolors=256
let g:airline_theme='solarized'
try
	colorscheme solarized
catch
	colorscheme desert
endtry

" custom settings
so ~/.vim/custom/maps.vim
so ~/.vim/custom/cyrillic-maps.vim
so ~/.vim/custom/functions.vim

" ------------------------------ PLUGINS SETUP -----------------------------

" cursor line and column
hi CursorLine   cterm=NONE ctermbg=23
hi CursorColumn cterm=NONE ctermbg=23
nnoremap <Leader>l :set cursorline! cursorcolumn!<CR>

" folding
set foldtext=CustomFoldText()
hi Folded term=NONE cterm=NONE gui=NONE

" typescipt-vim
let g:jsx_ext_required = 0
autocmd QuickFixCmdPost [^l]* nested cwindow
autocmd QuickFixCmdPost    l* nested lwindow

" tsuquyomi
let g:tsuquyomi_completion_detail = 1
set completeopt=longest,menuone
set omnifunc=tsuquyomi#complete

" ctrlp.vim
let g:ctrlp_custom_ignore = '\v[\/](\.git|\.hg|\.svn|node_modules|production|build|dist|coverage)$'
map <Leader>e <c-p>

" csscomplete.vim
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS noci

" emmet-vim
let g:user_emmet_settings = {
    \  'typescript' : {
    \    "extends": "jsx",
	\    "empty_element_suffix": "${cursor}/>",
    \    "quote_char": "'"
    \  },
    \}

" syntastic
if exists("*SyntasticStatuslineFlag")
	set statusline+=%#warningmsg#
	set statusline+=%{SyntasticStatuslineFlag()}
	set statusline+=%*
	let g:syntastic_always_populate_loc_list = 1
	let g:syntastic_auto_loc_list = 1
	let g:syntastic_check_on_open = 1
	let g:syntastic_check_on_wq = 0
endif

if has("gui_running")
    set noeb vb t_vb=
    au GUIEnter * set vb t_vb=
    map  <silent>  <S-Insert>  "+p
    imap <silent> <S-Insert> <ESC>"+pa
    set guifont=consolas:h12
    au GUIEnter * simalt ~x
    set guioptions=
endif
