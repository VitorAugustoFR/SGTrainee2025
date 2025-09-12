set date brit
set epoch to 1940

cNome := Space(50)
cCategoria := Space(10)
cCor := Space(3)
dNascimento := CToD("")

clear

@ 01,01 say "Digite o nome do(a) nadador(a): "
@ 02,01 say "Digite a data de nascimento: "

@ 01,33 get cNome valid !Empty(cNome)
@ 02,30 get dNascimento valid !Empty (dNascimento)
read

nIdade := (Date() - dNascimento) / 365

if nIdade >= 5 .or. nIdade <= 7
    cCategoria :="Infantil A"
    cCor := "W/B"
elseif nIdade >= 8 .or. nIdade <= 10
    cCategoria := "Infantil B"
    cCor := "W/B"
elseif nIdade >= 11 .or. nIdade <= 13
    cCategoria := "Juvenil A"
    cCor := "W/G"
elseif nIdade >= 14 .or. nIdade <= 17
    cCategoria := "Juvenil B"
    cCor := "W/G"
elseif nIdade >= 18
    cCategoria := "Senior"
    cCor := "W/R"
else
    cCategoria := "Nenhuma"
    cCor := "W/W"
end if

clear
@ 01,01 say cCategoria + " = " + Transform(nIdade, "@E 999") Color cCor

