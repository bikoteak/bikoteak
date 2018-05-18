clear
set deleted off
sw_acum = .f.
sw_selo = .f.
select 0
use torneo
SELECT 0
USE altaelo
select 0
use resultad
set order to tag("resultado")
select 0
use cuadro
select 0
use control
ult_ronda = .f.
if ronda = torneo.num_rondas
   ult_ronda = .t.
endif
orden2 = ""
if ult_ronda
   select 0
   use desempa
   set order to tag("desempa")
   goto top
   do while .not. eof() .and. cod_desemp = 0
      skip
   enddo
   do while .not. eof()
      orden2 = orden2 + trim(campo_des) + "/d,"
      if berezi = 1
         sw_acum = .t.
      endif
      if berezi = 2
         sw_selo = .t.
      endif
      skip
   enddo
endif
select 0
use jugadore
set order to tag("num_lista")
GOTO top
select 0
use jugadore again alias segundo
set order to tag("num_lista")
select cuadro
set relation to jug_num2 into segundo
set relation to resultado into resultad additive
select jugadore
do while .not. eof()
*   IF jugadore.num_jug = 50
*      SUSPEND
*   endif
   select cuadro
   set filter to jug_num1 = jugadore.num_lista
   goto top
   mini_selo = 9999
   mini_cor = torneo.num_rondas
   maxi_cor = 0
   mini_buc = torneo.num_rondas
   maxi_buc = 0
   suma = 0
   suma_elo = 0
   num_partid = 0
   n_par_elo = 0
   s_res_elo = 0
   num_elo0 = 0
   tot_suma = 0
   buc_cor = 0
   buchol = 0
   sonen  = 0
   num_negras = 0
   num_gana = 0
   @ 10,10 say "Jugador"
   @ 10,19 say jugadore.num_lista picture "###"
   do while not eof()
      num_partid = num_partid + 1
      IF NOT status
         num_negras = num_negras + 1
      ENDIF
      IF resultad.resultado = 1
         num_gana = num_gana + 1
      endif
      if segundo.elo_fide = 0 or cuadro.resultado > 2
         num_elo0 = num_elo0 + 1
         mini_selo = 0
      else
         n_par_elo = n_par_elo + 1
         suma_elo  = suma_elo + segundo.elo_fide
         mini_selo = min(mini_selo,segundo.elo_fide)
         s_res_elo = s_res_elo + resultad.ptos_blan
      endif
      suma = suma + resultad.ptos_blan
      if jug_num2 <> 0
         mini_cor = min(mini_cor,segundo.tot_buc_c)
         maxi_cor = max(maxi_cor,segundo.tot_buc_c)
         mini_buc = min(mini_buc,segundo.tot_ptos)
         maxi_buc = max(maxi_buc,segundo.tot_ptos)
         if resultado = 1 .or. resultado = 7
            sonen  = sonen  + segundo.tot_ptos
         else
            if resultado = 2
               sonen  = sonen  + segundo.tot_ptos/2
            endif
         endif
         buc_cor = buc_cor + segundo.tot_buc_c
         buchol = buchol + segundo.tot_ptos
      else
         mini_cor = min(mini_cor,torneo.num_rondas/2)
         maxi_cor = max(maxi_cor,torneo.num_rondas/2)
         mini_buc = min(mini_buc,torneo.num_rondas/2)
         maxi_buc = max(maxi_buc,torneo.num_rondas/2)
         buc_cor = buc_cor + torneo.num_rondas/2
         buchol = buchol + torneo.num_rondas/2
      endif
      tot_suma = tot_suma + suma
      skip
   enddo
   media_elo = int(suma_elo/n_par_elo + .5)
   porcen = IIF(n_par_elo <> 0,int(s_res_elo * 100 / n_par_elo +.5),0)
   DO CASE
      CASE porcen = 0
         performanc = 0
      CASE porcen = 100
         performanc = 9999
      otherwise   
         select altaelo
         goto iif(porcen < 51,porcen, 100 - porcen)
         performanc = media_elo + iif(porcen < 51,0-altaelo.diferencia,altaelo.diferencia)
   endcase
   select jugadore
   replace tot_media with buchol - mini_buc - maxi_buc,;
           media_cor with buc_cor - mini_cor - maxi_cor,;
           buchol_cor with buc_cor,tot_buchol with buchol,;
           tot_sonen with sonen,tot_acum with tot_suma
   replace tot_bra_1 with buchol - mini_buc,;
           tot_bra_c with buchol_cor - mini_cor,;
           performan WITH performanc
   replace num_negras WITH m.num_negras, num_gana WITH m.num_gana
   if control.ronda = torneo.num_rondas and num_partid <> torneo.num_rondas
      num_elo0 = num_elo0 + torneo.num_rondas - num_partid
   endif
   if num_elo0 > 1
      replace media_sw with .f.,media_elo with 0
   else
      replace media_sw with .t.,media_elo with suma_elo - mini_selo
   endif
   skip
enddo
orden = "tot_ptos/d," + orden2 + "num_jug"
sort to clasifi2 on &orden
close databases
if sw_selo and ult_ronda
   do suizo17c
else
   erase clasifi.dbf
   rename clasifi2.dbf to clasifi.dbf
endif
select 0
use jugadore
set order to tag("num_lista")
select 0
use clasifi
puesto = 1
do while not eof()
   if not deleted()
      select jugadore
      seek clasifi.num_lista
      replace clasific with puesto
      puesto = puesto + 1
      select clasifi
   endif
   skip
enddo
close databases
use jugadore
set order to tag("num_lista")
do while not eof() and not deleted()
   skip
enddo
do while not eof()
   replace clasific with puesto
   puesto = puesto + 1
   skip
   do while not eof() and not deleted()
      skip
   enddo
enddo
close databases
if ult_ronda
   clear
   @ 10,10 say "Comienzo de desempates"
   if sw_acum
      do suizo17a
   endif
   @ 10,10 say "Final de desempates   "
endif
close databases
set deleted on