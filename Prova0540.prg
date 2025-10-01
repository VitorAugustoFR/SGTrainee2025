//Vitor Augusto Faria Ramalho
set date british
set epoch to 1940
set scoreBoard off
set message to 05 center

//Variaveis Fixas
//Usuario e senha
cUsuarios              := "PALMEIRASTETRAABELFERREIRA10"
cSenhas                := "ABCD1234EFGH5678"
cDadosLoginAdmin       := "ADMIN"
cDadosSenhaAdmin       := "ADMIN123"
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
cValidacaoNumeros      := "1234567890"
//Area de pagamento


do while .t.
    //dados usuario
    cUsuario               := Space(14)
    cSenha                 := Space(8)
    nMenuPedidos           := 0
    nNumeroPedido          := 0
    nPorcentagemDeComissao := 0

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
        cNomeCliente        := Space(30)
        nLimiteDeCredito    := 0
        dPedido             := date()
        nValorTotalPedido   := 0
        nValorTotalComissao :=0
        cLoginAdmin         := Space(5)
        cSenhaAdmin         := Space(8)

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
            nPrecoUnidade       := 0
            //comissao
            nPercentualComissao := 0
            nComissao           := 0
            
            @ 05,03 to 12,75
            @ 05,35 say "PRODUTOS"
            @ 06,04 say " Codigo | Descricao do produto | Preco Unit. | %Max Desconto | Estoque "
            @ 07,04 say "  " + cAmoraCodigo   + "  |     " + cAmoraNomeProduto + "      |    "        + AllTrim(Transform(nAmoraPrecoUnit, "@E"))   + "     |      %" + AllTrim(Str(nAmoraDescontoMaximo))   + "      |  " + AllTrim(Transform(nAmoraEstoque, "@E"))   + " "
            @ 08,04 say "  " + cUvaCodigo     + "  |       " + cUvaNomeProduto + "       |    "       + AllTrim(Transform(nUvaPrecoUnit, "@E"))     + "    |      %"  + AllTrim(Str(nUvaDescontoMaximo))     + "      |  " + AllTrim(Transform(nUvaEstoque, "@E"))     + " "
            @ 09,04 say "  " + cPepinoCodigo  + "  |        " + cPepinoNomeProduto + "        |    "  + AllTrim(Transform(nPepinoPrecoUnit, "@E"))  + "    |      %"  + AllTrim(Str(nPepinoDescontoMaximo))  + "      |  " + AllTrim(Transform(nPepinoEstoque, "@E"))  + " "
            @ 10,04 say "  " + cMorangoCodigo + "  |        " + cMorangoNomeProduto + "       |    " + AllTrim(Transform(nMorangoPrecoUnit, "@E")) + "     |      %" + AllTrim(Str(nMorangoDescontoMaximo)) + "       |  " + AllTrim(Transform(nMorangoEstoque, "@E")) + " "


            @ 12,03 to 21,74
            @ 12,35 say "DIGITE"
            @ 13,04 say "O CODIGO................: "
            @ 14,04 say "A QUANTIDADE............: "
            @ 15,04 say "O PERCENTUAL DE DESCONTO: "
            @ 16,04 say "O PERCENTUAL DA COMISSAO:"

            @ 13,27 get cCodigo                           valid Len(cCodigo) > 3
            read
            //Checando se o codigo do produto existe
            if (!(cCodigo $ cAmoraCodigo) .and. !(cCodigo $ cUvaCodigo) .and. !(cCodigo $ cPepinoCodigo) .and. !(cCodigo $ cMorangoCodigo)) .and. !(cCodigo $ cValidacaoNumeros)
                Alert ("CODIGO INVALIDO!")
                loop
            end if

            @ 14,27 get nQuantidade         picture("@E") valid !Empty(nQuantidade)
            @ 15,27 get nPercentualDesconto picture("@E") valid Len(cCodigo) == 4 .and. nPercentualDesconto >= 0
            @ 16,27 get nPercentualComissao picture("@E") valid nPercentualComissao < 100
            read
            //VALIDACOES
            //AMORA
            if cCodigo == cAmoraCodigo
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
                nPrecoUnidade += nAmoraPrecoUnit
            end if
            //UVA
            if cCodigo == cUvaCodigo
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
                nPrecoUnidade += nUvaPrecoUnit
            end if
            //PEPINO
            if cCodigo == cPepinoCodigo
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
                nPrecoUnidade += nPepinoPrecoUnit
            end if
            //MORANGO
            if cCodigo == cMorangoCodigo
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
                nPrecoUnidade += nMorangoPrecoUnit
            end if

            //Calculos finais
            nValorPedido += (nPrecoUnidade * nQuantidade * (1 - (nPercentualDesconto / 100))) * (1 + (nPercentualComissao / 100))
            nComissao := nValorPedido * (nPercentualComissao / 100)

            //Checando se tem dinheiro suficiente
            if nValorPedido > nLimiteDeCredito
                nOpcao3 := Alert("CREDITO INSULFICIENTE PARA REALIZAR TRANSACAO!",{"SUPERVISOR","DESCONSIDERAR PRODUTO"})
                if nOpcao3 == 1
                    clear
                    @ 00,00 to 03,79
                    @ 00,19 say "SOLICITAR AUTORIZACAO PARA COMPRAS ACIMA DO LIMITE"
                    @ 01,01 say "Insira o nome de login do admin: "
                    @ 02,01 say "Insira a senha do admin........: "

                    @ 01,33 get cLoginAdmin picture("@!")
                    @ 02,33 get cSenhaAdmin picture("@!")
                    read

                    if !(cLoginAdmin $ cDadosLoginAdmin) .or. !(cSenhaAdmin $ cDadosSenhaAdmin)
                        Alert("LOGIN E/OU SENHA INCORRETO(S)")
                    else
                        @ 05,01 prompt "Autorizar" message "Autorizar que o usuario ultrapasse seu limite de credito"
                        @ 06,01 prompt "Nao autorizar" message "Desconsiderar produto"
                        menu to nOpcao4
                        if nOpcao4 == 1
                            Alert("ORCAMENTO AUTORIZADO")
                        elseif nOpcao4 == 2
                            Alert("PRODUTO DESCONSIDERADO")
                            loop
                        end if
                    end if
                elseif nOpcao3 == 2
                    loop
                end if
            end if

            //Somando o montante e mostrando o valor total do pedido atual + o valor total dos pedidos
            nValorTotalPedido  += nValorPedido
            nValorTotalComissao += nComissao
            @ 17,04 say "Valor total do produto......: " + Transform(nValorPedido, "@E 9,999.99")
            @ 18,04 say "Valor total do pedido.......: " + Transform(nValorTotalPedido, "@E 9,999.99")
            @ 19,04 say "Valor da comissao...........: " + Transform(nComissao, "@E 9,999.99")
            @ 20,04 say "Valor total da comissao.....: " + Transform(nValorTotalComissao, "@E 99,999.99")

            nLimiteDeCredito -= nValorPedido

            if LastKey() == 27
                nOpcao2 :=  Alert("O que deseja fazer?", {"Finalizar a compra", "Continuar"}, "RB+/W+")
                if nOpcao2 == 1 
                    exit
                elseif nOpcao2 == 2

                end if
            end if
            inkey(0)
        enddo

        //Variaveis pagamento
        //Dinheiro
        nValorRecebido := 0
        //Cheque
        nBanco          := 0
        nAgencia        := 0
        nCodigoDaConta  := 0
        nNumeroDoCheque := 0
        //cartao de credito
        nParcelas       := 1
        nValorParcelas  := 0
        do while .t.
            clear
            //metodo de pagamento
            @ 01,01 say "Valor total gasto: " + Transform(nValorTotalPedido, "@E 9,999.99")
            @ 02,01 say "Credito restante: " + Transform(nLimiteDeCredito, "@E 99,999.99")
            @ 03,01 say "Valor da comissao : " + Transform(nValorTotalComissao, "@E 99,999.99")
            
            @ 04,00 to 09,79
            @ 04,35 say "PAGAMENTO"
            @ 05,01 Say "Escolha o metodo de pagamento:"
            @ 06,01 prompt "DINHEIRO" message "Mais rapido"
            @ 07,01 prompt "CHEQUE"   message "Adicionar dados bancarios"
            @ 08,01 prompt "CARTAO DE CREDITO" message "Pode pagar parcelado em ate 12x"
            menu to nOpcao5

            if nOpcao5 == 1
                @ 10,00 to 13,79
                @ 10,29 say "PAGAMENTO EM DINHEIRO"
                @ 11,01 say "Digite o valor recebido: "
            
                @ 11,25 get nValorRecebido picture("@E 999,999.99")
                read
                if nValorRecebido < nValorTotalPedido
                    Alert("VOCE DEVE AO MENOS PAGAR O VALOR TOTAL GASTO EM DINHEIRO!")
                    loop
                endif
            
                @ 12,01 say "Troco: " + AllTrim(Str(nValorRecebido - nValorTotalPedido))
                inkey(0)
                exit

            elseif nOpcao5 == 2
                @ 10,00 to 15,79
                @ 10,30 say "PAGAMENTO EM CHEQUE"
                @ 11,01 say "Digite o numero do banco.: "
                @ 12,01 say "Digite a agencia.........: "
                @ 13,01 say "Digite o codigo da conta.: "
                @ 14,01 say "Digite o numero do cheque: "
            
                @ 11,27 get nBanco          picture("999")
                @ 12,27 get nAgencia        picture("9999")
                @ 13,27 get nCodigoDaConta  picture("9999999999")
                @ 14,27 get nNumeroDoCheque picture("999999")
                read

                Alert("CHEQUE REALIZADO COM SUCESSO!")

                inkey(0)
                exit

            elseif nOpcao5 == 3
                @ 10,00 to 12,79
                @ 10,24 say "PAGAMENTO EM CARTAO DE CREDITO"
                @ 11,01 say "Em quantas parcelas sera feito? "

                @ 11,32 get nParcelas valid nParcelas > 0 .and. nParcelas <= 12 
                read
                
                nValorParcelas := nValorTotalPedido / nParcelas
                for nParcela := 1 to nParcelas
                    @ 12,00 to (14 + nParcelas),56
                    dVencimentoParcela  := dPedido + (30 * nParcela)
                    nValorParcela := nValorParcelas * nParcela
                    @ 13,01 say " Num. da Parcela | Venc. da parcela | Valor da parcela "

                    @ (13 + nParcela),01 say "       " + AllTrim(Str(nParcela)) + "         |     " + DToC(dVencimentoParcela) + "     |   R$" + AllTrim(Str(nValorParcela)) + "     "
                next

                Alert("PAGAMENTO REALIZADO COM SUCESSO!")

                inkey(0)
                exit

            endif
            
        enddo
            
        inkey(0)
    enddo
enddo