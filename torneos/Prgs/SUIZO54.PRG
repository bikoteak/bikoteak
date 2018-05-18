close databases
use control
num_rondas = control.ronda
use
dimension paises(num_rondas + 1)
select 0
use normando
select 0
use normas
set order to tag(1)
copy to array tab_norma
select 0
use excep
set order to tag(1)
select 0
use altaelo
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
set relation to str(num_lista,3) into cuadro
do while not eof() and jugadore.categoria = "g"
   skip
enddo
do while not eof()
   suma_res = 0
   num_elados = iif(elo_fide > 2000,1,0)
   sum_elos = 0
   num_maes = 0
   num_gran = 0
   num_maesw = 0
   num_granw = 0
   num_titul = iif(jugadore.elo_fide >= 2300 or;
      jugadore.categoria = "f" or jugadore.categoriaw = "f" or;
      jugadore.categoria = "m" or jugadore.categoriaw = "m" or;
      jugadore.categoriaw = "g",1,0)
   num_partid = 0
   paises = ""
   select cuadro
   i = 1
   do while not eof() and cuadro.jug_num1 = jugadore.num_lista and cuadro.n_ronda <= num_rondas
      paises(i) = space(3)
      if cuadro.jug_num2 <> 0 and cuadro.resultado < 3
         suma_res = suma_res + resultad.ptos_blan
         paises(i) = segundo.federacion
         num_partid = num_partid + 1
         if segundo.elo_fide >= 2300 or;
            segundo.categoria = "f" or segundo.categoriaw = "f" or;
            segundo.categoria = "m" or segundo.categoriaw = "m" or;
            segundo.categoria = "g" or segundo.categoriaw = "g"
            num_titul = num_titul + 1
         endif
         do case
            case segundo.categoria = "m"
               num_maes = num_maes + 1
            case segundo.categoria = "g"
               num_gran = num_gran + 1
            case segundo.categoriaw = "m"
               num_maesw = num_maesw + 1
            case segundo.categoriaw = "g"
               num_granw = num_granw + 1
         endcase
         sum_elos = sum_elos + iif(segundo.elo_fide > 2000,segundo.elo_fide,2000)
         num_elados = num_elados + iif(segundo.elo_fide > 2000,1,0)
      endif
      skip
      i = i + 1
   enddo
   select jugadore
   paises(i) = federacion
   if asort(paises) <> 1
      @ 10,10 say "Error en ordenacion tabla paises"
      wait
      quit
   endif
   dimension paises(num_rondas + 2)
   paises(num_rondas+2) = " "
   primer_pais = 0
   for i = 1 to num_rondas
      if paises(i) = space(1)
         primer_pais = i
         exit
      endif
   endfor
   primer_pais = primer_pais + 1
   pais_max = 0
   pais_dis = 0
   i = primer_pais
   do while i <=  num_rondas + 1
      pais_dis = pais_dis + 1
      cont_pais = 0
      pais_old = paises(i)
      do while pais_old = paises(i) and i <= num_rondas + 1
         cont_pais = cont_pais + 1
         i = i + 1
      enddo
      pais_max = max(pais_max,cont_pais)
   enddo
   no_fed = num_rondas + 2 - pais_max - primer_pais
   if num_partid > 8 and num_elados * 100/(num_partid +1) >= 80
***************************************************************************
* candidatos a normas
***************************************************************************
      media_elo = int(sum_elos/num_partid + .5)
      if jugadore.elo_fide > media_elo
         media_elo = int((sum_elos+jugadore.elo_fide)/(num_partid + 1) + .5)
      endif
      porcen = int(suma_res * 100 / num_partid +.5)
      select altaelo
      goto iif(porcen < 51,porcen, 100 - porcen)
      select excep
      seek str(num_partid,2) + str(suma_res,4,1)
      performanc = media_elo + iif(porcen < 51,0-altaelo.diferencia,altaelo.diferencia)
      for i = 1 to alen(tab_norma,1)
         if tab_norma(i,2) = "w"
            if jugadore.sexo = " " or jugadore.categoriaw = tab_norma(i,1)
               loop
            endif
         endif
         if jugadore.categoria = tab_norma(i,1)
            loop
         endif
         if performanc >= tab_norma(i,3) - excep.diferencia
**********************************
* posible norma
**********************************
            select normando
            append blank
            replace num_lista with jugadore.num_lista,num_partid with m.num_partid,;
               suma_res with m.suma_res,num_elados with m.num_elados, categoria with tab_norma(i,1)
         endif
         sum_elo = iif(jugadore.elo_fide > 2000,jugadore.elo_fide,2000)
         num_maes = 0
         num_gran = 0
         num_maesw = 0
         num_granw = 0
         num_titul = 0
      endfor
   endif
   select jugadore
   skip
   do while not eof() and jugadore.categoria = "g"
      skip
   enddo
enddo
close databases