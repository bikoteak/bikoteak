EXTERNAL ARRAY pendient
if homogeneo
   valor_p = min(int(num_jug_gr/2),val_p_g)
else
   valor_p = 0
   num_brackets = 1
   brack_old = pendient(comienzo,m.bracket_in)
   for i = comienzo to comienzo + num_jug_gr - 1
      if brack_old <> pendient(i,m.bracket_in)
         num_brackets = num_brackets + 1
         brack_old = pendient(i,m.bracket_in)
      endif
      if pendient(i,m.bracket) < grupo and num_brackets < 2
         valor_p = valor_p + 1
      endif
   endfor
   if valor_p >= num_jug_gr - valor_p
      homogeneo = .t.
   endif
   valor_p = min(valor_p,num_jug_gr - valor_p,val_p_g)
endif