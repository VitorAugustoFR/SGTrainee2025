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
nSerie            := 0
nMensalidade      := 0
nFaltas           := 0
nFaltasTotalUm    := 0
nFaltasTotalDois  := 0
nFaltasTotalTres  := 0
nNota             := 0
nNotaTotalUm      := 0
nNotaTotalDois    := 0
nNotaTotalTres    := 0
nDependencia      := 0

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

@ 04,21 get cNomeAluno       picture "@!" valid !Empty(cNomeAluno)
@ 05,21 get cCurso           picture "@!" valid !Empty(cCurso)
@ 06,21 get dNascimentoAluno valid dNascimentoAluno < (date() - (4*365))
@ 07,21 get nSerie           picture "@E 9" valid nSerie <= 8 .and. nSerie >= 1
@ 08,21 get nMensalidade     picture "@E 9,999.99" valid !Empty(nMensalidade)
@ 09,21 get cDisciplinaUm    picture "@!" valid !Empty(cDisciplinaUm)
@ 10,21 get cDisciplinaDois  picture "@!" valid !Empty(cDisciplinaDois)
@ 11,21 get cDisciplinaTres  picture "@!" valid !Empty(cDisciplinaTres)
read

clear
//Notas do aluno
@ 00,00 to 24,79

@ 01,01 say "Digite agora as notas e as faltas do aluno correspondentes as Tres disciplinas"
@ 03,01 say                "   | Primeiro | Segundo | Terceiro |  Quarto  "
@ 04,01 say cDisciplinaUm +   "|    |     |    |    |    |     |    |"
@ 05,01 say cDisciplinaDois + "|    |     |    |    |    |     |    |"
@ 06,01 say cDisciplinaTres + "|    |     |    |    |    |     |    |"

//Materia 1
@ 04,5 get  nNota picture "999" valid nNota <= 100
@ 04,10 get nFaltas picture "999" valid nFaltas <= 200
read
nNotaTotalUm   += nNota
nFaltasTotalUm += nFaltas

@ 04,16 get nNota picture "999" valid nNota <= 100
@ 04,21 get nFaltas picture "999" valid nFaltas <= 200
read
nNotaTotalUm   += nNota
nFaltasTotalUm += nFaltas

@ 04,26 get nNota picture "999" valid nNota <= 100
@ 04,31 get nFaltas picture "999" valid nFaltas <= 200
read
nNotaTotalUm   += nNota
nFaltasTotalUm += nFaltas

@ 04,37 get nNota picture "999" valid nNota <= 100
@ 04,42 get nFaltas picture "999" valid nFaltas <= 200
read
nNotaTotalUm   += nNota
nFaltasTotalUm += nFaltas

//Materia 2
@ 05,5 get  nNota picture "999" valid nNota <= 100
@ 05,10 get nFaltas picture "999" valid nFaltas <= 200
read
nNotaTotalDois   += nNota
nFaltasTotalDois += nFaltas

@ 05,16 get nNota picture "999" valid nNota <= 100
@ 05,21 get nFaltas picture "999" valid nFaltas <= 200
read
nNotaTotalDois   += nNota
nFaltasTotalDois += nFaltas

@ 05,26 get nNota picture "999" valid nNota <= 100
@ 05,31 get nFaltas picture "999" valid nFaltas <= 200
read
nNotaTotalDois   += nNota
nFaltasTotalDois += nFaltas

@ 05,37 get nNota picture "999" valid nNota <= 100
@ 05,42 get nFaltas picture "999" valid nFaltas <= 200
read
nNotaTotalDois   += nNota
nFaltasTotalDois += nFaltas

//Materia 3
@ 06,5 get  nNota picture "999" valid nNota <= 100
@ 06,10 get nFaltas picture "999" valid nFaltas <= 200
read
nNotaTotalTres   += nNota
nFaltasTotalTres += nFaltas

@ 06,16 get nNota picture "999" valid nNota <= 100
@ 06,21 get nFaltas picture "999" valid nFaltas <= 200
read
nNotaTotalTres   += nNota
nFaltasTotalTres += nFaltas

@ 06,26 get nNota picture "999" valid nNota <= 100
@ 06,31 get nFaltas picture "999" valid nFaltas <= 200
read
nNotaTotalTres   += nNota
nFaltasTotalTres += nFaltas

@ 06,37 get nNota picture "999" valid nNota <= 100
@ 06,42 get nFaltas picture "999" valid nFaltas <= 200
read
nNotaTotalTres   += nNota
nFaltasTotalTres += nFaltas

//Calculo das medias
nMediaUm   := nNotaTotalUm / 4
nMediaDois := nNotaTotalDois / 4
nMediaTres := nNotaTotalTres / 4

nMediaFaltasUm   := nFaltasTotalUm / 4
nMediaFaltasDois := nFaltasTotalDois / 4
nMediaFaltasTres := nFaltasTotalTres / 4

//Mostrando medias e faltas
clear
//Media/Falta 1
cCor := "W/G"
if nSerie <= 4 .and. nMediaUm < 60
    cCor         := "W/R"
    nDependencia++
    cReprovado   += ", " + cDisciplinaUm
elseif nSerie <= 3 .and. nFaltasTotalUm > 6
    cCor := "W/R"
    nDependencia++
    cReprovado   += ", " + cDisciplinaUm
end if
if nMediaUm < 70
    cCor         := "W/R"
    nDependencia++
    cReprovado   += ", " + cDisciplinaUm
elseif nFaltasTotalUm > 8
    cCor := "W/R"
    nDependencia++
    cReprovado   += ", " + cDisciplinaUm
end if
@ 03,01 say "Media de nota em " + cDisciplinaUm + Str(nMediaUm) Color cCor
@ 04,01 say "Total de Faltas em " + cDisciplinaUm + Str(nFaltasTotalUm)

//Media/Falta 2
cCor := "W/G"
if nSerie <= 4 .and. nMediaDois < 60
    cCor         := "W/R"
    nDependencia++
    cReprovado   += ", " + cDisciplinaDois
elseif nSerie <= 3 .and. nFaltasTotalDois > 6
    cCor         := "W/R"
    nDependencia++
    cReprovado   += ", " + cDisciplinaDois
end if
if nMediaDois < 70
    cCor         := "W/R"
    nDependencia++
    cReprovado   += ", " + cDisciplinaDois
elseif nFaltasTotalDois > 8
    cCor         := "W/R"
    nDependencia++
    cReprovado   += ", " + cDisciplinaDois
end if
@ 06,01 say "Media de nota em " + cDisciplinaDois + Str(nMediaDois) Color cCor
@ 07,01 say "Total de Faltas em " + cDisciplinaDois + Str(nFaltasTotalDois)

//Media/Falta 3
cCor := "W/G"
if nSerie <= 4 .and. nMediaTres < 60
    cCor         := "W/R"
    nDependencia++
    cReprovado   += ", " + cDisciplinaTres
elseif nSerie <= 3 .and. nFaltasTotalUm > 6
    cCor         := "W/R"
    nDependencia++
    cReprovado   += ", " + cDisciplinaTres
end if
if nMediaTres < 70
    cCor         := "W/R"
    nDependencia++
    cReprovado   += ", " + cDisciplinaTres
elseif nFaltasTotalTres > 8
    cCor         := "W/R"
    nDependencia++
    cReprovado   += ", " + cDisciplinaTres
end if
@ 09,01 say "Media de nota em " + cDisciplinaTres + Str(nMediaTres) Color cCor
@ 10,01 say "Total de Faltas em " + cDisciplinaTres + Str(nFaltasTotalTres)

clear
//Boletim Final
nMensalidadeFinal := nMensalidade

@ 01,01 say "Boletim escolar"
//Checa se foi reprovado em alguma materia
if nDependencia > 2
    cAprovacao := "Reprovado"
    @ 05,01 say cReprovado
    nMensalidadeFinal := nMensalidade * (1.2 * nDependencia)
elseif nDependencia > 0
    cAprovacao :="aprovado com Pendencia"
    @ 05,01 say cReprovado  
    nMensalidadeFinal := nMensalidade * (1.2 * nDependencia)
end if
//imprimindo tudo na tela
@ 03,01 say "Aluno: " + cNomeAluno + "; " + cAprovacao
@ 04,01 say "Valor da mesalidade apos ano letivo: " + Str(nMensalidadeFinal)