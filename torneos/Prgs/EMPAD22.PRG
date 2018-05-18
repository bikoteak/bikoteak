EXTERNAL ARRAY v_trans,pendient,s2
num_trans2 = num_trans2 + 1
top_trans2 = (valor_p * (valor_p -1) / 2) *;
             ((num_jug_gr - valor_p) * (num_jug_gr - valor_p -1) / 2) 
if num_trans2 > top_trans2
   exchange = .f.
   return
endif
m1 = 1
m2 = 1
valor_p2 = valor_p * (valor_p - 1) / 2
valor_g2 = (num_jug_gr - valor_p) * (num_jug_gr - valor_p -1) /2
if num_trans2 <> 1
   for m = 2 to num_trans2
      do case
         case m1 < valor_p2 and m2 > 1
            m1 = m1 + 1
            m2 = m2 - 1
         case m1 = valor_p2
            m1 = iif(m2 + valor_p2 <= valor_g2,;
                     1,m2 + valor_p2 - valor_g2 + 1)
            m2 = iif(m2 + valor_p2 <= valor_g2,;
                     m2 + valor_p2,valor_g2)
         case m2 = 1
            m2 = m1 + 1
            m1 = 1
      endcase
   endfor
endif
suma = 0
for m = 1 to valor_p - 1
   suma = suma + m
   if m1 <= suma
      m11 = valor_p - m
      m12 = m11 + suma - m1 + 1
      exit
   endif
endfor
suma = 0
for m = 1 to num_jug_gr - valor_p - 1
   suma = suma + m
   if m2 <= suma
      m22 = valor_p + 1 + m
      m21 = m22 - (suma - m2) - 1
      exit
   endif
endfor
for m = comienzo to comienzo + num_jug_gr - 1
   if adel(pendient,m) <> 1
      suspend
   endif
   if ains(pendient,m) <> 1
      suspend
   endif
   do case
      case m + 1 - comienzo = valor_p - 1
         for m3 = 1 to num_campos
            pendient(m,m3) = v_trans(m21,m3) 
         endfor
      case m + 1 - comienzo = valor_p
         for m3 = 1 to num_campos
            pendient(m,m3) = v_trans(m22,m3) 
         endfor
      case m + 1 - comienzo < m11
         for m3 = 1 to num_campos
            pendient(m,m3) = v_trans(m + 1 - comienzo,m3) 
         endfor
      case m + 1 - comienzo >= m11 and m + 1 - comienzo < m12 - 1
         for m3 = 1 to num_campos
            pendient(m,m3) = v_trans(m + 2 - comienzo,m3) 
         endfor
      case m + 1 - comienzo >= m12 - 1 and m + 1 - comienzo <= valor_p - 2
         for m3 = 1 to num_campos
            pendient(m,m3) = v_trans(m + 3 - comienzo,m3) 
         endfor
      case m + 1 - comienzo = valor_p + 1
         for m3 = 1 to num_campos
            pendient(m,m3) = v_trans(m11,m3) 
         endfor
      case m + 1 - comienzo = valor_p + 2
         for m3 = 1 to num_campos
            pendient(m,m3) = v_trans(m12,m3) 
         endfor
      case m + 1 - comienzo > valor_p + 2 and m + 1 - comienzo < m21 + 2
         for m3 = 1 to num_campos
            pendient(m,m3) = v_trans(m - 1 - comienzo,m3) 
         endfor
      case m + 1 - comienzo > m21 + 1 and m + 1 - comienzo < m22 + 1
         for m3 = 1 to num_campos
            pendient(m,m3) = v_trans(m - comienzo,m3) 
         endfor
      case m + 1 - comienzo > m22
         for m3 = 1 to num_campos
            pendient(m,m3) = v_trans(m + 1 - comienzo,m3) 
         endfor
   endcase
endfor
exchange = .t.