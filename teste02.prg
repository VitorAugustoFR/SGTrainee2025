set epoch to 1940
set date british

clear
dNascimento := CToD("")
@ 01,01 get dNascimento
read

nIdade := (date() - dNascimento)/365

@ 05,05 say "Idade: " + AllTrim(Str(nIdade))