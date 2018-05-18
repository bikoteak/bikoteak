if valor_p > 0
   valor_p = valor_p - 1
   if valor_x_or > 0 and valor_x > 0
      valor_x = valor_x - 1
   endif
   upfloat = 0
   downfloat = 0
endif
if grupo = grupos and valor_p = 0
   WAIT WINDOW 'Error de logica' timeout 5
endif
if valor_p > 0
   =asort(pendient,aelement(pendient,comienzo,m.num_ord),num_jug_gr)
   estado = "c04"
else
   =asort(pendient,aelement(pendient,comienzo,m.num_ord),num_jug_gr)
   fin_grupo = .t.
   estado = "c01"
endif
   