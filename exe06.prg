Clear
nNumeroUm := 0
nNumeroDois := 0
nNumeroTres := 0

@ 01,01 say "Digite suas notas:"
@ 02,01 say "Primeiro trimestre:"
@ 03,01 say "Segundo trimestre:"
@ 04,01 say "Terceiro trimestre:"

@ 02,20 get nNumeroUm
@ 03,19 get nNumeroDois
@ 04,20 get nNumeroTres
read
nMedia := (nNumeroUm + nNumeroDois + nNumeroTres) / 3
Clear
@ 01,01 say "A media dos numeros " + AllTrim(Str(nNumeroUm)) + ", " + AllTrim(Str(nNumeroDois)) + ", " + AllTrim(Str(nNumeroTres)) + " e:"
@ 02,13 say AllTrim(Str(nMedia))