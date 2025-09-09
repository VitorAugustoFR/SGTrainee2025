/*Para fazer:
    colocar sistema de combate
    colocar sistema de knock back
    colocar sistema de colisão de blocos estaticos por array e list
*/
clear
//Player
cPersonagem := "O"
nHspd := 40
nVspd := 12
nVidaPersonagem := 10
nUltimaTecla := LastKey()
//Inimigo
//cInimigoPos := Array{nHspdInimigo, nVspdInimigo}
//nColisao := Array{numeros onde existem blocos de colisao}
cInimigo := "M"
nVidaInimigo := 2
nHspdInimigo := 15
nVspdInimigo := 15
lViuPlayer := .f.
nDistanciaH := nHspd - nHspdInimigo
nDistanciaV := nVspd - nVspdInimigo
    

// se a vida do player for maior que 0
do while nVidaPersonagem > 0

    @ nVspdInimigo,nHspdInimigo say cInimigo
    @ nVspd,nHspd say cPersonagem 
    
    nMovAleatorio := hb_RandomInt(-1,1)
    nDirecaoAleatoria := hb_RandomInt(1,2)
    @ 01,01 say AllTrim(Str(nVidaPersonagem))
    
    //Mov + colisão com a lateral
    //Corrigir a orientaçao da novimentação
    if LastKey() == 87 .or. LastKey() == 119 .and. nHspd > 1//W
        @ nVspd,nHspd clear to nVspd,nHspd
        nHspd--
        @ nVspd,nHspd say cPersonagem
    elseif LastKey() == 83 .or. Lastkey() == 115 .and. nHspd < 23//S
        @ nVspd,nHspd clear to nVspd,nHspd
        nHspd++
        @ nVspd,nHspd say cPersonagem
    elseif LastKey() == 65 .or. LastKey() == 97 .and. nVspd > 1//A
        @ nVspd,nHspd clear to nVspd,nHspd
        nVspd--
        @ nVspd,nHspd say cPersonagem
    elseif LastKey() == 68 .or. LastKey() == 100 .and. nVspd < 78//D
        @ nVspd,nHspd clear to nVspd,nHspd
        nVspd++
        @ nVspd,nHspd say cPersonagem
    end if

    if nHspd == nHspdInimigo .and. nVspd == nVspdInimigo
        nVidaPersonagem -= 1
    end if

    //Inimigo
    //Enquanto a vida do inimigo for maior que zero
    if nVidaInimigo > 0

        // if nHspd <= (nHspdInimigo + 5) .or. (nHspdInimigo - 5) .or. (nHspdInimigo + 5) .or. (nHspdInimigo + 5) .or.

        //Checa se o player esta no campo de target do inimigo
        if nDistanciaH < 5 .or. nDistanciaH > -5 .or. nDistanciaV < 5 .or. nDistanciaV > -5
            lViuPlayer := .t.
        elseif nDistanciaH > 5 .or. nDistanciaH < -5 .or. nDistanciaV > 5 .or. nDistanciaV < -5
            lViuPlayer := .f.
        end if

       //Comportamento do inimigo sem ver o player
        if lViuPlayer == .f.
            if nDirecaoAleatoria == 1 .and. nMovAleatorio == 1
                @ nVspdInimigo,nHspdInimigo clear to nVspdInimigo,nHspdInimigo
                nHspdInimigo++
                @ nVspdInimigo,nHspdInimigo say cInimigo
            elseif nDirecaoAleatoria == 1 .and. nMovAleatorio == 0
                @ nVspdInimigo,nHspdInimigo clear to nVspdInimigo,nHspdInimigo
                nHspdInimigo--
                @ nVspdInimigo,nHspdInimigo say cInimigo
            elseif nDirecaoAleatoria == 2 .and. nMovAleatorio == 1
                @ nVspdInimigo,nHspdInimigo clear to nVspdInimigo,nHspdInimigo
                nVspdInimigo++
                @ nVspdInimigo,nHspdInimigo say cInimigo
            elseif nDirecaoAleatoria == 2 .and. nMovAleatorio == 0
                @ nVspdInimigo,nHspdInimigo clear to nVspdInimigo,nHspdInimigo
                nVspdInimigo--
                @ nVspdInimigo,nHspdInimigo say cInimigo
            end if
            //após corrigir a movimentação do player corrigir a orientação do inimigo
        //comportamento do inimigo após ver o player
        elseif lViuPlayer == .t.
            if nDistanciaH > 0 .and. nDistanciaH < 5
                @ nVspdInimigo,nHspdInimigo clear to nVspdInimigo,nHspdInimigo
                nHspdInimigo++
                @ nVspdInimigo,nHspdInimigo say cInimigo
            elseif nDistanciaV > 0 .and. nDistanciaV < 5
                @ nVspdInimigo,nHspdInimigo clear to nVspdInimigo,nHspdInimigo
                nVspdInimigo++
                @ nVspdInimigo,nHspdInimigo say cInimigo
            elseif nDistanciaH < 0 .and. nDistanciaH > -5
                @ nVspdInimigo,nHspdInimigo clear to nVspdInimigo,nHspdInimigo
                nHspdInimigo--
                @ nVspdInimigo,nHspdInimigo say cInimigo
            elseif nDistanciaV < 0 .and. nDistanciaH > -5
                @ nVspdInimigo,nHspdInimigo clear to nVspdInimigo,nHspdInimigo
                nVspdInimigo--
                @ nVspdInimigo,nHspdInimigo say cInimigo
            end if
        end if
    end if
    Tone(500,1)

    @ 00,00 to 24,79
    inkey(0)
end do

/*if nVidaPersonagem == 0
    nOpca1 := Alert("Game Over", "Jogar Novamente", "Sair")
    if nOpca1 == 1
        loop
    elseif nOpca1 == 2
        clear
        exit
    end if
    loop
end if*/