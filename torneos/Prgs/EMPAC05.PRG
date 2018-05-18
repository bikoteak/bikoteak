EXTERNAL ARRAY s1,s2
do empaa2 with s1
do empaa2 with s2
if control.ronda = 0
   clear
   toca = "Z"
   do while toca <> "B" .and. toca <> "N"
      @ 10,10 say "Color del numero 1" get toca picture "!"
      read
   enddo
   for i = 1 to valor_p
      s1(i,m.pide_color) = toca
      s1(i,m.pide_colov) = 0
      toca = iif(toca = "B","N","B")
      s2(i,m.pide_color) = toca
      s2(i,m.pide_colov) = 0
   endfor
endif
estado = "c06"