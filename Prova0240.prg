//Vitor Augusto Faria Ramalho
set epoch to 1940
set date british
set scoreBoard off

clear

//Variaveis
//Dados cabeçalho
cNomeVendedor  := Space(30)
dCotacao       := date()
//Dados Pessoais
cNome          := space(30)
nIdade         := 0
cSexo          := Space(1)
nPeso          := 0
nAltura        := 0
cFumante       := Space(1)
//Dados plano
cTipodePlano   := Space(1)
cAbrangencia   := Space(1)
//Saude Total
nSaudeTotal    := 300
cCorSaudeTotal := "W/G"
//Vida Pura
nVidaPura      := 320
cCorVidaPura   := "W/G"

@ 00,00 to 02,79
//Cabeçalho
@ 00,26 say "COTACAO DE PLANOS DE SAUDE"
@ 01,01 say "Vendedor:                                    " + "Data da cotacao: "

@ 01,09 get cNomeVendedor picture("@!") valid !Empty(cNomeVendedor)
@ 01,61 get dCotacao                    valid !Empty(dCotacao)
read

@ 04,00 to 10,79
//Dados pessoais
@ 04,32 say "DADOS PESSOAIS"
@ 05,01 say "Nome........:                                  " + "Idade: "
@ 06,01 say "Sexo........: " + "  [M]asculino  [F]eminino"
@ 07,01 say "Peso (kg)...: "
@ 08,01 say "Altura (m)..: "
@ 09,01 say "Fumante?....: " + "  [S]im  [N]ao"

@ 05,14 get cNome    picture ("@!")       valid !Empty(cNome)
@ 05,54 get nIdade   picture("@E 999")    valid !Empty(nIdade)
@ 06,14 get cSexo    picture ("@!")       valid cSexo $ "MF"
@ 07,14 get nPeso    picture ("@E 999.9") valid !Empty(nPeso)
@ 08,14 get nAltura  picture("@E 9.99")   valid !Empty(nAltura)
@ 09,14 get cFumante picture("@!")        valid cFumante $ "SN"
read

@ 11,00 to 14,79
//Dados do Plano
@ 11,32 say "DADOS DO PLANO"
@ 12,01 say "Tipo do plano: " + "  [E]nf  [A]part  [V]ip"
@ 13,01 say "Abrangencia..: " + "  [R]egional  [N]acional"

@ 12,15 get cTipodePlano picture("@!") valid cTipodePlano $ "EAV"
@ 13,15 get cAbrangencia picture("@!") valid cAbrangencia $ "RN"
read

//Calulos
nImc := nPeso / (nAltura * nAltura)
nMes := Month(dCotacao)
nAno := Year(dCotacao)

//Saude Total
if nIdade           < 30
    nSaudeTotal     *= 0.9
elseif nIdade       > 60
    nSaudeTotal     *= 1.2
endif

if cSexo            == "M"
    nSaudeTotal     *= 1.05
    nVidaPura       *=  0.95
elseif cSexo        == "F"
    nSaudeTotal     *= 0.95
    nVidaPura       *= 1.1
endif

if nImc             > 30
    nSaudeTotal     *= 1.15
endif

if cFumante         == "S"
    nSaudeTotal     *= 1.2
    nVidaPura       *= 1.25
endif

if cTipodePlano     == "A"
    nSaudeTotal     *= 1.3
    nVidaPura       *= 1.25
elseif cTipodePlano == "V"
    nSaudeTotal     *= 1.5
    nVidaPura       *= 1.45
endif

if cAbrangencia     == "N"
    nSaudeTotal     *= 1.15
    nVidaPura       *= 1.1
endif

if nMes             == 5
    nSaudeTotal     *= 0.9
endif

//Vida Pura
if nIdade           < 25
    nVidaPura       *= 0.85
elseif nIdade       > 65
    nVidaPura       *= 1.25
endif

if nImc             > 25
    nVidaPura       *= 1.1
endif

if nMes             == 5
    nVidaPura       *= 0.85
endif

//Imprimindo os resultados
if nVidaPura       > nSaudeTotal
    cCorVidaPura   := "W/R"
else
    cCorSaudeTotal := "W/R"
endif

//Imprimindo os valores
@ 15,00 to 21,40                                                                                Color cCorSaudeTotal

@ 16,01 say "SAUDE TOTAL                            "                                           Color cCorSaudeTotal
@ 17,01 to 17,39                                                                                Color cCorSaudeTotal
@ 18,01 say "Mensal......: " + Transform(nSaudeTotal, "@E 99,999.99")      + "                " Color cCorSaudeTotal
@ 19,01 say "Trimestral..: " + Transform(nSaudeTotal * 3, "@E 99,999.99")  + "                " Color cCorSaudeTotal
@ 20,01 say "Anual.......: " + Transform(nSaudeTotal * 12, "@E 99,999.99") + "                " Color cCorSaudeTotal

@ 15,41 to 21,79                                                                                Color cCorVidaPura

@ 16,42 say "VIDA PURA                            "                                             Color cCorVidaPura
@ 17,42 to 17,78                                                                                Color cCorVidaPura
@ 18,42 say "Mensal......: " + Transform(nVidaPura, "@E 99,999.99")      + "              "     Color cCorVidaPura
@ 19,42 say "Trimestral..: " + Transform(nVidaPura * 3, "@E 99,999.99")  + "              "     Color cCorVidaPura
@ 20,42 say "Anual.......: " + Transform(nVidaPura * 12, "@E 99,999.99") + "              "     Color cCorVidaPura
 
//Validade da cotacao
if nMes < 12
    dUltimoDiaDoMes := CToD("01/" + AllTrim(Str(nMes + 1)) + Alltrim(Str(nAno))) - 1
else
    nMes := 1
    dUltimoDiaDoMes := CToD("01/" + AllTrim(Str(nMes)) + Alltrim(Str(nAno + 1))) - 1
endif

@ 24,26 say "Cotacao valida ate "  + DToC(dUltimoDiaDoMes)
Inkey(0)