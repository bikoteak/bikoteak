clear
j = 0
set printer to &fichero
set print on
set console off
set margin to 4
select 0
if tipo_list < 3
else
   use elofeda alias elofide
   if tipo_list = 3
      zap
   endif
endif
select 0
use control
select 0
use federaci
set order to tag(1)
select 0
use resultad
set order to tag("resultado")
select 0
use jugadore alias segundo
set order to tag("num_lista")
select 0
use cuadro
set order to tag("jugador")
set relation to jug_num2 into segundo
set relation to resultado into resultad additive
select 0
use jugadore again
set order to tag("num_lista")
select 0
use seleccio
set relation to num_jug into jugadore
set relation to str(num_jug,3) + str(j,2) into cuadro additive
listas = 1
do while .not. eof()
   if listas = 1
      ?
      ?
      ?
      ?
      ?
      ?
      ?
      ?
      ?
      ?
      ? space(15),texto
      ?
      ? "Ciudad:",vloca,space(10),"Pais:",pais
      ? "Comienzo:",dtoc(fec_ini),space(3),"Primer periodo:",prim_per
      ? "Final   :",dtoc(fec_fin),space(3),"Segundo periodo:",segu_per
      ? "Arbitro:",arbitro,space(3),"Fed:",fed_arbitr
      ?
   endif
   guarda3 = recno()
   if tipo_list < 3 
      i = 1
      ?
      do while i < 6 .and. .not. eof()
         ?? iif(jugadore.licencia = 0,"   " + dtoc(jugadore.fecha_naci),;
            str(jugadore.licencia,11)),space(2)
         i = i + 1
         skip
      enddo
      goto guarda3
   endif
   if tipo_list > 2 
      i = 1
      ?
      do while i < 6 .and. .not. eof()
         ?? "   " + dtoc(jugadore.fecha_naci)
         i = i + 1
         skip
      enddo
      goto guarda3
   endif
   i = 1
   ?
   do while i < 6 .and. .not. eof()
      posicion = at(",",jugadore.nombre)
      if posicion <> 0
         apellido = trim(substr(jugadore.nombre,1,posicion-1))
      else
         apellido = trim(jugadore.nombre)
      endif
      long1 = len(apellido)
      if long1 < 13
         long2 = int((13 - long1)/2)
         long1 = 13 - long2 - long1
         apellido = space(long1) + apellido + space(long2)
      else
         apellido = substr(apellido,1,13)
      endif
      ?? apellido+space(1)
      i = i + 1
      skip
   enddo
   goto guarda3
   i = 1
   ?
   do while i < 6 .and. .not. eof()
      posicion = at(",",jugadore.nombre)
      if posicion <> 0
         apellido=trim(substr(jugadore.nombre,posicion+1,13))
         long1 = len(apellido)
         if long1 < 13
            long2 = int((13 - long1)/2)
            long1 = 13 - long2 - long1
            apellido = space(long1) + apellido + space(long2)
         else
            apellido = substr(apellido,1,13)
         endif
         ?? apellido+space(1)
      else
         ?? space(14)
      endif
      i = i + 1
      skip
   enddo
   goto guarda3
   i = 1
   ?
   do while i < 6 .and. .not. eof()
      if tipo_list > 2
         ?? str(jugadore.num_lista,3),space(2)+federaci.autonomia+space(1),;
            jugadore.categoria,space(1)
      else
         ?? str(jugadore.num_lista,3),space(2)+;
            jugadore.federacion+space(1),jugadore.categoria,space(1)
      endif
      i = i + 1
      skip
   enddo
   goto guarda3
   i = 1
   ?
   do while i < 6 .and. .not. eof()
      if tipo_list > 2 .and. jugadore.elo_naci <> 0
          ?? str(jugadore.clasific,3),str(jugadore.elo_naci,5),;
             str(jugadore.tot_ptos,3,1)+space(1)
      else
          ?? str(jugadore.clasific,3),str(jugadore.elo_fide,5),;
             str(jugadore.tot_ptos,3,1)+space(1)
      endif
      i = i + 1
      skip
   enddo
   ?
   i = 1
   do while i < 6
      par_elo = "par_elo_" + str(i,1)
      &par_elo = 0
      sum_elo = "sum_elo_" + str(i,1)
      &sum_elo = 0
      pto_elo = "pto_elo_" + str(i,1)
      &pto_elo = 0
      par_nelo = "par_nelo_" + str(i,1)
      &par_nelo = 0
      pto_nelo = "pto_nelo_" + str(i,1)
      &pto_nelo = 0
      i = i + 1
   enddo
   j = 1
   do while j <= control.num_rondas
      i = 1
      ?
      goto guarda3
      do while i < 6 .and. .not. eof()
         par_elo = "par_elo_" + str(i,1)
         sum_elo = "sum_elo_" + str(i,1)
         pto_elo = "pto_elo_" + str(i,1)
         par_nelo = "par_nelo_" + str(i,1)
         pto_nelo = "pto_nelo_" + str(i,1)
         ?? str(cuadro.jug_num2,3)
         if tipo_list < 3
            if segundo.elo_fide <> 0
               ?? str(segundo.elo_fide,6)+space(1)
               if cuadro.resultado < 3
                  &par_elo = &par_elo + 1
                  &sum_elo = &sum_elo + segundo.elo_fide
                  &pto_elo = &pto_elo + resultad.ptos_blan
               endif
            else
               ?? space(7)
               if cuadro.resultado < 3
                  &par_nelo = &par_nelo + 1
                  &pto_nelo = &pto_nelo + resultad.ptos_blan
               endif
            endif
         else
            if segundo.elo_naci <> 0
               ?? str(segundo.elo_naci,6)+space(1)
               if cuadro.resultado < 3
                  &par_elo = &par_elo + 1
                  &sum_elo = &sum_elo + segundo.elo_naci
                  &pto_elo = &pto_elo + resultad.ptos_blan
               endif
            else
               if segundo.elo_fide <> 0
                  ?? str(segundo.elo_fide,6)+space(1)
                  if cuadro.resultado < 3
                     &par_elo = &par_elo + 1
                     &sum_elo = &sum_elo + segundo.elo_fide
                     &pto_elo = &pto_elo + resultad.ptos_blan
                  endif
               else
                  ?? space(7)
                  if cuadro.resultado < 3
                     &par_nelo = &par_nelo + 1
                     &pto_nelo = &pto_nelo + resultad.ptos_blan
                  endif
               endif
            endif
         endif
         if tipo_list > 2
            ?? resultad.texto_cast+space(1)
         else
            ?? space(1)+resultad.texto_ingl,space(1)
         endif
         i = i + 1
         skip
      enddo
      j = j + 1
   enddo
   tope = i
   ?
   goto guarda3
   ?
   i = 1
   do while i < tope
      par_elo = "par_elo_" + str(i,1)
      sum_elo = "sum_elo_" + str(i,1)
      pto_elo = "pto_elo_" + str(i,1)
      select seleccio
      ?? str(&par_elo,3)+str(&sum_elo,6),str(&pto_elo,3,1)+space(1)
      i = i + 1
      skip
   enddo
   ?
   i = 1
   do while i < tope
      par_nelo = "par_nelo_" + str(i,1)
      pto_nelo = "pto_nelo_" + str(i,1)
      ?? str(&par_nelo,3),space(5),str(&pto_nelo,3,1)+space(1)
      i = i + 1
   enddo
   ?
   i = 1
   do while i < tope
      par_elo = "par_elo_" + str(i,1)
      pto_elo = "pto_elo_" + str(i,1)
      par_nelo = "par_nelo_" + str(i,1)
      pto_nelo = "pto_nelo_" + str(i,1)
      ?? str(&par_elo+&par_nelo,3),space(5),;
         str(&pto_elo+&pto_nelo,3,1)+space(1)
      i = i + 1
   enddo
   listas = listas + 1
   if listas = 2
      ?? chr(10)+chr(10)+chr(10)
   else
      ?? chr(12)
      listas = 1
   endif
enddo
set console on
set margin to 0
set print off
set printer to lpt1
close databases