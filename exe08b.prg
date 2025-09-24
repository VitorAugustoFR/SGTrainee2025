set scoreBoard off
set date brit
set epoch to 1940
//set mode (25,80)

clear
do while .t.
    //DadosCliente
    cNome       := Space(30)
    nIdade      := 0
    nOrcamento  := 0
    cCor        := "N/G"
    //dNascimento := CToD("")
    //dEntrega    := CToD("")
    //nTaxaEntrega           := 0
    //nResultadoFinal        := 0
    //cEnderecoEntrega       := space(50)
    //cCor                   := space(3)
    //dAtual                 := Date()
    //DadosProduto
    nSubTotal   := 0
    //DadosVariados
    nAbandonar  := 0

    @ 00,00 to 04,79
    @ 00,01 say "MERCADINHO BOLADAO"
    @ 01,01 say "Digite o nome do cliente.....: "
    @ 02,01 say "Digite a Idade do cliente....: "
    @ 03,01 say "Digite o orcamento do cliente: "

    @ 01,31 get cNome      picture("@!") Valid !Empty(cNome)
    @ 02,31 get nIdade                   Valid nIdade > 0
    @ 03,31 get nOrcamento               Valid nOrcamento > 0
    read

    if LastKey() == 27
        nOpcao :=  Alert("O que deseja fazer?", {"Sair", "Continuar"}, "RB+/W+")
        if nOpcao == 1 
            exit
        elseif nOpcao == 2
            
        end if
    end if

    inkey(0)

    do while .t.
        nLinha      := 8

        
        @ 04,00 to 24,79
        @ 04,35 say "PRODUTOS"
        @ 05,01 say "Digite esc para acessar o menu"
        @ 07,15 say " Produto  | Preco  |  Qnt   |  Data  | Total "
        do while .t.

            cDescicao   := Space(10)
            nQuantidade := 0
            nPreco      := 0
            dCompra     := CToD("")
            nResultado  := 0

            @ 06,14 to (nLinha + 1),62
            if nLinha >= 24
                @ 08,00 clear to nLinha,79
                nLinha := 8
            end if


            @ nLinha,15 say "          |        |        |        |"
            @ nLinha,15 get cDescicao   picture "@!"          valid !Empty(cDescicao)
            @ nLinha,26 get nPreco      picture "@E 9,999.99"
            @ nLinha,35 get nQuantidade picture "@E 9,999.99"
            @ nLinha,44 get dCompra                           valid !Empty(dCompra)
            read
            nResultado := nPreco * nQuantidade
            nSubTotal += nResultado
            @ nLinha,53 say Transform(nResultado, "@ 99,999.99") 

            if LastKey() == 27
                nOpcao :=  Alert("O que deseja fazer?", {"Abandonar", "Continuar", "Finalizar"}, "RB+/W+")
                if nOpcao == 1 
                    exit
                    nAbandonar := 1
                elseif nOpcao  == 2

                elseif nOpcao == 3
                    exit
                end if
            end if 
            nLinha++
        enddo
        exit
        inkey(0)
    enddo

    if nAbandonar == 1
        loop
    end if

    clear
    //DadosPagamento
    nValorPago  := 0
    nTroco      := 0
    @ 00,00 to 04,79
    @ 00,35 say "PAGAMENTO"
    @ 01,01 say "Valor entregue: "
    
    @ 01,16 get nValorPago picture ("@E 99,999,999.99") Valid nValorPago <= nOrcamento
    read
    nOrcamento -= nValorPago
    nTroco := nValorPago - nSubTotal
    nOrcamento += nTroco

    if nOrcamento < 0
        cCor := "N/R"
    end if

    @ 03,01 say "Troco " + AllTrim(Str(nTroco))
    @ 04,01 say "Saldo " + AllTrim(Str(nOrcamento))

    if LastKey() == 27
        nOpcao :=  Alert("O que deseja fazer?", {"Abandonar", "Continuar"}, "RB+/W+")
        if nOpcao == 1 
            exit
            nAbandonar := 1
        elseif nOpcao  == 2
        end if
    end if

    if nAbandonar == 1
        loop
    end if
    inkey(0)
enddo