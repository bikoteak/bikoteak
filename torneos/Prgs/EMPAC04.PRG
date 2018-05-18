EXTERNAL ARRAY pendient
*if comienzo = 59
*   if asort(pendient,aelement(pendient,comienzo,m.num_ord),num_jug_gr) <> 1
*      suspend
*   endif
*endif
dimension s1(valor_p,num_campos),s2(num_jug_gr-valor_p,num_campos)
for i = comienzo to comienzo + valor_p - 1
   for l = 1 to num_campos
      s1(i + 1 - comienzo,l) = pendient(i,l)
   endfor
endfor
for j = i to comienzo + num_jug_gr - 1
   for l = 1 to num_campos
      s2(j + 1 - comienzo - valor_p,l) = pendient(j,l)
   endfor
endfor
estado = "c05"