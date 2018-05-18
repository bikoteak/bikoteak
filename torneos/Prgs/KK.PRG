close databases
select 0
use jugadore
set order to tag("num_lista")
select 0
use jugadore again alias segundo
set order to tag("num_lista")
select 0
use cuadro
set order to tag("jugador")
goto top
set relation to jug_num1 into jugadore
set relation to jug_num2 into segundo additive
do while not eof()
   if jugadore.elo_fide <> 0 and segundo.elo_fide <> 0 and;
      jugadore.elo_fide > 2350
      @ 10,05 say jugadore.nombre
      @ 10,40 say segundo.nombre
      @ 10,75 say jugadore.elo_fide - segundo.elo_fide
      wait
   endif
   skip
enddo
close database