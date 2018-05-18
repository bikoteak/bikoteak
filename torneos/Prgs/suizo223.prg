select 0
use salron
zap
select 0
use control
select 0
use resultad
set order to tag(1)
select 0
use jugadore alias jugprim
set order to tag("num_lista")
select 0
use jugadore again alias jugsegu
set order to tag("num_lista")
select 0
use rondas
set relation to jug_num1  into jugprim
set relation to jug_num2  into jugsegu additive
do while not eof()
   select salron
   append blank
   replace sub_torneo WITH control.sub_torneo;
           num_mesa with rondas.num_mesa,;
           jug_num1 with rondas.jug_num1,;
           jug_num2 with rondas.jug_num2,;
           nombre_a with jugprim.nombre,;
           federaci_a with jugprim.federacion,;
           tot_ptos_a with jugprim.tot_ptos,;
           tot_ptos_b with jugsegu.tot_ptos,;
           federaci_b with jugsegu.federacion,;
           nombre_b with jugsegu.nombre
   select rondas
   skip
enddo
close databases