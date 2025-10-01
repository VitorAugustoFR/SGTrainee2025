//VITOR AUGUSTO FARIA RAMALHO
set date british
set epoch to 1940
set scoreBoard off

//Variaveis fixas
//Inicializacao do sistema
cLogin        := "JOSE"
cLoginSenha   := "432mudar123"
cSenhaSupervisor := "AUTORIZA99"
//Dados da ordem serviço
nOrdemServico := 0
cValidacaoEntrega := "SN"
//Dados entrega
cNumerosValidacao := "1234567890"
//Dados do efetuamento
nLinha := 4
nColuna := 1
nValorTotal := 0

do while .t.

    //Variaveis
    //Inicialização
    cUsuario := Space(4)
    cSenhaUsuario := Space(11)

    clear
    @ 00,00 to 03,79
    @ 00,27 say "INICIALIZACAO DO SISTEMA"
    @ 01,01 say "Digite o login: "
    @ 02,01 say "Digite a senha: "

    @ 01,16 get cUsuario      picture("@!")
    @ 02,16 get cSenhaUsuario
    read
    if LastKey() == 27
        nOpcao1 :=  Alert("O que deseja fazer?", {"Sair", "Continuar"}, "RB+/W+")
        if nOpcao1 == 1 
            exit
        elseif nOpcao1 == 2

        end if
    end if

    if !(cUsuario $ cLogin) .or. !(cSenhaUsuario $ cLoginSenha)
        Alert("USUARIO E/OU SENHA ERRADO(S)!")
        loop
    end if

    @ 04,00 to 08,79
    @ 04,32 say "MENU PRINCIPAL"
    @ 05,01 prompt "Efetuar pedidos" message "Ir para o menu de pedidos"
    @ 06,01 prompt "Sair"            message "Sair do programa"
    menu to nOpcao

    if nOpcao == 1

    elseif nOpcao == 2
        clear
        exit
    end if

    do while .t.
        //Variaveis
        //Ordem de servico
        cNomeDoCliente          := Space(40)
        dOrdemServico           := date()
        cNomeDoTecnico          := Space(30)
        cDescricaoDoEquipamento := Space(40)
        dCompra                 := date()
        cEntregaDomicilio       := Space(1)
        nLimiteDeCredito        := 0
        //dados de entrega
        cEndereco := Space(25)
        cBairro := Space(30)
        cReferencia := Space(30)
        cTelefone := space(11)
        nTaxaDeEntrega := 2
        clear
        @ 00,00 to 07,79
        @ 00,27 say "DADOS DA ORDEM DO SERVICO"
        @ 01,01 say "Digite o nome do cliente.........: "
        @ 02,01 say "Digite a data da ordem do servico: "
        @ 03,01 say "Digite o nome do tecnico.........: "
        @ 04,01 say "Digite a descricao do equipamento: "
        @ 05,01 say "Digite a data da compra..........: "
        @ 06,01 say "E entrega domicilio..............? "

        @ 01,35 get cNomeDoCliente          picture("@!") valid !Empty(cNomeDoCliente)
        @ 02,35 get dOrdemServico
        @ 03,35 get cNomeDoTecnico          picture("@!") valid !Empty(cNomeDoTecnico)
        @ 04,35 get cDescricaoDoEquipamento picture("@!") valid !Empty(cDescricaoDoEquipamento)
        @ 05,35 get dCompra                               valid dCompra >= dOrdemServico
        @ 06,35 get cEntregaDomicilio       picture("@!") valid cEntregaDomicilio $ cValidacaoEntrega
        read

        if LastKey() == 27
            nOpcao2 :=  Alert("O que deseja fazer?", {"Sair", "Continuar"}, "RB+/W+")
            if nOpcao2 == 1 
                exit
            elseif nOpcao2 == 2

            end if
        end if

        nOrdemServico++

        if cEntregaDomicilio == "S"
            @ 08,00 to 13,79
            @ 08,31 say "DADOS DA ENTREGA"
            @ 09,01 say "Digite o Endereco..: "
            @ 10,01 say "Digite o bairro....: "
            @ 11,01 say "Digite a referencia: "
            @ 12,01 say "Digite o telefone..: "

            @ 09,21 get cEndereco                          valid !Empty(cEndereco)
            @ 10,21 get cBairro                            valid ! Empty(cBairro)
            @ 11,21 get cReferencia
            @ 12,21 get cTelefone picture("99999999999") valid cTelefone $ cNumerosValidacao
            read
        end if

        clear
        do while .t.
            //Variaveis
            cSupervisor := Space(15)
            cSupervisorUsuarioSenha := Space(10)
            cProdutoOuServico    := "PS"
            cEscolha             := Space(1)
            cCor := "N/G"
            //Produto
            cDescricaoDoProduto  := Space(30)
            nQuantidade          := 0
            nPrecoUnitario       := 0
            nValorTotalProduto   := 0
            dAquisicaoProduto    := CToD("")
            //Servico
            cDescricaoDoServico  := Space(25)
            nPrecoServico        := 0
            nPorentagemDoTecnico := 0
            nPrecoTotalServico   := 0
            nComissaoDoTecnico   := 0
            dRealizacaoServico   := CToD("")
            //Geral
            nPorcentagemDesconto := 0

            @ 00,00 to 02,79
            @ 00,26 say "PEDIDO DE PRODUTOS/SERVICOS"
            @ 01,01 say "Solicitar [P]roduto ou [S]ervico:   (Produto Sendo verde e Servico sendo azul)"

            @ 01,34 get cEscolha picture("@!") valid cEscolha $ cProdutoOuServico
            read
            
            if LastKey() == 27
                nOpcao3 :=  Alert("O que deseja fazer?", {"Sair", "Continuar"}, "RB+/W+")
                if nOpcao3 == 1 
                    exit
                elseif nOpcao3 == 2

                end if
            end if

            @ 03,00 to (nLinha + 5),79
            @ 03,04 say "Valor Total: R$" + Transform(nValorTotal, "@E 99,999,999.99")
            if cEscolha == "P"
                @ nLinha,01       say "Descricao do produto: " color cCor
                @ (nLinha + 1),01 say "Quantidade..........: " color cCor
                @ (nLinha + 2),01 say "Preco por Unidade...: " color cCor
                @ (nLinha + 3),01 say "Desconto............: " color cCor
                @ (nLinha + 4),01 say "Data de aquisicao...: " color cCor


                @ nLinha,22       get cDescricaoDoProduto
                @ (nLinha + 1),22 get nQuantidade                                       valid nQuantidade    > 0
                @ (nLinha + 2),22 get nPrecoUnitario       picture("@E 999,999,999.99") valid nPrecoUnitario > 0
                @ (nLinha + 3),22 get nPorcentagemDesconto picture("@E 999.99")
                @ (nLinha + 4),22 get dAquisicaoProduto                                 valid !Empty(dAquisicaoProduto)
                read

                if (date() - dAquisicaoProduto) / 365 <= 2 
                    Alert("COBERTO PELA GARANTIA!")
                else
                    //Calculo do valor do produto
                    nValorTotalProduto += nPrecoUnitario * nQuantidade * (1- (nPorcentagemDesconto/100))
                    if nLimiteDeCredito < nValorTotalProduto
                        Alert("LIMITE ULTRAPASSADO!")
                        clear
                        @ 01,01 say "Digite o nome do supervisor.: "
                        @ 02,01 say "Digite a senha do supervisor: "

                        @ 01,30 get cSupervisor             picture("@!")
                        @ 02,30 get cSupervisorUsuarioSenha picture("@!")
                        read
                        if cSupervisorUsuarioSenha $ cSenhaSupervisor
                            //somando ao valor total
                            nValorTotal += nValorTotalProduto
                            //Apresentando resultado
                            @ (nLinha + 4),01 say "Valor ToTal do produto: " + Transform(nValorTotalProduto, "@E 999,999,999.99")
                        else
                            Alert("SENHA INCORRETA!")
                            loop
                        end if
                    end if
                end if
            elseif cEscolha == "S"
                cCor := "N/B"
                @ nLinha,01       say "Descricao do Servico: " color cCor
                @ (nLinha + 1),01 say "Preco do Servico....: " color cCor
                @ (nLinha + 2),01 say "Comissao do tecnico.: " color cCor
                @ (nLinha + 3),01 say "Desconto............: " color cCor
                @ (nLinha + 4),01 say "Data de realizacao..: " color cCor

                @ nLinha,22       get cDescricaoDoServico
                @ (nLinha + 1),22 get nPrecoServico        picture("@E 999,999,999.99") valid nPrecoServico > 0
                @ (nLinha + 2),22 get nPorentagemDoTecnico   picture("@E 999.99")       valid nComissaoDoTecnico > 0
                @ (nLinha + 3),22 get nPorcentagemDesconto picture("@E 999.99")
                @ (nLinha + 4),22 get dRealizacaoServico                                valid !Empty(dRealizacaoServico)
                read

                if date() - dRealizacaoServico/365 <= 1
                    Alert("COBERTO PELA GARANTIA!")
                else
                    //Calculo do valor do servico
                    nPrecoTotalServico += nPrecoServico * (1- (nPorcentagemDesconto/100))
                    //Calculo da comissao do tecnico
                    nComissaoDoTecnico += nPrecoTotalServico * (1 - (nPorentagemDoTecnico/ 100))
                    //Checando se tem limite disponivel
                    if nLimiteDeCredito < nPrecoTotalServico + nComissaoDoTecnico
                        Alert("LIMITE ULTRAPASSADO!")
                        clear
                        @ 01,01 say "Digite o nome do supervisor.: "
                        @ 02,01 say "Digite a senha do supervisor: "

                        @ 01,30 get cSupervisor
                        @ 02,30 get cSupervisorUsuarioSenha
                        read
                        if cSupervisorUsuarioSenha $ cSenhaSupervisor
                            nLimiteDeCredito -= nPrecoTotalServico + nComissaoDoTecnico 
                            //somando ao valor total
                            nValorTotal += nPrecoTotalServico + nComissaoDoTecnico
                            //Apresentando resultados
                            @ (nLinha + 4),01 say "Valor ToTal do Servico: " + Transform(nPrecoTotalServico, "@E 999,999,999.99") + "; Comisso do tecnico: " + Transform(nComissaoDoTecnico, "@E 999,999,999.99")
                        else
                            Alert("SENHA INCORRETA!")
                            loop
                        end if
                    end if
                end if
            end if

            Inkey(0)
            nLinha += 6
            if nLinha >= 26
                nLinha := 1
                clear
            end if
        enddo
        
        clear
        //METODOS DE PAGAMENTO
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

        do while nValorTotal > 0
            //metodo de pagamento
            @ 01,01 say "Valor total gasto: " + Transform(nValorTotal, "@E 9,999.99")
            @ 02,01 say "Credito restante: " + Transform(nLimiteDeCredito, "@E 99,999.99")
            @ 03,01 say "Valor da comissao : " + Transform(nComissaoDoTecnico, "@E 99,999.99")
            
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
                    nValorTotal -= nValorRecebido
                    Alert("VOCE AINDA NAO PAGOU !")
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

        nCNPJDaEmpresa := 0
        nNumeroDaNota := 0
        dNota := CToD("")
        if nValorTotal == 0
            Alert("GARANTIA COBRIU TUDO!")
            @ 01,01 say "Digite o CNPJ da empresa......: "
            @ 02,01 say "Digite o Numero da nota fiscal: "
            @ 03,01 say "Digite a data da nota.........: "

            @ 01,32 get nCNPJDaEmpresa picture("@E 99,999,999.9999,99") valid !Empty(nCNPJDaEmpresa)
            @ 02,32 get nNumeroDaNota picture("9999999999")             valid !Empty(nNumeroDaNota)
            @ 03,32 get dNota                                           valid !Empty(dNota)
    enddo
enddo