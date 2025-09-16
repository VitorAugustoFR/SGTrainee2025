cSelecionar := "W/W"
nSpawn := hb_RandomInt(1,12)
nMaxSpawn := 7
lAchouBomba := .f.

do while lAchouBomba
    Clear
    @ 00,00 to 13,13
    
    @ 06,03 say " " color cSelecionar
end do