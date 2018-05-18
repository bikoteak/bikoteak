EXTERNAL ARRAY s2
if num_jug_gr = 2
   return
endif
for h = num_jug_gr - valor_p - 1 to 1 step - 1
   if s2(h,m.num_ord) < s2(h+1,m.num_ord)
      do permutar
*      transposi = .t.      
      return
   endif
endfor