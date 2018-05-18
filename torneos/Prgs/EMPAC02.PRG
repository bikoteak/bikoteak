if num_jug_gr = 0
   fin_grupo = .t.
   return
endif   
if num_jug_gr = 1 
   homogeneo = .f.
   fin_grupo = .t.
   return
endif
do empaa8
if sw_pri_vez
   sw_pri_vez = .f.
   valor_x_or = valor_x
endif
color_malo = 0
estado = "c03"
