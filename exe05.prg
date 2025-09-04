clear
nNumeroA := 5
nNumeroB := 6
nNumeroC := 0

@ 01,01 say "A variavel A vale antes da inversao: " + AllTrim(Str(nNumeroA))
@ 02,01 say "A variavel B vale antes da inversao: " + AllTrim(Str(nNumeroB))
if nNumeroA == 5
    nNumeroC := nNumeroB
    nNumeroB := nNumeroA
    nNumeroA := nNumeroC
end if
@ 04,01 say "Em um passe de magica a variavel A vale: " + AllTrim(Str(nNumeroA))
@ 05,01 say "E a variavel B agora vale: " + AllTrim(Str(nNumeroB))