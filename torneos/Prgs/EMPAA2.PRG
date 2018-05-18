parameters tabla
if alen(tabla,1) = 1
   return
endif
if asort(tabla,m.bracket_in) <> 1
   suspend
endif
for i = 1 to alen(tabla,1)
   brack_old = tabla(i,m.bracket_in)
   for j = i to alen(tabla,1)
      if brack_old <> tabla(j,m.bracket_in)
         exit
      endif
   endfor
   if asort(tabla,aelement(tabla,i,m.num_jug),j-i) <> 1
      suspend
   endif
   i = j - 1
endfor