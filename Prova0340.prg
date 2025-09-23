//Vitor Augusto Faria Ramalho
set date british
set epoch to 1940
set scoreBoard off


do while .t.

    clear
    //Quantidade de colaboradores
    nEmpregados                   := 0
    nEmpregadoAtual               := 0
    //Dados gerais
    nTotalHomens                  := 0
    nTotalMulheres                := 0
    nRemuneracaoTotal             := 0
    nHomensMaisQue80              := 0
    nMulheresAdmitidasAntesDe2003 := 0
    nHomensDemitidosDepoisDe2015  := 0
    nValorTotalRemuneracao        := 0
    
    //Solicitando o numero de empregados
    @ 00,00 to 02,79
    
    @ 00,33 say "CONTROLE INSS"
    @ 01,01 say "Insira o numero de colaboradores: "
    
    @ 01,35 get nEmpregados valid !Empty(nEmpregados)
    read
    
    nOpcao := 0
    if LastKey() == 27
        nOpcao := Alert("O que deseja fazer?", {"Cancelar", "Retornar"})
        if nOpcao     == 1
            exit
        elseif nOpcao == 2
            loop
        end if
    end if
    
    do while .t.
        nEmpregadoAtual++
        //Dados do colaborador
        cNomeColaborador        := Space(30)
        cSexo                   := Space(1)
        dNascimento             := CToD("")
        dAdmissao               := CToD("")
        dDemissao               := CToD("")
        nValorSalarioBase       := 0
        nValorSalarioFinal      := 0
        nAdicionalNoturno       := 0
        nAdicionalInsalubridade := 0

        clear
        @ 00,00 to 09,79

        @ 00,29 say "DADOS DO COLABORADOR"
        @ 01,01 say "Digite o nome do(a) colaborador(a): "
        @ 02,01 say "O sexo............................: "
        @ 03,01 say "A data de nascimento..............: "
        @ 04,01 say "A data de admissao................: "
        @ 05,01 say "A data da demissao................:"
        @ 06,01 say "O valor do salario base...........: "
        @ 07,01 say "O adicional noturno...............: "
        @ 08,01 say "O adicional de insalubridade......: "

        @ 01,37 get cNomeColaborador        picture("@!")           valid !Empty(cNomeColaborador)
        @ 02,37 get cSexo                   picture("@!")           valid cSexo $ "MF"
        @ 03,37 get dNascimento                                     valid !Empty(dNascimento)
        @ 04,37 get dAdmissao                                       valid !Empty(dAdmissao)
        @ 05,37 get dDemissao                                       valid !Empty(dDemissao)
        @ 06,37 get nValorSalarioBase       picture("@E 99,999.99") valid !Empty(nValorSalarioBase)
        @ 07,37 get nAdicionalNoturno       picture ("@E 999.99")    valid !Empty(nAdicionalNoturno)
        @ 08,37 get nAdicionalInsalubridade picture ("@E 999.99")    valid !Empty(nAdicionalInsalubridade)
        read

        //Menu
        nOpcao2 := 0
        if LastKey() == 27
            nOpcao2 := Alert("O que deseja fazer?", {"Cancelar", "Retornar", "Processar"})
            if nOpcao2     == 1
                exit
            elseif nOpcao2 == 2
                loop
            elseif nOpcao2 == 3

            end if
        end if
        //Valor do salario final
        nValorSalarioFinal := nValorSalarioBase

        //Variaveis para Validações
        nTempoDeContribuicao := (dDemissao - dAdmissao) / 365
        nIdade               := (Date() - dNascimento) / 365
        nAnoAdmissao         := Year(dAdmissao)
        nAnoDemissao         := Year(dDemissao)

        //Checando se a aposentadoria é valida, + validação dos dados
        if cSexo    == "M"
            if nIdade >= 65 .and. nTempoDeContribuicao >= 30
                nTotalHomens++
            else
                nOpcao3 := 0
                nOpcao3 := Alert ("Inapto a receber aposentadoria", {"Inserir outro funcionario", "Sair"})
                if nOpcao3     == 1
                    loop
                elseif nOpcao3 == 2
                    exit
                end if
            end if

            //Dados
            if dNascimento - date() > 80 
                nHomensMaisQue80++
            end if
            if dnAnoDemissao == 2015
                nHomensDemitidosDepoisDe2015++
            end if
        elseif cSexo =="F"
            if nIdade >= 60 .and. nTempoDeContribuicao >= 25
                nTotalMulheres++
            else
                nOpcao3 := 0
                nOpcao3 := Alert ("Inapto a receber aposentadoria", {"Inserir outro funcionario", "Sair"})
                if nOpcao3     == 1
                    loop
                elseif nOpcao3 == 2
                    exit
                end if
            end if

            //Dados
            if nAnoAdmissao < 2003
            nMulheresAdmitidasAntesDe2003++
            end if
        end if

        //Calculo da remuneração da aposentadoria
        if nAdicionalNoturno > 0
            nValorSalarioFinal += nValorSalarioBase * (nAdicionalNoturno/100)
        end if
        if nAdicionalInsalubridade > 0
            nValorSalarioFinal += nValorSalarioBase * (nAdicionalInsalubridade/100)
        end if
        if nAnoAdmissao >= 2005
            nValorSalarioFinal += nValorSalarioBase * 0.08
        end if
        if nAnoAdmissao >= 2012
            nValorSalarioFinal -= nValorSalarioBase * 0.03
        end if
        nValorTotalRemuneracao += nValorSalarioFinal

        //Dados
        if nEmpregadoAtual == nEmpregados
            exit
        end if
    end do

    //Resultado
    nTotalAposentados   := nTotalHomens + nTotalMulheres
    nPercentualHomens   := (nTotalHomens * 100) / nTotalAposentados
    nPercentualMulheres := (nTotalMulheres * 100) / nTotalAposentados
    Clear
    @ 00,00 to 08,79
    @ 00,30 say "INFORMACOES FINAIS"
    @ 01,01 say "Percentual de homens aposentados..................: " + Transform(nPercentualHomens, "@E 999.99")
    @ 02,01 say "Percentual de mulheres aposentadas................: " + Transform(nPercentualMulheres, "@E 999.99")
    @ 03,01 say "Valor total da remuneracao........................: " + Transform(nValorTotalRemuneracao, "@E 9,999,999.99")
    @ 05,01 say "Quantidade de homens com idade superior a 80 anos.: " + AllTrim(Str(nHomensMaisQue80))
    @ 06,01 say "Quantidade de mulheres admitidas antes do ano 2003: " + AllTrim(Str(nMulheresAdmitidasAntesDe2003))
    @ 07,01 say "Quantidade de homens demitidos no ano de 2015.....: " + AllTrim(Str(nHomensDemitidosDepoisDe2015))
    inkey(0)
end do