clear
nNumeroA := 0
nNumeroB := 0
nNumeroC := 0

@ 01,01 say "Digite 2 numeros para invertelos na memoria:"
@ 02,01 say "Primeiro numero:"
@ 03,01 say "Segundo numero:"

@ 02,18 get nNumeroA
@ 03,16 get nNumeroB
read

clear
@ 01,01 say "A variavel A vale antes da inversao: " + AllTrim(Str(nNumeroA))
@ 02,01 say "A variavel B vale antes da inversao: " + AllTrim(Str(nNumeroB))
nNumeroC := nNumeroB
nNumeroB := nNumeroA
nNumeroA := nNumeroC

@ 04,01 say "Em um passe de magica a variavel A vale: " + AllTrim(Str(nNumeroA))
@ 05,01 say "E a variavel B agora vale: " + AllTrim(Str(nNumeroB))