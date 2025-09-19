cSelecionar := "W/W"
nSpawnRandomizer := hb_RandomInt(1,12)
nPosicaoSelecaoH := 3
nPosicaoSelecaoV := 6
nSpawnH = {0}
nSpawnV := {0}
nBombasNoMapa := 0
nMaxSpawn := 7
lAchouBomba := .f.

Clear
//do while nBombasNoMapa <= nMaxSpawn
//    nSpawnH := nSpawnRandomizer 
//    @ 05,nBombasNoMapa say AllTrim(Str(nSpawnH))
//    nBombasNoMapa++
//end do
do while lAchouBomba
    Clear
    @ 00,00 to 13,13
    
    @ nPosicaoSelecaoV,nPosicaoSelecaoH3 say " " color cSelecionar

    if LastKey() == 5
        nPosicaoSelecaoV--
    elseif LastKey() == 24
        nPosicaoSelecaoV++
    elseif LastKey() == 19
        nPosicaoSelecaoH--
    elseif LastKey() == 4
        nPosicaoSelecaoH++
    end if
    Inkey(0)
end do