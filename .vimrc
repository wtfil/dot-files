set nocompatible
filetype off

" load plugins
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'

Plugin 'comments.vim'
Plugin 'snipMate'
Plugin 'mattn/emmet-vim'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'tpope/vim-sleuth'

" quick search
Plugin 'kien/ctrlp.vim'
let g:ctrlp_custom_ignore = '\v[\/](\.git|\.hg|\.svn|node_modules|production|build)$'
map <Leader>e <c-p>

" syntax
Plugin 'othree/javascript-libraries-syntax.vim'
Plugin 'othree/yajs.vim'
Plugin 'othree/es.next.syntax.vim'
Plugin 'mxw/vim-jsx'
let g:jsx_ext_required = 0

" colorschemas
Plugin 'mhartington/oceanic-next'
Plugin 'altercation/vim-colors-solarized'

call vundle#end()

set nowrap
set autoindent
set nofoldenable
set encoding=utf-8
set fileencodings=utf-8,cp1251,cp866
set backspace=indent,eol,start
set sw=2 ts=2 sts=2
set so=7
set wildmenu
set ruler
set laststatus=2
" pab completion
set wildmode=longest:full
set wildignore+=*.o,*.obj,.git,*.rbc
" diable beem
set noeb vb t_vb=

" backup and swap
set backupdir=~/.vim/tmp/backup
set backup
set directory=~/.vim/tmp/swap

if !has("gui_running")
	" scroll with mouse in terminal
	set mouse=a
	inoremap <Esc>[62~ <C-X><C-E>
	inoremap <Esc>[63~ <C-X><C-Y>
	nnoremap <Esc>[62~ <C-E>
	nnoremap <Esc>[63~ <C-Y>
else
	" gui options
	map  <silent>  <S-Insert>  "+p
	imap <silent>  <S-Insert>  <Esc>"+pa
	set guifont=Monaco:h10
	set guioptions-=m
	set guioptions-=f
	set guioptions-=r
	set guioptions-=R
	set guioptions-=l
	set guioptions-=L
	set guioptions-=b
	set guioptions-=T
	set guioptions-=f
	set guioptions-=e

endif

" hightlight cursoet noeb vb t_vb=
hi CursorLine   cterm=NONE ctermbg=23
hi CursorColumn cterm=NONE ctermbg=23
nnoremap <Leader>c :set cursorline! cursorcolumn!<CR>

" w!! saves file under sudo
cmap w!! w !sudo tee % >/dev/null

" hightlight
syntax enable
if has("gui_running")
else
	set term=xterm
	set t_Co=256
	let &t_AB="\e[48;5;%dm"
	let &t_AF="\e[38;5;%dm"
	inoremap <Char-0x07F> <BS>
	nnoremap <Char-0x07F> <BS>
endif
if (has("termguicolors"))
	set termguicolors
endif
colorscheme OceanicNext

" turn off hightlight for projector
function Pres ()
	:colorscheme OceanicNextLight
	:syntax off
endfunction
map <F6> :call Pres()<CR>

" custom settings
so ~/.vim/custom/maps.vim
so ~/.vim/custom/cyrillic-maps.vim
