//Vitor Augusto Faria Ramalho
set date british
set epoch to 1940
set scoreBoard off

//variaveis "Fixas"
cVerificacaoMaiusculo := "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
cVerificacaoNumerica  := "1234567890"
cVerificacaoSimbolos  := "!@#$%¨&*()_+=-`{´~^:;?/>.<,|\¹²³£¢¬§ªº°₢ }"
cTodosOsIds           := ""
cTodasAsDatas         := ""
cTodasAsDescricoes    := ""
cTodasAsQuantidades   := ""

do while .t.
    clear

    nMenu := 0
    nID   := 0

    //Menu Principal
    @ 00,00 to 08,79

    @ 00,32 say "MENU PRINCIPAL"
    @ 01,29 say "1- Cadastrar produto"
    @ 02,29 say "2- Consultar produto"
    @ 03,29 say "3- Deletar produto"
    @ 04,29 say "4- Entrada de produto"
    @ 05,29 say "5- Saida de produto"
    @ 06,29 say "6- Sair do Programa"
    @ 07,15 say "Digite o numero da opcao que deseja acessar: "

    @ 07,60 get nMenu picture("9") valid nMenu <= 8 .and. nMenu >= 1 
    read
    
    if LastKey() == 27
        nOpcao :=  Alert("O que deseja fazer?", {"Sair", "Continuar"}, "RB+/W+")
        if nOpcao == 1 
            exit
        elseif nOpcao == 2
            
        end if
    end if
    
    //Cadatrar Produto
    do while nMenu == 1
        clear

        //Variaveis
        //validacoes
        nCaracterAtual    := 0
        nCaracterLetra    := 0
        nCaracterNumerico := 0
        cVerificaCaracter := ""
        //Informacoes
        cId               := Space(8)
        cDescricao        := Space(30)
        nQuantidade       := 0
        dCadastro         := date()

        //Insercao de dados
        @ 00,00 to 04,79

        @ 00,31 say "CADASTRAR PRODUTO"
        @ 01,01 say "Digite o ID do produto........: "
        @ 02,01 say "Digite a descricao do produto.: "
        @ 03,01 say "Digite a quantidade do produto: "
        @ 04,01 say "Digite a data do produto......: "
        
        @ 01,32 get cId         picture("@!")       valid Len(cId) == 8 .and. !(cId $ cVerificacaoSimbolos)
        read
        //verificacao
        if cId $ cTodosOsIds
            Alert("Produto ja cadastrado, Insira um novo ID de usuario",{"ok"})
            loop
        end if

        do while nCaracterAtual <= 8
            cVerificaCaracter := SubStr(cId,nCaracterAtual,1)
            if cVerificaCaracter $ cVerificacaoNumerica
                nCaracterNumerico++
            end if
            if cVerificaCaracter $ cVerificacaoMaiusculo
                nCaracterLetra++
            end if
            nCaracterAtual++
        enddo

        if nCaracterLetra < 2 .or. nCaracterNumerico < 4
            Alert("O ID precisa ter pelomenos 2 letras e 4 numeros")
            loop
        end if

        @ 02,32 get cDescricao  picture("@!")       valid !Empty(cDescricao)
        @ 03,32 get nQuantidade picture("@E 9,999") valid !Empty(nQuantidade)
        @ 04,32 get dCadastro                       valid !Empty(dCadastro)
        read

        if LastKey() == 27
            nOpcao :=  Alert("O que deseja fazer?", {"Sair", "Continuar"}, "RB+/W+")
            if nOpcao == 1 
                exit
            elseif nOpcao == 2

            end if
        end if


        //Adicao a "array"
        cTodosOsIds         += cId
        cTodasAsDatas       += DToC(dCadastro)
        cTodasAsDescricoes  += cDescricao
        cTodasAsQuantidades += Str(nQuantidade)

        Alert("Produto cadastrado com sucesso")
        exit
    enddo

    //Consultar Produto
    do while nMenu == 2
        clear
        
        cIdConsulta           := Space(8)
        cIdConsultado         := ""
        cDescricaoConsultada  := ""
        cQuantidadeConsultada := ""
        cDataConsultada       := ""
        nConsulta             := 1
        
        @ 00,00 to 03,79

        @ 00,31 say "CONSULTAR PRODUTO"
        @ 01,01 say "qual o ID do produto que deseja consultar?"
        @ 02,01 get cIdConsulta picture("@!")
        read

        if LastKey() == 27
            nOpcao :=  Alert("O que deseja fazer?", {"Sair", "Continuar"}, "RB+/W+")
            if nOpcao == 1 
                exit
            elseif nOpcao == 2

            end if
        end if
    
        //Checando se o id existe
        if !(cIdConsulta $ cTodosOsIds)
            Alert("Produto nao cadastrado!")
            loop
        end if

        //Procurando posicao do id
        do while !(cIdConsulta $ cTodosOsIds)
            cIdConsultado     := SubStr(cTodosOsIds, nConsulta, 8)
            nConsulta += 8
        enddo
        nConsulta -= 1
        nConsulta /= 8
        cIdConsultado         := SubStr(cTodosOsIds, nConsulta, 8)
        cDescricaoConsultada  := SubStr(cTodasAsDescricoes, nConsulta, 30)    
        cQuantidadeConsultada := SubStr(cTodasAsQuantidades, nConsulta, 4)
        cDataConsultada       := SubStr(cTodasAsDatas, nConsulta, 8)

        //Iprimindo resultado
        clear
        @ 00,00 to 07,79
        @ 00,31 say "DADOS DO PRODUTO"
        @ 01,01 say "ID..............: " + cIdConsultado
        @ 02,01 say "DESCRICAO.......: " + cDescricaoConsultada
        @ 03,01 say "QUANTIDADE......: " + cQuantidadeConsultada
        @ 04,01 say "DATA DE CADASTRO: " + cDataConsultada

        @ 06,01 say "PRESSIONE QUALQUER TECLA PARA VOLTAR"
        inkey(0)
        exit
    enddo

    //Deletar Produto
    do while nMenu == 3
        clear
        
        cIdConsulta           := Space(8)
        cIdConsultado         := ""
        cDataConsultada       := ""
        nConsulta             := 1
        
        @ 00,00 to 03,79

        @ 00,31 say "DELETAR PRODUTO"
        @ 01,01 say "qual o ID do produto que deseja deletar?"
        @ 02,01 get cIdConsulta picture("@!")
        read

        if LastKey() == 27
            nOpcao :=  Alert("O que deseja fazer?", {"Sair", "Continuar"}, "RB+/W+")
            if nOpcao == 1 
                exit
            elseif nOpcao == 2

            end if
        end if
    
        //Checando se o id existe
        if !(cIdConsulta $ cTodosOsIds)
            Alert("Produto nao cadastrado!")
            loop
        end if

        //Procurando posicao do id
        do while !(cIdConsulta $ cTodosOsIds)
            cIdConsultado     := SubStr(cTodosOsIds, nConsulta, 8)
            nConsulta += 8
        enddo
        nConsulta -= 1
        nConsulta /= 8
        //deletando o Id e seus dados
        cTodosOsIds         := SubStr(cTodosOsIds, 1, nConsulta * 8) + SubStr(cTodosOsIds, (nConsulta * 8 + 8), (Len(cTodosOsIds) - (nConsulta * 8) - 8))
        cTodasAsDescricoes  := SubStr(cTodasAsDescricoes, 1, nConsulta * 30) + SubStr(cTodasAsDescricoes, (nConsulta * 30 + 30), (Len(cTodasAsDescricoes) - (nConsulta * 30) - 30))
        cTodasAsQuantidades := SubStr(cTodasAsQuantidades, 1, nConsulta * 4) + SubStr(cTodasAsQuantidades, (nConsulta * 4 + 4), (Len(cTodasAsQuantidades) - (nConsulta * 4) - 4))
        cTodasAsDatas       := SubStr(cTodasAsDatas, 1, nConsulta * 8) + SubStr(cTodasAsDatas, (nConsulta * 8 + 8), (Len(cTodasAsDatas) - (nConsulta * 8) - 8))

        Alert("Produto Deletado com sucesso!")
        exit
    enddo

    //Entrada de Produto
    do while nMenu == 4
        clear
        
        cIdConsulta           := Space(8)
        cIdConsultado         := ""
        cQuantidadeConsultada := ""
        cDataConsultada       := ""
        nAdicaoDeEntrada      := 0
        dNovaDataDeEntrada    := Date()
        nConsulta             := 1
        
        @ 00,00 to 03,79

        @ 00,31 say "ADICIONAR PRODUTO"
        @ 01,01 say "qual o ID do produto que deseja adicionar entrada?"
        @ 02,01 get cIdConsulta picture("@!")
        read

        if LastKey() == 27
            nOpcao :=  Alert("O que deseja fazer?", {"Sair", "Continuar"}, "RB+/W+")
            if nOpcao == 1 
                exit
            elseif nOpcao == 2

            end if
        end if
    
        //Checando se o id existe
        if !(cIdConsulta $ cTodosOsIds)
            Alert("Produto nao cadastrado!")
            loop
        end if

        //Procurando posicao do id
        do while !(cIdConsulta $ cTodosOsIds)
            cIdConsultado     := SubStr(cTodosOsIds, nConsulta, 8)
            nConsulta += 8
        enddo
        nConsulta -= 1
        nConsulta /= 8

        //Pegando os dados
        cQuantidadeConsultada := SubStr(cTodasAsQuantidades, nConsulta, 4)
        cDataConsultada       := SubStr(cTodasAsDatas, 1, nConsulta * 8)

        @ 04,01 say "Quanto voce deseja adicionar? "
        @ 05,01 say "Atualize a data de entrada..: "

        @ 04,30 get nAdicaoDeEntrada picture("@E 9,999") valid !Empty(nAdicaoDeEntrada)
        @ 05,30 get dNovaDataDeEntrada                   valid dNovaDataDeEntrada > CToD(cDataConsultada)
        read

        nAdicaoDeEntrada += Val(cQuantidadeConsultada)

        //Deletando os dados antigos
        cTodasAsQuantidades := SubStr(cTodasAsQuantidades, 1, nConsulta * 4) + Str(nAdicaoDeEntrada) + SubStr(cTodasAsQuantidades, (nConsulta * 4 + 4), (Len(cTodasAsQuantidades) - (nConsulta * 4) - 4))
        cTodasAsDatas       := SubStr(cTodasAsDatas, 1, nConsulta * 8) + DToC(dNovaDataDeEntrada) + SubStr(cTodasAsDatas, (nConsulta * 8 + 8), (Len(cTodasAsDatas) - (nConsulta * 8) - 8))
        
        Alert("Produto atualizado com sucesso")
        exit
    enddo

    //Saida de Produto
    do while nMenu == 5
        clear
        
        cIdConsulta           := Space(8)
        cIdConsultado         := ""
        cQuantidadeConsultada := ""
        cDataConsultada       := ""
        nAdicaoDeEntrada      := 0
        dNovaDataDeEntrada    := Date()
        nConsulta             := 1
        
        @ 00,00 to 03,79

        @ 00,31 say "SAIDA PRODUTO"
        @ 01,01 say "qual o ID do produto que deseja registrar saida?"
        @ 02,01 get cIdConsulta picture("@!")
        read

        if LastKey() == 27
            nOpcao :=  Alert("O que deseja fazer?", {"Sair", "Continuar"}, "RB+/W+")
            if nOpcao == 1 
                exit
            elseif nOpcao == 2

            end if
        end if
    
        //Checando se o id existe
        if !(cIdConsulta $ cTodosOsIds)
            Alert("Produto nao cadastrado!")
            loop
        end if

        //Procurando posicao do id
        do while !(cIdConsulta $ cTodosOsIds)
            cIdConsultado     := SubStr(cTodosOsIds, nConsulta, 8)
            nConsulta += 8
        enddo
        nConsulta -= 1
        nConsulta /= 8

        //Pegando os dados
        cQuantidadeConsultada := SubStr(cTodasAsQuantidades, nConsulta, 4)
        cDataConsultada       := SubStr(cTodasAsDatas, 1, nConsulta * 8)

        @ 04,01 say "Quanto voce deseja retirar? "
        @ 05,01 say "Atualize a data de entrada..: "

        @ 04,30 get nAdicaoDeEntrada picture("@E 9,999") valid !(nAdicaoDeEntrada > Val(cQuantidadeConsultada))
        @ 05,30 get dNovaDataDeEntrada                   valid dNovaDataDeEntrada > CToD(cDataConsultada)
        read

        nAdicaoDeEntrada -= Val(cQuantidadeConsultada)

        //Deletando os dados antigos
        cTodasAsQuantidades := SubStr(cTodasAsQuantidades, 1, nConsulta * 4) + Str(nAdicaoDeEntrada) + SubStr(cTodasAsQuantidades, (nConsulta * 4 + 4), (Len(cTodasAsQuantidades) - (nConsulta * 4) - 4))
        cTodasAsDatas       := SubStr(cTodasAsDatas, 1, nConsulta * 8) + DToC(dNovaDataDeEntrada) + SubStr(cTodasAsDatas, (nConsulta * 8 + 8), (Len(cTodasAsDatas) - (nConsulta * 8) - 8))
        
        Alert("Produto atualizado com sucesso")
        exit
    enddo

    //Sair do Programa
    if nMenu == 6
        exit
    end if

    inkey(0)
enddo