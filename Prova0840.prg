//VITOR AUGUSTO FARIA RAMALHO
set scoreBoard off
set message to 02 Center

//Variaveis
cPalavraSecreta := Space(15)
nTentativa      := 0
nMenuOpcoes     := 0
nLinha          := 3

do while .t.
    //Variaveis

    clear
    
    @ 01,00 to 05,79
    @ 00,34 say "JOGO TERMO"
    @ 01,32 say "MENU PRINCIPAL"
    @ 02,01 prompt "                                 [ JOGAR ]                                    "
    @ 03,01 prompt "                               [ CONFIGURAR ]                                 "
    @ 04,01 prompt "                                  [ SAIR ]                                    "
    menu to nOpcao
    
    if nOpcao == 1
        if Len(AllTrim(cPalavraSecreta)) == 0
            Alert("Termo ainda nao definido. Utilize a opcao 'Configurar'!")
        else 
            nMenuOpcoes := 1
        end if
    elseif nOpcao == 2
        nMenuOpcoes := 2
    elseif nOpcao == 3
        clear
        exit
    end if

    clear
    //Jogar
    do while nMenuOpcoes == 1
        //Variaveis
        cTentativaPlayer  := Space(Len(cPalavraSecreta))
        nLetraSecreta := 1
        nLetra        := 1
        nColuna       := 21

        @ 01,29 say "Termo: "
        @ 01,34 get cTentativaPlayer picture("@!") valid !Empty(cTentativaPlayer) .and. Len(AllTrim(cTentativaPlayer)) == Len(AllTrim(cPalavraSecreta))
        read

        do while nLetra <= Len(AllTrim(cTentativaPlayer))
            cCorLetra     := "W/N"
            cLetraAtual := SubStr(cTentativaPlayer,nLetra,1)

            do while nLetraSecreta <= Len(AllTrim(cPalavraSecreta))
                if cLetraAtual $ SubStr(cPalavraSecreta,nLetraSecreta,1)
                    cCorLetra := "B/N"
                    if nLetra == nLetraSecreta
                        cCorLetra := "G/N"
                    end if
                end if
                nLetraSecreta++
            enddo

            @ nLinha,nColuna say cLetraAtual color cCorLetra
            nColuna += 3
            nLetra++
        enddo
        
        nLinha += 2
        nTentativa++

        if cTentativaPlayer $ cPalavraSecreta
            Alert("Parabens, voce acertou!")
            exit
        end if 

        if nTentativa == 5
            Alert("Game Over!")
            nTentativa := 0
            nLinha := 3
            clear
            exit
        end if 

        if LastKey() == 27
            nOpcao1 :=  Alert("O que deseja fazer?", {"Contiuar", "Abandonar"}, "RB+/W+")
            if nOpcao1 == 1 
                
            elseif nOpcao1 == 2
                exit
            end if
        end if
    enddo

    //Configurar
    do while nMenuOpcoes == 2

        clear
        @ 01,29 say "Termo: "
        @ 01,34 get cPalavraSecreta picture("@!") valid !Empty(cPalavraSecreta) color "W/W"
        read

        if LastKey() == 27
            nOpcao2 :=  Alert("O que deseja fazer?", {"Contiuar", "Abandonar"}, "RB+/W+")
            if nOpcao2 == 1 
                loop
            elseif nOpcao2 == 2
                exit
            end if
        end if

        Alert("Termo inserido com sucesso!")
        exit
    enddo

enddo