clear
nMaca := 10
nBanana := 5.25
nMelancia := 20
nQuantidade := 0
nResultadoFinal := 0

@ 02,14 to 07,51

@ 01,20 say "Mercadinho Boladao:"
@ 03,15 say "Produto | Preco  |  Qnt   |  Total  "
@ 04,15 say "Maca    | R$10,00|"
@ 05,15 say "Banana  | R$5,25 |"
@ 06,15 say "Pera    | R$20,00|"

@ 04,33 get nQuantidade picture "@E 9,999.99"
read
nResultado := nQuantidade * nMaca
nResultadoFinal += nResultado
@ 04,41 say "| " + transform(nResultado, "@E 9,999.99")

@ 05,33 get nQuantidade picture "@E 9,999.99"
read
nResultado := nQuantidade * nBanana
nResultadoFinal += nResultado
@ 05,41 say "| " + transform(nResultado, "@E 9,999.99")

@ 06,33 get nQuantidade picture "@E 9,999.99"
read
nResultado := nQuantidade * nMelancia
nResultadoFinal += nResultado
@ 06,41 say "| " + transform(nResultado, "@E 9,999.99")

@ 08,15 say "Resultado Final: " + transform(nResultadoFinal, "@E 9,999.99")