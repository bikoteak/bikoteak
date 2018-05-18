EXTERNAL ARRAY pendient
pide_blan = 0
pide_negra = 0
pide_nulo = 0
num_down = 0
num_bracket = 1
brack_old = pendient(comienzo,m.bracket_in)
for i = comienzo to comienzo + num_jug_gr - 1
   if brack_old <> pendient(i,m.bracket_in)
      num_bracket = num_bracket + 1
      brack_old = pendient(i,m.bracket_in)      
   endif 
   if pendient(i,m.bracket_in) < grupo
      num_down = num_down + 1
   endif
   if pendient(i,m.pide_color) = "B"
      pide_blan = pide_blan + 1
   else
      if pendient(i,m.pide_color) = "N"
         pide_negra = pide_negra + 1
      else
         pide_nulo = pide_nulo + 1
      endif
   endif
endfor
if num_down > 0
   homogeneo = .f.
   remainder = .f.
else
   homogeneo = .t.
endif
if num_down * 2 >= num_jug_gr and num_bracket = 2 and;
   int((grupos/grupo) + .5) = 0
   homogeneo = .t.
endif