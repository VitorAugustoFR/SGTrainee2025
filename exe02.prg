clear
cNome  := Space(50)
nIdade := 0
nPeso  := 0

@ 01,01 say "Digite:"
@ 02,01 say "Nome: "
@ 03,01 say "Idade: "
@ 04,01 say "Peso: "

@ 02,07 get cNome
@ 03,08 get nIdade picture "999" valid nIdade >= 0
@ 04,07 get nPeso picture "@E 999.9" valid nPeso >= 0
read