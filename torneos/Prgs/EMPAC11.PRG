if valor_x < valor_p
*   if mod(num_jug_gr,2) = 0
*      valor_x = valor_x +2
*   else
      valor_x = valor_x + 1
*   endif
*   if valor_x > valor_p
*      estado = "c012"
*      return
*   endif
   color_malo = color_malo + 1
   upfloat = 0
   downfloat = 0
   if remainder
      do desremai
   endif
   if asort(pendient,aelement(pendient,comienzo,m.num_ord),num_jug_gr) <> 1
      suspend
   endif
   transposi = .t.
   estado = "c03"
else
   estado = "c12"
endif
