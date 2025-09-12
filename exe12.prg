nNumeroUm := 0
nNumeroDois := 0
nNumeroTres := 0
nMaiorNumero := 0

clear

@ 01,01 say "Digite tres numeros inteiros para checar qual o maior:"

@ 02,01 get nNumeroUm
@ 03,01 get nNumeroDois
@ 04,01 get nNumeroTres
read

nMaiorNumero := nNumeroUm

if nNumeroDois > nNumeroTres
    nMaiorNumero := nNumeroDois
end if

if nNumeroTres > nNumeroUm
    nMaiorNumero := nNumeroTres
end if

clear
@ 01,01 say "O Maior numero e " + AllTrim(Str(nMaiorNumero))