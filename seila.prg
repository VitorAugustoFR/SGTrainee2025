//set mode(25,80)
//gdImageLine()   Draws a line between two end points (x1, y1 and x2, y2) with a particular color index.
/*Para fazer:
    colocar sistema de combate
        Para guardar a ultima posição de movimento, guardar numero da ultima tecla de movimento + achar alguma forma de armazenar a ultima tecla de movimento pressionada, sem sobre por a tecla de ataque 
    colocar sistema de knock back
    colocar sistema de colisão de blocos estaticos por array e list
*/
clear
//Player
cPersonagem     := "G/G"
cArma           := "B/B"
nHspd           := 40
nVspd           := 12
//nPosicaoPlayer := {Vspd,Hspd}
nVidaPersonagem := 10
//Inimigo
//cInimigoPos := {nHspdInimigo, nVspdInimigo}
//nColisaoHEstatica := {Numeros onde existem objetos colidiveis horizontalmente}
//nColisaoVEstatica := {Numeros onde existem objetos colidiveis verticalmente}
cInimigo        := "R/R"
nVidaInimigo    := 2
nHspdInimigo    := 15
nVspdInimigo    := 15
nDistanciaH     := nHspd - nHspdInimigo
nDistanciaV     := nVspd - nVspdInimigo
    

do while .t.

    nPosicaoArmaV   := nVspd
    nPosicaoArmaH   := nHspd
    lViuPlayer      := .f.
    // se a vida do player for maior que 0
    //Transformar em if e criar um do while que engloba tudo
    if nVidaPersonagem > 0

        @ nVspdInimigo,nHspdInimigo say " " Color cInimigo
        @ nVspd,nHspd say " " Color cPersonagem 

        nMovAleatorio      := hb_RandomInt(1,2)
        nDirecaoAleatoria  := hb_RandomInt(1,2)
        @ 01,01 say "Vida" + Str(nVidaPersonagem)

        //Mov + colisão com a lateral
        if LastKey()     == 65 .or. LastKey() == 97  .and. nHspd > 1//A
            //Ultimo A
        @ nVspd,nHspd clear to nVspd,nHspd
            nHspd--
        elseif LastKey() == 68 .or. LastKey() == 100 .and. nHspd < 78//D
            //Ultimo D
        @ nVspd,nHspd clear to nVspd,nHspd
            nHspd++
        elseif LastKey() == 87 .or. LastKey() == 119 .and. nVspd > 1//W
            //Ultimo w
        @ nVspd,nHspd clear to nVspd,nHspd
            nVspd--
        elseif LastKey() == 83 .or. LastKey() == 115 .and. nVspd < 23//S
            //Ultimo S
        @ nVspd,nHspd clear to nVspd,nHspd
            nVspd++
        end if
        @ nVspd,nHspd say " " Color cPersonagem


        //ataque player
        switch LastKey()
            case 5
                nPosicaoArmaV--
                @ nPosicaoArmaV,nPosicaoArmaH say " " Color cArma
                exit
            case 24
                nPosicaoArmaV++
                @ nPosicaoArmaV,nPosicaoArmaH say " " Color cArma
                exit
            case 19
                nPosicaoArmaH--
                @ nPosicaoArmaV,nPosicaoArmaH say " " Color cArma
                exit
            case 4
                nPosicaoArmaH--
                @ nPosicaoArmaV,nPosicaoArmaH say " " Color cArma
                exit
        endswitch

        if nPosicaoArmaV == nVspdInimigo .and. nPosicaoArmaH == nHspdInimigo
            nVidaInimigo--
        endif

        //Inimigo
        //Enquanto a vida do inimigo for maior que zero
        if nVidaInimigo > 0
            //Reduzir vida do player quando encostar no inimigo
            if nHspd == nHspdInimigo .and. nVspd == nVspdInimigo
                nVidaPersonagem--
            end if

            // if nHspd <= (nHspdInimigo + 5) .or. (nHspdInimigo - 5) .or. (nHspdInimigo + 5) .or. (nHspdInimigo + 5) .or.

            //Checa se o player esta no campo de target do inimigo
            if     (nDistanciaH < 8 .and. nDistanciaH > -8) .or. (nDistanciaV < 3 .and. nDistanciaV > -3)
                lViuPlayer := .t.
            elseif (nDistanciaH > 9 .or. nDistanciaH < -9) .or. (nDistanciaV > 5 .or. nDistanciaV < -5)
                lViuPlayer := .f.
            end if

           //Comportamento do inimigo sem ver o player
            if lViuPlayer == .f.
                @ (nVidaInimigo + 1),nHspdInimigo say "Nao viu o player"
                @ nVspdInimigo,nHspdInimigo clear to nVspdInimigo,nHspdInimigo
                if nDirecaoAleatoria     == 1 .and. nMovAleatorio == 1
                    nHspdInimigo++
                elseif nDirecaoAleatoria == 1 .and. nMovAleatorio == 2
                    nHspdInimigo--
                elseif nDirecaoAleatoria == 2 .and. nMovAleatorio == 1
                    nVspdInimigo++
                elseif nDirecaoAleatoria == 2 .and. nMovAleatorio == 2
                    nVspdInimigo--
                end if
            //comportamento do inimigo após ver o player
            elseif lViuPlayer == .t.
                @ (nVidaInimigo + 1),nHspdInimigo say "Viu o player"
                @ nVspdInimigo,nHspdInimigo clear to nVspdInimigo,nHspdInimigo
                if nDistanciaH     > 0 .and. nDistanciaH < 15
                    nHspdInimigo++
                elseif nDistanciaV > 0 .and. nDistanciaV < 5
                    nVspdInimigo++
                elseif nDistanciaH < 0 .and. nDistanciaH > -15
                    nHspdInimigo--
                elseif nDistanciaV < 0 .and. nDistanciaH > -5
                    nVspdInimigo--
                end if
            end if
            @ nVspdInimigo,nHspdInimigo say " " Color cInimigo
        //elseif
        end if

        @ 00,00 to 24,79
        inkey(0)
    end if

    if nVidaPersonagem == 0
        nOpca1 := Alert("Game Over", {"Sair"})
        if nOpca1 == 1
            clear
            exit
        end if
        loop
    end if

    @ nPosicaoArmaV,nPosicaoArmaH clear to nPosicaoArmaV,nPosicaoArmaH
end do