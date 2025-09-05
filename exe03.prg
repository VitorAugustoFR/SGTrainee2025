clear
nNumeroUm := 0
nNumeroDois := 0

@ 01,01 say "Digite o primeiro numero:"
@ 02,01 say "Digite o segundo numero:"

@ 01,27 get nNumeroUm
@ 02,25 get nNumeroDois
read

nProduto := nNumeroUm * nNumeroDois

@ 05,01 say "O produto dos numeros " + AllTrim(Str(nNumeroUm)) + " * " + AllTrim(Str(nNumeroDois)) + " = " + AllTrim(Str(nProduto))  

//@ 01,01 say "O numero: " + AllTrim(Str(nNumeroUm)) + ", Multiplicado pelo numero: " + AllTrim(Str(nNumeroDois)) + ", e igual a: " + AllTrim(Str(nProduto))