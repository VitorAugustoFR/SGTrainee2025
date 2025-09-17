nLinha := 1
nRepeteFinal := 0
nQuantidadeNome := 1
nColuna := 1
cNome := Space(15)

clear
@ 01,01 say "Insira seu nome para repetir: "
@ 02,01 say "Insira a quantidade de vezes que deseja repetir: "

@ 01,31 get cNome valid !Empty(cNome)
@ 02,50 get nRepeteFinal valid !Empty(nRepeteFinal)
read

clear
do while nQuantidadeNome <= nRepeteFinal
    @ nLinha,nColuna say AllTrim(Str(nQuantidadeNome)) + " - " + AllTrim(cNome)
    nQuantidadeNome++
    nLinha++
    if nLinha >= 24
        nColuna += 20
        nLinha := 1
    elseif nColuna >= 59
        inkey(0)
        clear
        nColuna := 1
        nLinha := 1
    end if
end do