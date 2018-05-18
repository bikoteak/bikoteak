EXTERNAL ARRAY s1
if not homogeneo
   if estado_old = "c01"
      do desremai
      grupo = grupo - 1
      if transposi
         estado = "c07"
      else
         estado = "c13"
      endif
   else
      if comienzo > 1
         wait window "Probar otro descendente en vez de " + str(s1(1,m.num_lista),3);
                     timeout(5)
*         estado = "c07"
      endif
      estado = "c13"
   endif
else
   estado = "c13"
endif