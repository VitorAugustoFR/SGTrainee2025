clear
nMaca := 10
nBanana := 5.25
nMelancia := 20
nQuantidade := 0

@ 00,00 to 15,60

@ 01,20 say "Mercadinho Boladao:"
@ 02,01 say "Preco da Maca: " + AllTrim(Str(nMaca))
@ 03,01 say "Preco da Banana: " + AllTrim(Transform(nBanana, "@E 9,99"))
@ 04,01 say "Preco da Melancia: " + AllTrim(Str(nMelancia))