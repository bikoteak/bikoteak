clear
select 0
use torneo
texto = nom_torneo
vloca = localidad
select 0
use control
select 0
use jugadore
set order to tag("num_jug")
select 0
use jugadore again alias segundo
set order to tag("num_jug")
select 0
use cuadro
delete all for n_ronda = control.ronda + 1
pack
select 0
use rondas
set relation to jug_num1 into jugadore
set relation to jug_num2 into segundo additive
mesa=1
do while .not. eof()
   select cuadro
   append blank
   replace jug_num1 with rondas.jug_num1,jug_num2 with rondas.jug_num2;
           n_ronda with control.ronda + 1,num_mesa with mesa,status with .t.
   if jug_num2 <> 0
      append blank
      replace jug_num1 with rondas.jug_num2,jug_num2 with rondas.jug_num1;
              n_ronda with control.ronda + 1,num_mesa with mesa,status with .f.
   endif
   mesa=mesa+1
   select rondas
   skip
enddo
use
close databases
SELECT Cuadro.n_ronda, Cuadro.num_mesa, Cuadro.status, Cuadro.jug_num1,;
  Cuadro.jug_num2, Jugadore.nombre as nombre1, Jugadore.tot_ptos as tot1,;
   Segundo.nombre as nombre2, Segundo.tot_ptos as tot2;
 FROM Control, Cuadro, Jugadore, JUGADORE Segundo;
 NOCONSOLE;
 NOWAIT;
 WHERE Cuadro.n_ronda = Control.ronda + 1 AND;
   jugadore.num_jug = Cuadro.jug_num1;
   AND Segundo.num_jug = Cuadro.jug_num2;
   ORDER BY Jugadore.nombre
report form oviedo noconsole to print prompt
select cuadro
delete all for n_ronda = control.ronda + 1
pack
close databases