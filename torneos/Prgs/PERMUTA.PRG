parameter tabla
EXTERNAL ARRAY tabla
private hh,jj,tope,campo,minimo
tope = alen(tabla)
for hh = tope - 1 to 1 step - 1
   if tabla(hh) < tabla(hh + 1)
      campo = hh + 1
      minimo = tabla(hh + 1)
      for jj = hh + 2 to tope
         if tabla(jj) > tabla(hh)
            minimo = min(minimo,tabla(jj))
            campo = jj
         endif
      endfor
      transposi = .t.
      exit
   endif
endfor
if transposi
   if adel(tabla,campo) <> 1
      suspend
   endif
   if ains(tabla,hh) <> 1
      suspend
   endif
   tabla(hh) = minimo
   if asort(tabla,hh + 1) <> 1
      suspend
   endif
endif