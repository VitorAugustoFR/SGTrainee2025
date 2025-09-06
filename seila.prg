
clear
cPersonagem := "O"
nVspd := 40
nHspd := 12
nVidaPersonagem := 10
nUltimaTecla := LastKey()
    
@ nHspd,nVspd say cPersonagem 

// se a vida do player for maior que 0
do while nVidaPersonagem > 0
    
    @ 08,15 say "|"
    if LastKey() == 87 .or. LastKey() == 119 .and. nHspd > 1//W
        clear
        nHspd--
        @ nHspd,nVspd say cPersonagem
    elseif LastKey() == 83 .or. Lastkey() == 115 .and. nHspd < 23//S
        clear
        nHspd++
        @ nHspd,nVspd say cPersonagem
    elseif LastKey() == 65 .or. LastKey() == 97 .and. nVspd > 1//A
        clear
        nVspd--
        @ nHspd,nVspd say cPersonagem
    elseif LastKey() == 68 .or. LastKey() == 100 .and. nVspd < 78//D
        clear
        nVspd++
        @ nHspd,nVspd say cPersonagem
    end if
    @ 00,00 to 24,79
    inkey(0)
end do
