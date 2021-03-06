filetype off
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.cache/dein')
    call dein#begin('~/.cache/dein')
    call dein#add('~/.cache/dein/repos/github.com/Shougo/dein.vim')
    call dein#add('Shougo/deoplete.nvim')

    call dein#add('scrooloose/nerdcommenter')
    call dein#add('Lokaltog/vim-powerline')
    call dein#add('tpope/vim-sleuth')
    call dein#add('bronson/vim-trailing-whitespace')
    call dein#add('jeetsukumaran/vim-buffergator')
    call dein#add('ctrlpvim/ctrlp.vim')

    call dein#add('groenewege/vim-less')
    call dein#add('othree/javascript-libraries-syntax.vim')
    call dein#add('othree/yajs.vim')
    call dein#add('othree/es.next.syntax.vim')
    call dein#add('othree/csscomplete.vim')
    call dein#add('mxw/vim-jsx')
    call dein#add('HerringtonDarkholme/yats.vim')

    "call dein#add('neoclide/coc.nvim', {'merged':0, 'rev': 'release'})

    if has('nvim')
        call dein#add('mhartington/nvim-typescript', {'build': './install.sh'})
        call dein#add('Shougo/deoplete.nvim')
        call dein#add('Shougo/denite.nvim')
    else
        call dein#add('roxma/nvim-yarp')
        call dein#add('roxma/vim-hug-neovim-rpc')
    	call dein#add('Quramy/tsuquyomi', {'lazy': 1})
    endif


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

if has('nvim')
    set directory=~/.config/nvim/tmp/swap
    so ~/.config/nvim/custom/maps.vim
    so ~/.config/nvim/custom/cyrillic-maps.vim
    so ~/.config/nvim/custom/functions.vim
else
    set backup
    set backupdir=~/.vim/tmp/backup
    set directory=~/.vim//tmp/swap
    so ~/.vim/custom/maps.vim
    so ~/.vim/custom/cyrillic-maps.vim
    so ~/.vim/custom/functions.vim
endif

" hightlight
syntax on
set background=dark
set t_Co=256
let g:airline_theme='solarized'
try
    colorscheme OceanicNext
catch
    colorscheme desert
endtry

if has("gui_running")
    set noeb vb t_vb=
    au GUIEnter * set vb t_vb=
    map  <silent>  <S-Insert>  "+p
    imap <silent> <S-Insert> <ESC>"+pa
    set guifont=consolas:h12
    au GUIEnter * simalt ~x
    set guioptions=
endif

" completion
set completeopt=menu,noinsert
inoremap <expr> <c-j> pumvisible() ? "\<C-N>" : "j"
inoremap <expr> <c-k> pumvisible() ? "\<C-P>" : "k"

augroup SyntaxSettings
    autocmd!
    autocmd BufNewFile,BufRead *.tsx set filetype=typescript
augroup END

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
"set completeopt=longest,menuone
set omnifunc=tsuquyomi#complete

" deoplete
let g:deoplete#enable_at_startup = 1

" vim-typescript
let g:typescript_indent_disable = 1


" ctrlp.vim
let g:ctrlp_custom_ignore = '\v[\/](\.git|\.hg|\.svn|node_modules|production|build|dist|coverage)$'
map <Leader>e <c-p>

" csscomplete.vim
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS noci

" nerdcommenter
let g:NERDCreateDefaultMappings = 0
let g:NERDCompactSexyComs = 0
map <Leader>cc <plug>NERDCommenterToggle

" nvim-typescript
noremap <Leader>d :TSDefPreview<CR>
noremap <Leader>f :TSGetDiagnostics<CR>
