EXTERNAL ARRAY pendient
**************************************************
* Calculos previo de todo el grupo               *
**************************************************
num_jug_gr = 0
for i = comienzo to total_jug
   if pendient(i,m.bracket) > grupo
      exit
   endif
   num_jug_gr = num_jug_gr + 1
endfor
do empar1
if num_jug_gr <= control.ronda + 1 
   for registro = comienzo + num_jug_gr - 1 to comienzo step -1 
      valido = .f.
      for j = comienzo to comienzo + num_jug_gr - 1
         if registro <> j
            seek str(pendient(registro,m.num_lista),3) +;
                 str(pendient(j,m.num_lista),3)
            if (eof() or resultado > 2) and;
               empab2(pendient(registro,m.num_lista),pendient(j,m.num_lista),;
               pendient(registro,m.hist_color),pendient(j,m.hist_color),;
               pendient(registro,m.pide_color),pendient(j,m.pide_color),;
               pendient(registro,m.pide_colov),pendient(j,m.pide_colov))
               valido = .t.
               exit
            endif
         endif
      endfor
      if not valido
         if num_jug_gr = 1
            if grupo = grupos
               select bye
               seek pendient(registro,m.num_lista)
               if not eof()
                  select cuadro
                  estado = "c13"
                  return
               endif
               select rondas
               append blank
               replace jug_num1 with pendient(registro,m.num_lista),;
               jug_num2 with 0,num_empa with m.num_empa
               fin_grupo = .t.
               return
            else
               fin_grupo = .t.
               homogeneo = .f.
               return
            endif
         endif
         if num_jug_gr = 2
            if pendient(registro - 1,m.bracket_in) < grupo and comienzo > 1
               wait window "Probar otro descendente en vez de " +;
                    str(pendient(registro - 1,m.num_lista),3) timeout(5)
            endif
         endif
         if pendient(registro,m.bracket_in) < grupo and comienzo > 1
            wait window "Probar otro descendente en vez de " +;
                 str(pendient(registro,m.num_lista),3) timeout(5)
*            estado = "c12"
*            return
         endif
         if grupo = grupos
            estado = "c13"
            return
         endif
         if registro <> comienzo + num_jug_gr - 1
            dimension v_transp(num_campos)
            for i = 1 to num_campos
               v_transp(i) = pendient(registro,i)
            endfor
            if adel(pendient,registro) <> 1
               suspend
            endif
            if ains(pendient,comienzo + num_jug_gr - 1) <> 1
               suspend
            endif
            for i = 1 to num_campos
               pendient(comienzo + num_jug_gr - 1,i) = v_transp(i)
            endfor
         endif
         do case
            case pendient(comienzo + num_jug_gr - 1,m.pide_color) = "B"
               pide_blan = pide_blan - 1
            case pendient(comienzo + num_jug_gr - 1,m.pide_color) = "N"
               pide_negra = pide_negra - 1
         endcase
         num_jug_gr = num_jug_gr - 1
         do empar1
      endif
   endfor
endif
val_p_g = int(num_jug_gr/2)
estado = "c02"