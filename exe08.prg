set scoreBoard off
clear
cProdutoUm := space(10)
cProdutoDois := space(10)
cProdutoTres := space(10)
nProdutoUmPreco := 0
nProdutoDoisPreco := 0
nProdutoTresPreco := 0
nQuantidade := 0
nResultadoFinal := 0

@ 02,14 to 07,52 double

@ 01,20 say "Mercadinho Boladao:"
@ 03,15 say " Produto  | Preco  |  Qnt   |  Total "
@ 04,15 say "          |        |        |"
@ 05,15 say "          |        |        |"
@ 06,15 say "          |        |        |"

@ 04,15 get cProdutoUm picture "@!" valid !Empty(cProdutoUm)
@ 04,26 get nProdutoUmPreco picture "@E 9,999.99"
@ 04,35 get nQuantidade picture "@E 9,999.99"
read
nResultado := nQuantidade * nProdutoUmPreco
nResultadoFinal += nResultado
@ 04,44 say transform(nResultado, "@E 9,999.99")

@ 05,15 get cProdutoDois picture "@!" valid !Empty(cProdutoDois)
@ 05,26 get nProdutoDoisPreco picture "@E 9,999.99"
@ 05,35 get nQuantidade picture "@E 9,999.99"
read
nResultado := nQuantidade * nProdutoDoisPreco
nResultadoFinal += nResultado
@ 05,44 say transform(nResultado, "@E 9,999.99")

@ 06,15 get cProdutoTres picture "@!" valid !Empty(cProdutoTres)
@ 06,26 get nProdutoTresPreco picture "@E 9,999.99"
@ 06,35 get nQuantidade picture "@E 9,999.99"
read
nResultado := nQuantidade * nProdutoTresPreco
nResultadoFinal += nResultado
@ 06,44 say transform(nResultado, "@E 9,999.99")

@ 08,15 say "Resultado Final: " + transform(nResultadoFinal, "@E 9,999.99")