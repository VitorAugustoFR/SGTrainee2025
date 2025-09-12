clear
nNumeroUm   := 0
nNumeroDois := 0

@ 01,01 say "Digite dois valores para realizar as quatro operacoes:"
@ 02,01 say "Valor 1:"
@ 03,01 say "Valor 2:"

@ 02,09 get nNumeroUm
@ 03,09 get nNumeroDois
read

clear
@ 00,00 to 07,50
@ 01,01 say "As quatro operacoes basicas com o numero " + AllTrim(Str(nNumeroUm)) + " e " + AllTrim(Str(nNumeroDois)) + ":"
@ 03,01 say "Adicao:" + AllTrim(Str(nNumeroUm + nNumeroDois))
@ 04,01 say "Subtracao: " + AllTrim(Str(nNumeroUm - nNumeroDois))
@ 05,01 say "Multiplicacao: " + AllTrim(Str(nNumeroUm * nNumeroDois))
@ 06,01 say "divisao: " + AllTrim(Str(nNumeroUm / nNumeroDois))