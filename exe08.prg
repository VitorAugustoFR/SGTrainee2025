set scoreBoard off
set date brit
set epoch to 1940
//set mode (25,80)

clear
do while .t.
    clear
    cNome                  := space(50)
    cProdutoUm             := space(10)
    cProdutoDois           := space(10)
    cProdutoTres           := space(10)
    cEnderecoEntrega       := space(50)
    cCor                   := space(3)
    dAtual                 := Date()
    dCompraUm              := CToD("")
    dCompraDois            := CToD("")
    dCompraTres            := CToD("")
    dNascimento            := CToD("")
    dEntrega               := CToD("")
    nOrcamento             := 0
    nProdutoUmPreco        := 0
    nProdutoDoisPreco      := 0
    nProdutoTresPreco      := 0
    nProdutoUmQuantidade   := 0
    nProdutoDoisQuantidade := 0
    nProdutoTresQuantidade := 0
    nProdutoUmResultado    := 0
    nProdutoDoisResultado  := 0
    nProdutoTresResultado  := 0
    nTaxaEntrega           := 0
    nResultadoFinal        := 0

    //Dados cliente

    @ 01,01 say "Digite seu nome: "
    @ 02,01 say "Digite sua data de nascimento: "
    @ 03,01 say "Digite quanto voce tem disponivel para gastar: "

    @ 01,18 get cNome picture "@!" valid !Empty(cNome)
    @ 02,32 get dNascimento        valid !Empty(dNascimento)
    @ 03,48 get nOrcamento
    read
    if LastKey() == 27
        nOpcao := Alert("Deseja sair?", {"Sim","Nao"})
        if nOpcao == 1
            exit
        elseif nOpcao == 2
            loop
        end if
    end if

    inkey(0)

    clear

    @ 00,00 to 24,79
    @ 04,14 to 09,60 double

    @ 03,30 say "Mercadinho Boladao:"
    @ 05,15 say " Produto  | Preco  |  Qnt   |  Data  | Total "
    @ 06,15 say "          |        |        |        |"
    @ 07,15 say "          |        |        |        |"
    @ 08,15 say "          |        |        |        |"

    //calculo produto um
    @ 06,15 get cProdutoUm           picture "@!"          valid !Empty(cProdutoUm)
    @ 06,26 get nProdutoUmPreco      picture "@E 9,999.99"
    @ 06,35 get nProdutoUmQuantidade picture "@E 9,999.99"
    @ 06,44 get dCompraUm                                  valid !Empty(dCompraUm)
    read
    nProdutoUmResultado := nProdutoUmQuantidade * nProdutoUmPreco
    nResultadoFinal     += nProdutoUmResultado
    @ 06,52 say transform(nProdutoUmResultado, "@E 9,999.99")

    //calculo produto 2
    @ 07,15 get cProdutoDois           picture "@!"          valid !Empty(cProdutoDois)
    @ 07,26 get nProdutoDoisPreco      picture "@E 9,999.99"
    @ 07,35 get nProdutoDoisQuantidade picture "@E 9,999.99"
    @ 07,44 get dCompraDois                                  valid !Empty(dCompraDois)
    read
    nProdutoDoisResultado := nProdutoDoisQuantidade * nProdutoDoisPreco
    nResultadoFinal       += nProdutoDoisResultado
    @ 07,52 say transform(nProdutoDoisResultado, "@E 9,999.99")

    //calculo produto 3
    @ 08,15 get cProdutoTres           picture "@!"          valid !Empty(cProdutoTres)
    @ 08,26 get nProdutoTresPreco      picture "@E 9,999.99"
    @ 08,35 get nProdutoTresQuantidade picture "@E 9,999.99"
    @ 08,44 get dCompraTres                                  valid !Empty(dCompraTres)
    read
    if LastKey() == 27
        nOpcao2 := Alert("O que deseja fazer?", {"Continuar","","Sair"})
        if nOpcao2 == 1

        elseif nOpcao2 == 2
            loop
        elseif nOpcao2 == 3
            exit
        end if
    end if
    nProdutoTresResultado := nProdutoTresQuantidade * nProdutoTresPreco
    nResultadoFinal       += nProdutoTresResultado
    @ 08,52 say transform(nProdutoTresResultado, "@E 9,999.99")

    @ 10,01 say "Digite o Endereco de entrega: "
    @ 13,01 say "Digite o prazo de entrega: "
    @ 16,01 say "Digite a taxa de entrega: "

    @ 11,01 get cEnderecoEntrega picture "@!" valid !Empty(cEnderecoEntrega)
    @ 14,01 get dEntrega                      valid dEntrega > date() + 5
    @ 17,01 get nTaxaEntrega     picture "@E 999.99"
    read
    if LastKey() == 27
        loop
    end if

    nResultadoFinal += nTaxaEntrega

    cCor:="W/W"
    if nOrcamento > nResultadoFinal
        cCor := "W/G"
    elseif nOrcamento < nResultadoFinal
        cCor := "W/R"
    end if

    inkey(0)

    //nota fiscal
    clear
    nDiasEntrega := (dEntrega - Date())/365

    @ 00,00 to 24,79
    @ 04,14 to 12,62 double
    @ 12,14 to 15,62 double

    @ 03,32 say "Nota Fiscal:"
    @ 05,15 say " Produto  | Preco  |  Qnt   |  Data  |  Total "
    @ 06,15 say cProdutoUm   + "|" + transform(nProdutoUmPreco, "@E 9,999.99")   + "|" + transform(nProdutoUmQuantidade, "@E 9,999.99")   + "|" + DToC(dCompraUm)   + "|" + transform(nProdutoUmResultado, "@E 9,999.99")
    @ 07,15 say cProdutoDois + "|" + transform(nProdutoDoisPreco, "@E 9,999.99") + "|" + transform(nProdutoDoisQuantidade, "@E 9,999.99") + "|" + DToC(dCompraDois) + "|" + transform(nProdutoDoisResultado, "@E 9,999.99")
    @ 08,15 say cProdutoTres + "|" + transform(nProdutoTresPreco, "@E 9,999.99") + "|" + transform(nProdutoTresQuantidade, "@E 9,999.99") + "|" + DToC(dCompraTres) + "|" + transform(nProdutoTresResultado, "@E 9,999.99")

    @ 10,15 say "Dias ate seu produto chegar: " + transform(nDiasEntrega,"@E 999")
    @ 11,15 say "Seu produto chegara em: "      + DToC(dEntrega)
    @ 13,15 say "Saldo: R$"                     + AllTrim(transform((nOrcamento-nResultadoFinal),"@E 999,999.99")) Color cCor
    @ 14,15 say "Resultado Final: R$"           + AllTrim(transform(nResultadoFinal, "@E 999,999.99"))             Color cCor

    inkey(0)
    Alert("Agradecemos a sua preferencia")
end do