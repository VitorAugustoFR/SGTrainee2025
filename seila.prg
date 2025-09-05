
clear
cPersonagem := "O"
nVspd := 0
nVidaPersonagem := 10
@ 12,40 say cPersonagem


// se a vida do player for maior que 0
do while nVidaPersonagem > 0

    @ 03,01 say "Legal"
    //checa se a ultima tecla pressionada é a letra W
    if LastKey() == 87
        clear
        nVspd++
        @ 12,(40 + nHspd) say cPersonagem + " " + AllTrim(Str(nVspd))
    elseif LastKey() == 83
        clear
        nVspd--
        @ 12,(40 + nHspd) say cPersonagem + " " + AllTrim(Str(nVspd))
    end if
    Inkey(0)
end do
