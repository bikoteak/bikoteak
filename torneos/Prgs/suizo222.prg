select 0
use salres
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
use cuadro
set order to tag("n_ronda")
set relation to jug_num1  into jugprim
set relation to jug_num2  into jugsegu additive
set relation to resultado into resultad additive
seek str(control.ronda,2)
do while not eof()
   select salres
   append blank
   replace sub_torneo WITH control.sub_torneo;
		   num_mesa with cuadro.num_mesa,;
           jug_num1 with cuadro.jug_num1,;
           jug_num2 with cuadro.jug_num2,;
           nombre_a with jugprim.nombre,;
           federaci_a with jugprim.federacion,;
           texto with resultad.texto,;
           federaci_b with jugsegu.federacion,;
           nombre_b with jugsegu.nombre
   select cuadro           
   skip
enddo
close databases