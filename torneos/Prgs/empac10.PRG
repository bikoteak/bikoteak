if remainder
   do desremai
   if transposi
      estado = "c07"
   else
      if upfloat = 2
         estado = "c11"
      else      
*         if downfloat < 2
*            return
*         endif
         upfloat = upfloat + 1
         =asort(pendient,aelement(pendient,comienzo,m.num_ord),num_jug_gr)
         estado = "c04"
      endif
   endif
else
   if homogeneo
      estado = "c11"
   else
      if upfloat = 2
         estado = "c11"
      else      
         upfloat = upfloat + 1
         =asort(pendient,aelement(pendient,comienzo,m.num_ord),num_jug_gr)
         transposi = .t.
         estado = "c04"
      endif
   endif
endif