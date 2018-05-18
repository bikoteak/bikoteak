EXTERNAL ARRAY vtrans,pendient
private m,m1,m2,m3
if num_jug_gr = 2
   return
endif
num_transp = num_transp + 1
top_transp = valor_p * (num_jug_gr - valor_p)
if num_transp > top_transp
   if valor_p > 1
      do empad22
   else
      exchange = .f.
   endif
   return
endif
if num_transp = 1
   dimension v_trans(num_jug_gr,num_campos)
   for m = comienzo to comienzo + num_jug_gr - 1
      for m3 = 1 to num_campos
         v_trans(m + 1 - comienzo,m3) = pendient(m,m3)
      endfor
   endfor
endif
m1 = 1
m2 = 1
if num_transp <> 1
   for m = 2 to num_transp
      do case
         case m1 < valor_p and m2 > 1
            m1 = m1 + 1
            m2 = m2 - 1
         case m1 = valor_p
            m1 = iif(m2 + valor_p <= num_jug_gr - valor_p,;
                     1,m2 + valor_p - (num_jug_gr - valor_p) + 1)
            m2 = iif(m2 + valor_p <= num_jug_gr - valor_p,;
                     m2 + valor_p,num_jug_gr - valor_p)
         case m2 = 1
            m2 = m1 + 1
            m1 = 1
      endcase
   endfor
endif
m1 = valor_p + 1 - m1
m2 = valor_p + m2
for m = comienzo to comienzo + num_jug_gr - 1
   if adel(pendient,m) <> 1
      suspend
   endif
   if ains(pendient,m) <> 1
      suspend
   endif
   do case
      case m + 1 - comienzo = valor_p
         for m3 = 1 to num_campos
            pendient(m,m3) = v_trans(m2,m3) 
         endfor
      case m + 1 - comienzo < m1
         for m3 = 1 to num_campos
            pendient(m,m3) = v_trans(m + 1 - comienzo,m3) 
         endfor
      case m + 1 - comienzo >= m1 and m + 1 - comienzo < valor_p
         for m3 = 1 to num_campos
            pendient(m,m3) = v_trans(m + 2 - comienzo,m3) 
         endfor
      case m + 1 - comienzo = valor_p + 1
         for m3 = 1 to num_campos
            pendient(m,m3) = v_trans(m1,m3) 
         endfor
      case m + 1 - comienzo > valor_p + 1 and m + 1 - comienzo <= m2
         for m3 = 1 to num_campos
            pendient(m,m3) = v_trans(m - comienzo,m3) 
         endfor
      case m + 1 - comienzo > m2
         for m3 = 1 to num_campos
            pendient(m,m3) = v_trans(m + 1 - comienzo,m3) 
         endfor
   endcase
endfor
exchange = .t.