parameter opcion
EXTERNAL ARRAY s2
dimension v_permuta(num_jug_gr - valor_p),inter(num_campos)
for m = 1 to num_jug_gr - valor_p
   v_permuta(m) = s2(m,m.num_ord)
endfor
if opcionc07 = "P"
   do permuta with v_permuta
else
   do saltar  with v_permuta
endif
for m1 = 1 to num_jug_gr - valor_p
   if v_permuta(m1) <> s2(m1,num_ord)
      for m2 = m1 + 1 to num_jug_gr - valor_p
         if v_permuta(m1) = s2(m2,num_ord)
            for n = 1 to num_campos
               inter(n) = s2(m2,n)
            endfor
            if adel(s2,m2) <> 1
               suspend
            endif
            if ains(s2,m1) <> 1
               suspend
            endif
            for n = 1 to num_campos
               s2(m1,n) = inter(n)
            endfor
            exit
         endif
      endfor
   endif
endfor