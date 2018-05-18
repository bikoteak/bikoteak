parameter tabla
EXTERNAL ARRAY tabla
private hh,jj,tope,campo,minimo
tope = alen(tabla)
saltar = .f.
for hh = intento + 1 to tope
   if tabla(intento) < tabla(hh)
      saltar = .t.
      exit
   endif
endfor
if saltar
   transposi = .t.
   campo = hh
   minimo = tabla(hh)
   for jj = hh + 1 to tope
      if tabla(jj) > tabla(intento) and tabla(jj) < minimo
         minimo = tabla(jj)
         campo = jj
      endif
   endfor
   hh = intento
else
   if intento < tope
      if asort(tabla,intento + 1,tope - intento,1) <> 1
         suspend
      endif
   endif
   do permuta with tabla
   return
endif
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