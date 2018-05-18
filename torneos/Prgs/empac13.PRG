EXTERNAL ARRAY pendient
if grupo = grupos
   do desremai
   =asort(pendient,aelement(pendient,comienzo,m.num_ord),num_jug_gr)
   if remainder
      do desremai
   endif
   val_p_g = val_p_g - 1
   grupo = grupo - 1
   if val_p_g = 0
      grupos = grupos - 1
*      homogeneo = .t.
*      remainder = .f.
      for i = comienzo to total_jug
         if pendient(i,m.bracket) > grupo
            pendient(i,m.bracket) = grupo
         endif
      endfor
      estado = "c01"
   else
      estado = "c04"
   endif
else
	estado = "c14"
endif