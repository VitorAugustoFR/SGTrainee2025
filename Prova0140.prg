//Vitor Augusto Faria Ramalho
set date british
set epoch to 1940
set scoreBoard off

//Variaveis
//Strings
cNomeAluno        := Space(50)
cDisciplinaUm     := Space(3)
cDisciplinaDois   := Space(3)
cDisciplinaTres   := Space(3)
cCurso            := Space(50)
cCor              := Space(3)
cAprovacao        := "Aprovado"
cReprovado        := "Reprovado em "
//Datas
dNascimentoAluno  := CToD("")
//Numericos
nSerie              := 0
nMensalidade        := 0
//Faltas
nFaltaUmPrimeiroBi  := 0
nFaltaUmSegundoBi   := 0
nFaltaUmTerceiroBi  := 0
nFaltaUmQuartoBi    := 0
nMediaFaltasUm      := 0
nFaltaDoisPrimeiroBi  := 0
nFaltaDoisSegundoBi   := 0
nFaltaDoisTerceiroBi  := 0
nFaltaDoisQuartoBi    := 0
nMediaFaltasDois    := 0
nFaltaTresPrimeiroBi  := 0
nFaltaTresSegundoBi   := 0
nFaltaTresTerceiroBi  := 0
nFaltaTresQuartoBi    := 0
nMediaFaltasTres    := 0
//Notas
nNotaUmPrimeiroBi   := 0
nNotaUmSegundoBi    := 0
nNotaUmTerceiroBi   := 0
nNotaUmQuartoBi     := 0
nMediaUm            := 0
nNotaDoisPrimeiroBi := 0
nNotaDoisSegundoBi  := 0
nNotaDoisTerceiroBi := 0
nNotaDoisQuartoBi   := 0
nMediaDois          := 0
nNotaTresPrimeiroBi := 0
nNotaTresSegundoBi  := 0
nNotaTresTerceiroBi := 0
nNotaTresQuartoBi   := 0
nMediaTres          := 0
//Dependencia
nDependencia        := 0

clear
@ 00,00 to 24,79
//Dados do aluno e do curso
@ 01,01 say "Escola municipal de Maringa"
@ 03,01 say "Digite os dados do aluno"
@ 04,01 say "Nome              : "
@ 05,01 say "Curso             : "
@ 06,01 say "Data de Nascimento: "
@ 07,01 say "Serie             : "
@ 08,01 say "Mensalidade       : "
@ 09,01 say "Disciplina 1      : "
@ 10,01 say "Disciplina 2      : "
@ 11,01 say "Disciplina 3      : "

@ 04,21 get cNomeAluno       picture "@!"          valid !Empty(cNomeAluno)
@ 05,21 get cCurso           picture "@!"          valid !Empty(cCurso)
@ 06,21 get dNascimentoAluno                       valid dNascimentoAluno < (date() - (4*365))
@ 07,21 get nSerie           picture "@E 9"        valid nSerie <= 8 .and. nSerie >= 1
@ 08,21 get nMensalidade     picture "@E 9,999.99" valid !Empty(nMensalidade)
@ 09,21 get cDisciplinaUm    picture "@!"          valid !Empty(cDisciplinaUm)
@ 10,21 get cDisciplinaDois  picture "@!"          valid !Empty(cDisciplinaDois)
@ 11,21 get cDisciplinaTres  picture "@!"          valid !Empty(cDisciplinaTres)
read

clear
//Notas do aluno
@ 00,00 to 24,79
@ 02,00 to 07,46
@ 02,48 say "Serie: " + AllTrim(Str(nSerie))


@ 01,01 say "Digite agora as notas e as faltas do aluno correspondentes as Tres disciplinas"
@ 03,01 say                "   | Primeiro | Segundo | Terceiro |  Quarto  "
@ 04,01 say cDisciplinaUm   + "|    |     |    |    |    |     |    |"
@ 05,01 say cDisciplinaDois + "|    |     |    |    |    |     |    |"
@ 06,01 say cDisciplinaTres + "|    |     |    |    |    |     |    |"
@ 03,48 say "Necessario para passar"
@ 04,48 say "serie:1/4 nota:60; 5/8 70"
@ 06,48 say "serie:1/3 Falta:6; 4/8 8"

//Materia 1
@ 04,5  get nNotaUmPrimeiroBi    picture "999" valid nNotaUmPrimeiroBi  <= 100
@ 04,10 get nFaltaUmPrimeiroBi   picture "999" valid nFaltaUmPrimeiroBi <= 200
@ 04,16 get nNotaUmSegundoBi     picture "999" valid nNotaUmSegundoBi   <= 100
@ 04,21 get nFaltaUmSegundoBi    picture "999" valid nFaltaUmSegundoBi  <= 200
@ 04,26 get nNotaUmTerceiroBi    picture "999" valid nNotaUmTerceiroBi  <= 100
@ 04,31 get nFaltaUmTerceiroBi   picture "999" valid nFaltaUmTerceiroBi <= 200
@ 04,37 get nNotaUmQuartoBi      picture "999" valid nNotaUmQuartoBi    <= 100
@ 04,42 get nFaltaUmQuartoBi     picture "999" valid nFaltaUmQuartoBi   <= 200
//Materia 2
@ 05,5  get nNotaDoisPrimeiroBi  picture "999" valid nNotaDoisPrimeiroBi  <= 100
@ 05,10 get nFaltaDoisPrimeiroBi picture "999" valid nFaltaDoisPrimeiroBi <= 200
@ 05,16 get nNotaDoisSegundoBi   picture "999" valid nNotaDoisSegundoBi   <= 100
@ 05,21 get nFaltaDoisSegundoBi  picture "999" valid nFaltaDoisSegundoBi  <= 200
@ 05,26 get nNotaDoisTerceiroBi  picture "999" valid nNotaDoisTerceiroBi  <= 100
@ 05,31 get nFaltaDoisTerceiroBi picture "999" valid nFaltaDoisTerceiroBi <= 200
@ 05,37 get nNotaDoisQuartoBi    picture "999" valid nNotaDoisQuartoBi    <= 100
@ 05,42 get nFaltaTresQuartoBi   picture "999" valid nFaltaTresQuartoBi   <= 200
//Materia 3
@ 06,5  get nNotaTresPrimeiroBi  picture "999" valid nNotaTresPrimeiroBi  <= 100
@ 06,10 get nFaltaTresPrimeiroBi picture "999" valid nFaltaTresPrimeiroBi <= 200
@ 06,16 get nNotaTresSegundoBi   picture "999" valid nNotaTresSegundoBi   <= 100
@ 06,21 get nFaltaTresSegundoBi  picture "999" valid nFaltaTresSegundoBi  <= 200
@ 06,26 get nNotaTresTerceiroBi  picture "999" valid nNotaTresTerceiroBi  <= 100
@ 06,31 get nFaltaTresTerceiroBi picture "999" valid nFaltaTresTerceiroBi <= 200
@ 06,37 get nNotaTresQuartoBi    picture "999" valid nNotaTresQuartoBi    <= 100
@ 06,42 get nFaltaTresQuartoBi   picture "999" valid nFaltaTresQuartoBi   <= 200
read

//Calculo das medias
nMediaUm         := (nNotaUmPrimeiroBi   + nNotaUmSegundoBi   + nNotaUmTerceiroBi   + nNotaUmQuartoBi)       / 4
nMediaDois       := (nNotaDoisPrimeiroBi + nNotaDoisSegundoBi + nNotaDoisTerceiroBi + nNotaDoisQuartoBi)     / 4
nMediaTres       := (nNotaTresPrimeiroBi + nNotaTresSegundoBi + nNotaTresTerceiroBi + nNotaTresQuartoBi)     / 4

nMediaFaltasUm   := (nFaltaUmPrimeiroBi   + nFaltaUmSegundoBi   + nFaltaUmTerceiroBi   + nFaltaUmQuartoBi)   / 4
nMediaFaltasDois := (nFaltaDoisPrimeiroBi + nFaltaDoisSegundoBi + nFaltaDoisTerceiroBi + nFaltaDoisQuartoBi) / 4
nMediaFaltasTres := (nFaltaTresPrimeiroBi + nFaltaTresSegundoBi + nFaltaTresTerceiroBi + nFaltaTresQuartoBi) / 4

//Mostrando medias e faltas
@ 07,00 to 16,29
//Media/Falta 1
cCor := "W/G"
if nSerie <= 4 .and. nMediaUm <= 60
    cCor         := "W/R"
    nDependencia++
    cReprovado   += cDisciplinaUm + ", "
elseif nSerie <= 3 .and. nMediaFaltasUm > 6
    cCor := "W/R"
    nDependencia++
    cReprovado   += cDisciplinaUm + ", "
end if
if nMediaUm <= 70
    cCor         := "W/R"
    nDependencia++
    cReprovado   += cDisciplinaUm + ", "
elseif nMediaFaltasUm > 8
    cCor := "W/R"
    nDependencia++
    cReprovado   += cDisciplinaUm + ", "
end if
@ 08,01 say "Media de nota em "   + cDisciplinaUm + " " + AllTrim(Str(nMediaUm)) Color cCor
@ 09,01 say "Total de Faltas em " + cDisciplinaUm + " " + AllTrim(Str(nMediaFaltasUm)) Color cCor

//Media/Falta 2
cCor := "W/G"
if nSerie <= 4 .and. nMediaDois <= 60
    cCor         := "W/R"
    nDependencia++
    cReprovado   += cDisciplinaDois + ", "
elseif nSerie <= 3 .and. nMediaFaltasDois > 6
    cCor         := "W/R"
    nDependencia++
    cReprovado   += cDisciplinaDois + ", "
end if
if nMediaDois <= 70
    cCor         := "W/R"
    nDependencia++
    cReprovado   += cDisciplinaDois + ", "
elseif nMediaFaltasDois > 8
    cCor         := "W/R"
    nDependencia++
    cReprovado   += cDisciplinaDois + ", "
end if
@ 11,01 say "Media de nota em "   + cDisciplinaDois + " " + AllTrim(Str(nMediaDois)) Color cCor
@ 12,01 say "Total de Faltas em " + cDisciplinaDois + " " + AllTrim(Str(nMediaFaltasDois)) Color cCor

//Media/Falta 3
cCor := "W/G"
if nSerie <= 4 .and. nMediaTres <= 60
    cCor         := "W/R"
    nDependencia++
    cReprovado   += cDisciplinaTres + ", "
elseif nSerie <= 3 .and. nMediaFaltasTres > 6
    cCor         := "W/R"
    nDependencia++
    cReprovado   += cDisciplinaTres + ", "
end if
if nMediaTres <= 70
    cCor         := "W/R"
    nDependencia++
    cReprovado   += cDisciplinaTres + ", "
elseif nMediaFaltasTres > 8
    cCor         := "W/R"
    nDependencia++
    cReprovado   += cDisciplinaTres + ", "
end if
@ 14,01 say "Media de nota em "   + cDisciplinaTres + " " + AllTrim(Str(nMediaTres)) Color cCor
@ 15,01 say "Total de Faltas em " + cDisciplinaTres + " " + AllTrim(Str(nMediaFaltasTres)) Color cCor
Inkey(0)

@ 17,01 say "Passou" Color "W/G"
@ 18,01 say "Ficou Pendente" Color "R/W"
@ 19,01 say "Reprovou" Color "W/R"

@ 20,00 to 24,70
//Boletim Final
nMensalidadeFinal := nMensalidade

@ 01,01 say "Boletim escolar"
//Checa se foi reprovado em alguma materia
cCor := "W/G"
if nDependencia > 2
    cCor := "W/R"
    cAprovacao := cReprovado
    @ 05,01 say cReprovado
    nMensalidadeFinal := nMensalidade * (1.2 * nDependencia)
elseif nDependencia > 0
    cCor := "R/W"
    cAprovacao := cReprovado
    @ 05,01 say cReprovado  
    nMensalidadeFinal := nMensalidade * (1.2 * nDependencia)
end if
//imprimindo tudo na tela
@ 21,01 say "Aluno: " + AllTrim(cNomeAluno)
@ 22,01 say cAprovacao + "Tera um acrescimo de " + AllTrim(Str(20 * nDependencia)) + "%" Color cCor
@ 23,01 say "Valor da mesalidade apos ano letivo: R$" + AllTrim(Str(nMensalidadeFinal))