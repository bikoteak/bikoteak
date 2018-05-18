close databases
set deleted on
select 0
use control
select 0
use normando
zap
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
set relation to str(num_lista,3) into cuadro additive
do while not eof()
   suma_res = 0
   sum_elos = 0
   num_partid = 0
   select cuadro
   i = 1
   do while not eof() and cuadro.jug_num1 = jugadore.num_lista
      if cuadro.jug_num2 <> 0 and cuadro.resultado < 3
         suma_res = suma_res + resultad.ptos_blan
         num_partid = num_partid + 1
         sum_elos = sum_elos + iif(segundo.elo_fide > 2000,segundo.elo_fide,2000)
      endif
      skip
      i = i + 1
   enddo
   select jugadore
   media_elo = int(sum_elos/num_partid + .5)
   porcen = int(suma_res * 100 / num_partid +.5)
   select altaelo
   goto iif(porcen < 51,porcen, 100 - porcen)
   performanc = media_elo + iif(porcen < 51,0-altaelo.diferencia,altaelo.diferencia)
   select normando
   append blank
   replace num_lista with jugadore.num_lista,num_partid with m.num_partid,;
           suma_res with m.suma_res, performanc with m.performanc
   performanc = 0   
   select jugadore
   skip
enddo
close databases