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


" js folding                                                                   
"set foldmethod=indent                                                          
"function! JavaScriptFold()                                                     
    "setl foldmethod=syntax                                                     
    "setl foldlevelstart=1                                                      
    "syn region foldBraces start=/{/ end=/}/ transparent fold keepend extend    
    ""syn region foldJavadoc start=,/\*\*, end=,\*/, transparent fold keepend extend
                                                                               
    "function! FoldText()                                                       
        "return substitute(getline(v:foldstart), '{.*', '{...}', '')            
    "endfunction                                                                
    "setl foldtext=FoldText()                                                   
"endfunction                                                                    
"au FileType javascript call JavaScriptFold()                                   
"au FileType javascript setl fen                                                
"highlight Folded ctermbg=none ctermfg=7 cterm=bold  
"autocmd FileType javascript :set fmr=/**,*/ fdm=marker fdc=1
