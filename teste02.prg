dData := Date()
nMes := Month(dData)
dUltimoDia := CToD("01/" + AllTrim(Str(nMes)) +"/2025") - 1
clear
@ 01,01 say dUltimoDia