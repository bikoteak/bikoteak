select 0
use jugadore
set order to tag("num_lista")
select 0
use cuadro
set order to tag("jugador")
set relation to jug_num2 into jugadore
set filter to jug_num1 = 2
goto top
todo = 0
do while not eof()
   @ 10,10 say jugadore.elo_fide
   wait
   todo = todo + jugadore.elo_fide
   skip
enddo
@8,8 say todo
sum jugadore.elo_fide to cuanto
@10,10 say cuanto 