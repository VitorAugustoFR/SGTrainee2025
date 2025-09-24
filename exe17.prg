set scoreBoard off

do while .t.
    clear
    cPalavra := Space(50)

    @ 00,00 to 24,79
    @ 01,01 say "Insira uma palavra para inverter:"
    @ 01,34 get cPalavra valid !Empty(cPalavra)
    read

    if LastKey() == 27
        nOpcao := Alert("Deseja Sair?", {"Sim","Nao"})
        if nOpcao == 1
            exit
        elseif nOpcao == 2
            loop
        end if
    end if
    Inkey(0)

    nTamanhoPalavra := Len(AllTrim(cPalavra))
    cPalavraInvertida := ""

    do while nTamanhoPalavra > 0
        cPalavraInvertida += SubStr(cPalavra, nTamanhoPalavra--, 1)
    enddo

    @ 05,01 say "Palavra: " + cPalavra
    @ 06,01 say "Palavra Invertida: " + AllTrim(cPalavraInvertida)

    if LastKey() == 27
        nOpcao2 := Alert("Deseja Sair?", {"Sim","Nao"})
        if nOpcao2 == 1
            exit
        elseif nOpcao2 == 2
            loop
        end if
    end if
    Inkey(0)
end do