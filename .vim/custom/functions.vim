" auto creating file
command! -nargs=* E call MkdirP(<f-args>)
function! MkdirP(file)
    call system('echo  '.a:file.' | sed -E "s/(.*)\/([^\/]+)/\1/" | xargs mkdir -p')
    execute ":e ".a:file
endfunction
