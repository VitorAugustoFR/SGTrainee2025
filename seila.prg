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
cPersonagem := "G/G"
cArma := "B/B"
nHspd := 40
nVspd := 12
//nPosicaoPlayer := {Vspd,Hspd}
nVidaPersonagem := 10
nUltimaTecla := inkey()
//nUltimoW := 0 
//nUltimoS := 0 
//nUltimoA := 0 
//nUltimoD := 0 
//Inimigo
//cInimigoPos := {nHspdInimigo, nVspdInimigo}
//nColisaoHEstatica := {Numeros onde existem objetos colidiveis horizontalmente}
//nColisaoVEstatica := {Numeros onde existem objetos colidiveis verticalmente}
cInimigo := "R/R"
nVidaInimigo := 2
nHspdInimigo := 15
nVspdInimigo := 15
lViuPlayer := .f.
nDistanciaH := nHspd - nHspdInimigo
nDistanciaV := nVspd - nVspdInimigo
    

do while .t.

    // se a vida do player for maior que 0
    //Transformar em if e criar um do while que engloba tudo
    if nVidaPersonagem > 0

        @ nVspdInimigo,nHspdInimigo say " " Color cInimigo
        @ nVspd,nHspd say " " Color cPersonagem 

        nMovAleatorio := hb_RandomInt(1,2)
        nDirecaoAleatoria := hb_RandomInt(1,2)
        @ 01,01 say "Vida" + Str(nVidaPersonagem)

        //Mov + colisão com a lateral
        if LastKey() == 65 .or. LastKey() == 97 .and. nHspd > 1//A
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

        //Reduzir vida do player quando encostar no inimigo
        if nHspd == nHspdInimigo .and. nVspd == nVspdInimigo
            nVidaPersonagem--
        end if

        //ataque player
        if LastKey() == 102 .or. LastKey() == 70
            if nUltimaTecla == 65 .or. nUltimaTecla == 97
                @ (nHspd - 1),nVspd say " " Color cArma
            elseif nUltimaTecla == 68 .or. nUltimaTecla == 100
                @ (nHspd + 1),nVspdc say " " Color cArma
            elseif nUltimaTecla == 87 .or. nUltimaTecla == 119
                @ nHspd,(nVspd - 1) say " " Color cArma
            elseif nUltimaTecla == 83 .or. nUltimaTecla == 115
                @ nHspd,(nVspd + 1) say " " Color cArma
            end if
        end

        //Inimigo
        //Enquanto a vida do inimigo for maior que zero
        if nVidaInimigo > 0

            // if nHspd <= (nHspdInimigo + 5) .or. (nHspdInimigo - 5) .or. (nHspdInimigo + 5) .or. (nHspdInimigo + 5) .or.

            //Checa se o player esta no campo de target do inimigo
            if (nDistanciaH < 2 .and. nDistanciaH > -2) .or. (nDistanciaV < 2 .and. nDistanciaV > -2)
                lViuPlayer := .t.
            elseif nDistanciaH > 2 .or. nDistanciaH < -2 .or. nDistanciaV > 2 .or. nDistanciaV < -2
                lViuPlayer := .f.
            end if

           //Comportamento do inimigo sem ver o player
            if lViuPlayer == .f.
                if nDirecaoAleatoria == 1 .and. nMovAleatorio == 1
                    @ nVspdInimigo,nHspdInimigo clear to nVspdInimigo,nHspdInimigo
                    nHspdInimigo++
                elseif nDirecaoAleatoria == 1 .and. nMovAleatorio == 2
                    @ nVspdInimigo,nHspdInimigo clear to nVspdInimigo,nHspdInimigo
                    nHspdInimigo--
                elseif nDirecaoAleatoria == 2 .and. nMovAleatorio == 1
                    @ nVspdInimigo,nHspdInimigo clear to nVspdInimigo,nHspdInimigo
                    nVspdInimigo++
                elseif nDirecaoAleatoria == 2 .and. nMovAleatorio == 2
                    @ nVspdInimigo,nHspdInimigo clear to nVspdInimigo,nHspdInimigo
                    nVspdInimigo--
                end if
            @ nVspdInimigo,nHspdInimigo say " " Color cInimigo
            //comportamento do inimigo após ver o player
            elseif lViuPlayer == .t.
                if nDistanciaH > 0 .and. nDistanciaH < 2
                    @ nVspdInimigo,nHspdInimigo clear to nVspdInimigo,nHspdInimigo
                    nHspdInimigo++
                elseif nDistanciaV > 0 .and. nDistanciaV < 2
                    @ nVspdInimigo,nHspdInimigo clear to nVspdInimigo,nHspdInimigo
                    nVspdInimigo++
                elseif nDistanciaH < 0 .and. nDistanciaH > -2
                    @ nVspdInimigo,nHspdInimigo clear to nVspdInimigo,nHspdInimigo
                    nHspdInimigo--
                elseif nDistanciaV < 0 .and. nDistanciaH > -2
                    @ nVspdInimigo,nHspdInimigo clear to nVspdInimigo,nHspdInimigo
                    nVspdInimigo--
                end if
            @ nVspdInimigo,nHspdInimigo say " " Color cInimigo
            end if
        end if
        //Tone(500,1)

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

end do