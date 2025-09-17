cSelecionar := "W/W"
nSpawnRandomizer := hb_RandomInt(1,12)
nSpawnH = {0}
nSpawnV := {0}
nBombasNoMapa := 0
nMaxSpawn := 7
lAchouBomba := .f.

Clear
do while nBombasNoMapa <= nMaxSpawn
    nSpawnH += nSpawnRandomizer 
    @ 05,nBombasNoMapa say AllTrim(Str(nSpawnH))
    nBombasNoMapa++
end do
do while lAchouBomba
    Clear
    @ 00,00 to 13,13
    
    @ 06,03 say " " color cSelecionar
end do