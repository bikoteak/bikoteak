************************************************
* Asignacion de color a los sin color
************************************************
for i = 1 to valor_p
   if s1(i,m.pide_color) = " "
      pide_nulo = pide_nulo - 1
      if pide_negra > pide_blan
         s1(i,m.pide_color) = "B"
         pide_blan = pide_blan + 1
      else
         s1(i,m.pide_color) = "N"
         pide_negra = pide_negra + 1
      endif
   endif
   if s2(i,m.pide_color) = " "
      pide_nulo = pide_nulo - 1
      if pide_negra > pide_blan
         s2(i,m.pide_color) = "B"
         pide_blan = pide_blan + 1
      else
         s2(i,m.pide_color) = "N"
         pide_negra = pide_negra + 1
      endif
   endif
endfor
