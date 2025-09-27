//Vitor Augusto Faria Ramalho
set date british
set epoch to 1940
set scoreBoard off
set message to 05 center

//Variaveis Fixas
//Usuario e senha
cUsuarios              := "PALMEIRASTETRAABELFERREIRA10"
cSenhas                := "ABCD1234EFGH5678"
//Produtos
//Amora Preta
cAmoraCodigo           := "5500"
cAmoraNomeProduto      := "Amora preta"
nAmoraPrecoUnit        := 7.50
nAmoraDescontoMaximo   := 14
nAmoraEstoque          := 210
//Uva Rubi
cUvaCodigo             := "7744"
cUvaNomeProduto        := "Uva rubi"
nUvaPrecoUnit          := 18.00
nUvaDescontoMaximo     := 17
nUvaEstoque            := 198.5
//Pepino
cPepinoCodigo          := "4445"
cPepinoNomeProduto     := "Pepino"
nPepinoPrecoUnit       := 23.99
nPepinoDescontoMaximo  := 12
nPepinoEstoque         := 345
//Morango
cMorangoCodigo         := "6565"
cMorangoNomeProduto    := "Morango"
nMorangoPrecoUnit      := 5.49
nMorangoDescontoMaximo := 4
nMorangoEstoque        := 210
//Validacoes
cValidacaoNumeros := "1234567890"


do while .t.
    //dados usuario
    cUsuario      := Space(14)
    cSenha        := Space(8)
    nMenuPedidos  := 0
    nNumeroPedido := 0

    clear

    @ 00,00 to 3,79

    @ 00,32 say "FRUTARIA VITOR"
    @ 01,01 say "Digite seu login: "
    @ 02,01 say "Digite sua senha: "

    @ 01,18 get cUsuario picture("@!") valid Len(cUsuario) == 14
    @ 02,18 get cSenha   picture("@!") valid Len(cSenha) == 8
    read

    if (cUsuario $ SubStr(cUsuarios,1,14) .and. cSenha == SubStr(cSenhas,1,8)) .or. (cUsuario $ SubStr(cUsuarios,15,14) .and. cSenha == SubStr(cSenhas,9,8))

    else
        Alert("USUARIO E/OU SENHA ERRADO(S)!")
        loop
    end if

    clear
    @ 00,00 to 04,79
    @ 00,32 say "MENU PRINCIPAL"
    @ 01,01 prompt "Pedir" Message "Efetuar pedidos"
    @ 02,01 prompt "Sair"  Message "Sair do programa"
    menu to nOpcao

    if nOpcao == 1
        nMenuPedidos := 1
    elseif nOpcao == 2
        clear
        exit
    end if

    do while nMenuPedidos == 1
        //Dados da venda
        cNomeCliente     := Space(30)
        nLimiteDeCredito := 0
        dPedido          := date()
        nValorTotalPedido      := 0

        clear
        @ 00,00 to 4,79
        @ 00,26 say "INSIRA OS DADOS DA VENDA"
        @ 01,01 say "Insira o nome do cliente..: "
        @ 02,01 say "Insira o limite de credito: "
        @ 03,01 say "Insira a data do pedido...: "

        @ 01,28 get cNomeCliente     picture("@!") valid !Empty(cNomeCliente)
        @ 02,28 get nLimiteDeCredito picture("@E 99,999.99") valid nLimiteDeCredito > 5.49
        @ 03,28 get dPedido                                  valid dPedido >= date()
        read

        if LastKey() == 27
            nOpcao2 :=  Alert("O que deseja fazer?", {"Sair", "Continuar"}, "RB+/W+")
            if nOpcao2 == 1 
                exit
            elseif nOpcao2 == 2
            end if
        end if
        Alert("DADOS DO CLIENTE INSERIDOS COM SUCESSO!")

        do while .t.
            cCodigo             := Space(4)
            nQuantidade         := 0
            nPercentualDesconto := 0
            nValorPedido        := 0
            
            @ 05,03 to 12,75
            @ 05,35 say "PRODUTOS"
            @ 06,04 say " Codigo | Descricao do produto | Preco Unit. | %Max Desconto | Estoque |"
            @ 07,04 say "  " + cAmoraCodigo   + "  |     " + cAmoraNomeProduto + "      |    "        + AllTrim(Transform(nAmoraPrecoUnit, "@E"))   + "     |      %" + AllTrim(Str(nAmoraDescontoMaximo))   + "      |  " + AllTrim(Transform(nAmoraEstoque, "@E"))   + " "
            @ 08,04 say "  " + cUvaCodigo     + "  |       " + cUvaNomeProduto + "       |    "       + AllTrim(Transform(nUvaPrecoUnit, "@E"))     + "    |      %"  + AllTrim(Str(nUvaDescontoMaximo))     + "      |  " + AllTrim(Transform(nUvaEstoque, "@E"))     + " "
            @ 09,04 say "  " + cPepinoCodigo  + "  |        " + cPepinoNomeProduto + "        |    "  + AllTrim(Transform(nPepinoPrecoUnit, "@E"))  + "    |      %"  + AllTrim(Str(nPepinoDescontoMaximo))  + "      |  " + AllTrim(Transform(nPepinoEstoque, "@E"))  + " "
            @ 10,04 say "  " + cMorangoCodigo + "  |        " + cMorangoNomeProduto + "        |    " + AllTrim(Transform(nMorangoPrecoUnit, "@E")) + "     |      %" + AllTrim(Str(nMorangoDescontoMaximo)) + "      |  " + AllTrim(Transform(nMorangoEstoque, "@E")) + " "


            @ 12,03 to 18,74
            @ 12,35 say "DIGITE"
            @ 13,04 say "O CODIGO................: "
            @ 14,04 say "A QUANTIDADE............: "
            @ 15,04 say "O PERCENTUAL DE DESCONTO: "

            @ 13,27 get cCodigo                           valid Len(cCodigo) > 3
            read
            //Checando se o codigo do produto existe
            if (!(cCodigo $ cAmoraCodigo) .and. !(cCodigo $ cUvaCodigo) .and. !(cCodigo $ cPepinoCodigo) .and. !(cCodigo $ cMorangoCodigo)) .and. !(cCodigo $ cValidacaoNumeros)
                Alert ("CODIGO INVALIDO!")
                loop
            end if

            if LastKey() == 27
                nOpcao2 :=  Alert("O que deseja fazer?", {"Finalizar a compra", "Continuar"}, "RB+/W+")
                if nOpcao2 == 1 
                    exit
                elseif nOpcao2 == 2

                end if
            end if

            @ 14,27 get nQuantidade         picture("@E") valid !Empty(nQuantidade)
            @ 15,27 get nPercentualDesconto picture("@E") valid Len(cCodigo) == 4 .and. nPercentualDesconto >= 0
            read
            //VALIDACOES
            //AMORA
            if cCodigo == cAmoraCodigo
                //Checando se tem dinheiro suficiente
                nValorTotalProduto := nQuantidade * nAmoraPrecoUnit * (1 - nPercentualDesconto/100)
                if nValorTotalProduto > nLimiteDeCredito
                    Alert("CREDITO INSULFICIENTE PARA REALIZAR TRANSACAO!")
                    loop
                end if
                //Checando se tem em esqoque e se o desconto condiz com o produto
                if nAmoraEstoque >= nQuantidade .and. nPercentualDesconto <= nAmoraDescontoMaximo
                    nAmoraEstoque -= nQuantidade
                elseif !(nAmoraEstoque >= nQuantidade)
                    Alert("ESTOQUE DE " + cAmoraNomeProduto + " INDISPONIVEL PARA O SEU PEDIDO") 
                    loop
                elseif nPercentualDesconto > nAmoraDescontoMaximo
                    Alert("DESCONTO ACIMA DO LIMITE MAXIMO PARA O SEU PEDIDO") 
                    loop
                end if
            end if
            //UVA
            if cCodigo == cUvaCodigo
                //Checando se tem dinheiro suficiente
                nValorTotalProduto := nQuantidade * n * (1 - nPercentualDesconto/100)
                if nValorTotalProduto > nLimiteDeCredito
                    Alert("CREDITO INSULFICIENTE PARA REALIZAR TRANSACAO!")
                    loop
                end if
                //Checando se tem em esqoque e se o desconto condiz com o produto
                if nUvaEstoque >= nQuantidade .and. nPercentualDesconto <= nUvaDescontoMaximo
                    nUvaEstoque -= nQuantidade
                elseif !(nUvaEstoque >= nQuantidade)
                    Alert("ESTOQUE DE " + cAmoraNomeProduto + " INDISPONIVEL PARA O SEU PEDIDO") 
                    loop
                elseif nPercentualDesconto > nUvaDescontoMaximo
                    Alert("DESCONTO ACIMA DO LIMITE MAXIMO PARA O SEU PEDIDO") 
                    loop
                end if
            end if
            //PEPINO
            if cCodigo == cPepinoCodigo
                //Checando se tem dinheiro suficiente
                nValorTotalProduto := nQuantidade * nPepinoPrecoUnit * (1 - nPercentualDesconto/100)
                if nValorTotalProduto > nLimiteDeCredito
                    Alert("CREDITO INSULFICIENTE PARA REALIZAR TRANSACAO!")
                    loop
                end if
                //Checando se tem em esqoque e se o desconto condiz com o produto
                if nPepinoEstoque >= nQuantidade .and. nPercentualDesconto <= nPepinoDescontoMaximo
                    nPepinoEstoque -= nQuantidade
                elseif !(nPepinoEstoque >= nQuantidade)
                    Alert("ESTOQUE DE " + cAmoraNomeProduto + " INDISPONIVEL PARA O SEU PEDIDO") 
                    loop
                elseif nPercentualDesconto > nPepinoDescontoMaximo
                    Alert("DESCONTO ACIMA DO LIMITE MAXIMO PARA O SEU PEDIDO") 
                    loop
                end if
            end if
            //MORANGO
            if cCodigo == cMorangoCodigo
                //Checando se tem dinheiro suficiente
                nValorTotalProduto := nQuantidade * nMorangoPrecoUnit * (1 - nPercentualDesconto/100)
                if nValorTotalProduto > nLimiteDeCredito
                    Alert("CREDITO INSULFICIENTE PARA REALIZAR TRANSACAO!")
                    loop
                end if
                //Checando se tem em esqoque e se o desconto condiz com o produto
                if nMorangoEstoque >= nQuantidade .and. nPercentualDesconto <= nMorangoDescontoMaximo
                    nMorangoEstoque -= nQuantidade
                elseif !(nMorangoEstoque >= nQuantidade)
                    Alert("ESTOQUE DE " + cAmoraNomeProduto + " INDISPONIVEL PARA O SEU PEDIDO") 
                    loop
                elseif nPercentualDesconto > nMorangoDescontoMaximo
                    Alert("DESCONTO ACIMA DO LIMITE MAXIMO PARA O SEU PEDIDO") 
                    loop
                end if
                end if
            end if

            //Calculos finais

            nValorTotalPedido  += nValorTotalProduto
            @ 16,04 say "Valor total do produto: " + Transform(nValorTotalProduto, "@E 9,999.99")
            @ 17,04 say "Valor total do pedido.: " + Transform(nValorTotalPedido, "@E 9,999.99")

            nLimiteDeCredito -= nValorTotalProduto
            inkey(0)
        enddo

        @ 19,01 say "Valor total gasto: " + Transform(nValorTotalPedido, "@E 9,999.99")
        @ 20,01 say "Credito restante: " + Transform(nLimiteDeCredito, "@E 99,999.99")
        inkey(0)
    enddo
enddo