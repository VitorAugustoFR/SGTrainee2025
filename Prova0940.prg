//VITOR AUGUSTO FARIA RAMALHO
set scoreBoard off

nMesas                          := 2
nAtendentes                     := 2
//Validacoes
cValidacaoSimNao                := "SN"
cValidacaoFormaDePagamento      := "DCQ"
//Relatorio
//Antendimentos por mesa
nAtendimentoMesa1               := 0
nAtendimentoMesa2               := 0
//Cancelamentos por mesa
nAtendimentoCanceladoMesa1      := 0
nAtendimentoCanceladoMesa2      := 0
//Valor total de atendimentos por mesa(desconsiderando cancelamento e taxa)
nValorTotalDosAtendimentosMesa1 := 0
nValorTotalDosAtendimentosMesa2 := 0
//Valor total de cancelamneto por mesa
nValorTotalCancelamentoMesa1    := 0
nValorTotalCancelamentoMesa2    := 0
//Valor medio por mesa(desconsiderando cancelamento e taxa)
nValorMedioMesa1                := 0
nValorMedioMesa2                := 0
//Taxa de servico por atendente
nTaxaAtendente1                 := 0
nTaxaAtendente2                 := 0
nTaxaTotal                      := 0

do while .t.
    nSelecaoMenu := 0
    nMesa1       := 0
    nMesa2       := 0

    clear
    @ 00,00 to 04,79
    @ 00,32 say "RESTAURANTE SG"
    @ 01,37 prompt "Mesas"
    @ 02,35 prompt "Relatorio"
    @ 03,37 prompt "Sair"
    menu to nOpcao

    if LastKey() == 27
        nOpcao   := 3
    end if

    if nOpcao     == 1
        nSelecaoMenu := 1
    elseif nOpcao == 2
        nSelecaoMenu := 2
    elseif nOpcao == 3
        clear
        exit
    end if

    //Mesas
    do while nSelecaoMenu == 1
        nNumeroDaMesa        := 0
        nCodigoDoAtendente   := 0
        nDisponibilidadeMesa := 0
        nMesa                := 0

        clear
        @ 00,00 to 03,79
        @ 00,37 say "MESAS"
        @ 01,01 say "Digite o numero da mesa.....: "
        @ 02,01 say "Digite o codigo do atendente: "

        @ 01,30 get nNumeroDaMesa      picture("9") valid !Empty(nNumeroDaMesa)
        @ 02,30 get nCodigoDoAtendente picture("9") valid !Empty(nCodigoDoAtendente)
        read

        if LastKey() == 27
            nOpcao2 :=  Alert("O que deseja fazer?", {"Contiuar", "Ir ao menu principal"}, "RB+/W+")
            if nOpcao2 == 1 
                loop
            elseif nOpcao2 == 2
                exit
            end if
        end if

        //checando se a mesa selecionada esta disponivel
        if nNumeroDaMesa == 1
            if nMesa1 != 1
                nMesa1               := 1
                nDisponibilidadeMesa := 1
                nMesa                := 1
            end if
        elseif nNumeroDaMesa == 2
            if nMesa2 != 1
                nMesa2               := 1
                nDisponibilidadeMesa := 1
                nMesa                := 2
            end if
        else
            Alert("HA APENAS DUAS MESAS NO ESTABELECIMENTO!")
            loop
        end if

        //Esta disponivel
        do while nDisponibilidadeMesa == 1
            cDescricaoProduto := Space(30)
            nQuantidade       := 0
            nPrecoUnitario    := 0
            nValorTotalPedido := 0

            @ 04,00 to 08,77
            @ 05,01 say "      Descricao do Produto      | Quantidade | Preco Unitario | Valor Total"
            @ 06,01 say "--------------------------------|------------|----------------|-------------"
            @ 07,01 say "                                |            |                |            "
            @ 07,02 get cDescricaoProduto picture("@!")          valid !Empty(cDescricaoProduto)
            @ 07,38 get nQuantidade       picture("99")          valid !Empty(nQuantidade)
            @ 07,50 get nPrecoUnitario    picture("@E 9,999.99") valid !Empty(nPrecoUnitario)
            read

            nValorTotalPedido := nPrecoUnitario * nQuantidade
            @ 07,65 say Transform(nValorTotalPedido, "@E 999,999.99")
            
            if LastKey() == 27
                nOpcao3 :=  Alert("Enviar pedido para producao?", {"Enviar", "Contiuar digitando", "Abandonar digitacao"}, "RB+/W+")
                if nOpcao3 == 1 
                    Alert("Pedido enviado para producao!")
                    exit
                elseif nOpcao3 == 2
                    loop
                elseif nOpcao3 == 3
                    clear
                    exit
                    if nMesa == 1
                        nAtendimentoCanceladoMesa1++
                    elseif nMesa == 2
                        nAtendimentoCanceladoMesa2++
                    endif
                end if
            end if
            inkey(0)

            //Pagamento
            do while .t.
                
                cSimNao           := Space(1)
                cFormaDePagamento := Space(1)
                nTaxaDeSevico     := 0
                nValorFinal       := 0
                //Dinheiro
                nValorRecebido    := 0
                nTroco            := 0
                //Cheque
                nBanco            := 0
                nAgencia          := 0
                nCodigoDaConta    := 0
                nNumeroDoCheque   := 0
                //cartao de credito
                nParcelas         := 1
                nValorParcelas    := 0
                clear

                @ 00,00 to 03,79
                @ 00,35 say "DADOS DO PAGAMENTO"
                @ 01,01 say "Deseja pagar a taxa de servico..................? "
                @ 02,01 say "Deseja pagar em [D]inheiro, [C]artao ou Che[Q]ue? "
                
                @ 01,50 get cSimNao           picture("@!") valid cSimNao $ cValidacaoSimNao
                @ 02,50 get cFormaDePagamento picture("@!") valid cFormaDePagamento $ cValidacaoFormaDePagamento
                read

                if cSimNao $ "S"
                    nTaxaDeSevico += nValorTotalPedido * 0.1
                end if
                nValorFinal := nValorTotalPedido + nTaxaDeSevico

                if LastKey() == 27
                    nOpcao4 :=  Alert("Quer cancelar o pagamento?", {"Cancelar pagamento", "Recomecar pagamento"}, "RB+/W+")
                    if nOpcao4 == 1 
                        clear
                        nDisponibilidadeMesa := 0
                        if nMesa == 1
                            nValorTotalCancelamentoMesa1 += nValorFinal
                            nAtendimentoCanceladoMesa1++
                        elseif nMesa == 2
                            nValorTotalCancelamentoMesa2 += nValorFinal
                            nAtendimentoCanceladoMesa2++
                        endif
                    elseif nOpcao4 == 2
                        loop
                    end if
                end if

                if cFormaDePagamento $ "D"
                    @ 04,00 to 07,79
                    @ 04,29 say "PAGAMENTO EM DINHEIRO"
                    @ 05,01 say "Digite o valor recebido: "
                
                    @ 05,25 get nValorRecebido picture("@E 999,999.99")
                    read

                    if nValorRecebido < nValorTotalPedido
                        Alert("VOCE DEVE AO MENOS PAGAR O VALOR TOTAL GASTO EM DINHEIRO!")
                        loop
                    endif
                    nTroco := nValorRecebido - nValorFinal
                
                    @ 06,01 say "Troco: R$" + Transform(nTroco, "@E 999,999.99")
                    inkey(0)
                    exit

                elseif cFormaDePagamento $ "C"
                    @ 04,00 to 06,79
                    @ 04,24 say "PAGAMENTO EM CARTAO DE CREDITO"
                    @ 05,01 say "Em quantas parcelas sera feito? "

                    @ 05,32 get nParcelas valid nParcelas > 0 .and. nParcelas <= 12 
                    read

                    nValorParcelas := nValorFinal / nParcelas

                    for nParcela := 1 to nParcelas
                        @ 12,00 to (14 + nParcelas),56
                        dVencimentoParcela  := date() + (30 * nParcela)
                        nValorParcela       := nValorParcelas * nParcela
                        @ 13,01 say " Num. da Parcela | Venc. da parcela | Valor da parcela "

                        @ (13 + nParcela),01 say "       " + AllTrim(Str(nParcela)) + "         |     " + DToC(dVencimentoParcela) + "     |   R$" + AllTrim(Str(nValorParcela)) + "     "
                    next

                    Alert("PAGAMENTO REALIZADO COM SUCESSO!")

                    inkey(0)
                    exit

                elseif cFormaDePagamento $ "Q"
                    @ 04,00 to 09,79
                    @ 04,30 say "PAGAMENTO EM CHEQUE"
                    @ 05,01 say "Digite o numero do banco.: "
                    @ 06,01 say "Digite a agencia.........: "
                    @ 07,01 say "Digite o codigo da conta.: "
                    @ 08,01 say "Digite o numero do cheque: "
                
                    @ 05,27 get nBanco          picture("999")
                    @ 06,27 get nAgencia        picture("9999")
                    @ 07,27 get nCodigoDaConta  picture("9999999999")
                    @ 08,27 get nNumeroDoCheque picture("999999")
                    read

                    Alert("CHEQUE REALIZADO COM SUCESSO!")

                    inkey(0)
                    exit

                endif
                exit
            enddo
            if nMesa == 1
                nAtendimentoMesa1++
                nValorTotalDosAtendimentosMesa1 += nValorTotalPedido
                nTaxaAtendente1                 += nTaxaDeSevico
                nMesa1                          := 0
            elseif nMesa == 2
                nAtendimentoMesa2++
                nValorTotalDosAtendimentosMesa2 += nValorTotalPedido
                nTaxaAtendente2                 += nTaxaDeSevico
                nMesa2                          := 0
            endif
            exit
        enddo
        
        //Esta indisponivel
        if nDisponibilidadeMesa == 0
            Alert("MESA OCUPADA!")
            @ 04,00 to 09,79
            @ 05,01 say "Deseja: "
            @ 06,01 prompt "Digitar outra mesa"
            @ 07,01 prompt "Faturar atendimento"
            @ 08,01 prompt "Cancelar atendimneto"
            menu to nOpcao1

            if nOpcao1 == 1
                loop
            elseif nOpcao1 == 2
                nFaturarAtendimento := 1
            elseif nOpcao1 == 3
                loop
            end if
        end if
        

    enddo

    //Relatorio
    do while nSelecaoMenu == 2
        nValorMedioMesa1 := nValorTotalDosAtendimentosMesa1 / nAtendimentoMesa1
        nValorMedioMesa2 := nValorTotalDosAtendimentosMesa2 / nAtendimentoMesa2
        clear
        @ 00,00 to 09,79
        @ 00,35 say "RELATORIO"
        @ 01,01 say "                                                |    MESA 1   |    MESA 2"
        @ 02,01 say "Quantidade de atendimentos por mesa:            |     " + AllTrim(Str(nAtendimentoMesa1)) + "       |     " + AllTrim(Str(nAtendimentoMesa2))
        @ 03,01 say "Quantidade de atendimentos cancelados por mesa: |     "       + AllTrim(Str(nAtendimentoCanceladoMesa1)) + "       |     " + AllTrim(Str(nAtendimentoCanceladoMesa2))
        @ 04,01 say "Atendimentos Totais: "                                    + AllTrim(Str(nAtendimentoMesa1 + nAtendimentoMesa2))
        @ 06,01 say "Valor dos atendimentos por mesa:                | "       + Transform(nValorTotalDosAtendimentosMesa1, "@E 99,999,999.99") + " | " + Transform(nValorTotalDosAtendimentosMesa2, "@E 99,999,999.99")
        @ 07,01 say "Valor dos cancelamentos por mesa:               | "       + Transform(nValorTotalCancelamentoMesa1, "@E 99,999,999.99") + " | " + Transform(nValorTotalCancelamentoMesa2, "@E 99,999,999.99")
        @ 08,01 say "Valor Medio dos atendimentos por mesa:          | R$"       + Transform(nValorMedioMesa1, "@E 99,999,999.99") + " | " + Transform(nValorMedioMesa2, "@E 99,999,999.99")
        @ 10,01 say "Total a receber das mesas: "                              + Transform(nValorTotalDosAtendimentosMesa1, "@E 9,999,999.99") + Transform(nValorTotalDosAtendimentosMesa2, "@E 9,999,999.99")
        @ 11,00 to 14,79
        @ 12,01 say "                                         | ATENDENTE 1 | ATENDENTE 2"
        @ 13,01 say "Valor total a receber de cada atendente: | " + Transform(nTaxaAtendente1, "@E 999,999.99") + " | " + Transform(nTaxaAtendente2, "@E 999,999.99")
        @ 15,01 say "Total a receber dos atendentes: "            + Transform(nTaxaAtendente1, "@E 9,999,999.99") + Transform(nTaxaAtendente2, "@E 9,999,999.99")
        inkey(0)
        exit
    enddo
enddo