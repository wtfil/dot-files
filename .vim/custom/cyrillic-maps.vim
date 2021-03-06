" bind russian keyboard
function! BC(a, b)
    execute ":map ".a:a." ".a:b
    execute ":imap ".a:a." ".a:b
    execute ":noremap ".a:a." ".a:b
    execute ":map <c-".a:a."> <c-".a:b.">"
    execute ":imap <c-".a:a."> <c-".a:b.">"
    execute ":nmap <c-".a:a."> <c-".a:b.">"
endfunction

call BC('й', 'q')
call BC('ц', 'w')
call BC('у', 'e')
call BC('к', 'r')
call BC('е', 't')
call BC('н', 'y')
call BC('г', 'u')
call BC('ш', 'i')
call BC('щ', 'o')
call BC('з', 'p')
call BC('х', '[')
call BC('ъ', ']')
call BC('ф', 'a')
call BC('ы', 's')
call BC('в', 'd')
call BC('а', 'f')
call BC('п', 'g')
call BC('р', 'h')
call BC('о', 'j')
call BC('л', 'k')
call BC('д', 'l')
call BC('ж', ';')
call BC('э', "'")
call BC('я', 'z')
call BC('ч', 'x')
call BC('с', 'c')
call BC('м', 'v')
call BC('и', 'b')
call BC('т', 'n')
call BC('ь', 'm')
call BC('б', ',')
call BC('ю', '.')

call BC('Й', 'Q')
call BC('Ц', 'W')
call BC('У', 'E')
call BC('К', 'R')
call BC('Е', 'T')
call BC('Н', 'Y')
call BC('Г', 'U')
call BC('Ш', 'I')
call BC('Щ', 'O')
call BC('З', 'P')
call BC('Х', '[')
call BC('Ъ', ']')
call BC('Ф', 'A')
call BC('Ы', 'S')
call BC('В', 'D')
call BC('А', 'F')
call BC('П', 'G')
call BC('Р', 'H')
call BC('О', 'J')
call BC('Л', 'K')
call BC('Д', 'L')
call BC('Ж', ';')
call BC('Э', '"')
call BC('Я', 'Z')
call BC('Ч', 'X')
call BC('С', 'C')
call BC('М', 'V')
call BC('И', 'B')
call BC('Т', 'N')
call BC('Ь', 'M')
call BC('Б', '<')
call BC('Ю', '>')

"map ё `
"map й q
"map ц w
"map у e
"map к r
"map е t
"map н y
"map г u
"map ш i
"map щ o
"map з p
"map х [
"map ъ ]
"map ф a
"map ы s
"map в d
"map а f
"map п g
"map р h
"map о j
"map л k
"map д l
"map ж ;
"map э '
"map я z
"map ч x
"map с c
"map м v
"map и b
"map т n
"map ь m
"map б ,
"map ю .

"map Ё ~
"map Й Q
"map Ц W
"map У E
"map К R
"map Е T
"map Н Y
"map Г U
"map Ш I
"map Щ O
"map З P
"map Х {
"map Ъ }
"map Ф A
"map Ы S
"map В D
"map А F
"map П G
"map Р H
"map О J
"map Л K
"map Д L
"map Ж :
"map Э "
"map Я Z
"map Ч X
"map С C
"map М V
"map И B
"map Т N
"map Ь M
"map Б <
"map Ю >
"cmap ц w
"cmap цй qw
"cmap й q

