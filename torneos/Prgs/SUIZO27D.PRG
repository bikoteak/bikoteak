select 0
use elofide
zap
select 0
use control
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
   par_elo = 0
   sum_elo = 0
   pto_elo = 0
   select cuadro
   do while jugadore.num_lista = cuadro.jug_num1 and not eof()
      if segundo.elo_fide <> 0 and cuadro.resultado < 3
         par_elo = par_elo + 1
         if jugadore.elo_fide <> 0
            do case
               case segundo.elo_fide - jugadore.elo_fide > 350
                  sum_elo = sum_elo + jugadore.elo_fide + 350
               case jugadore.elo_fide - segundo.elo_fide > 350
                  sum_elo = sum_elo + jugadore.elo_fide - 350
               otherwise
                  sum_elo = sum_elo + segundo.elo_fide
            endcase
         else
            sum_elo = sum_elo + segundo.elo_fide
         endif
         pto_elo = pto_elo + resultad.ptos_blan
      endif
      skip
   enddo
   select elofide
   append blank
   replace idnumber with jugadore.licencia, ;
           name with jugadore.nombre,;
           fed with jugadore.federacion,;
           w with pto_elo,n with par_elo,;
           birthday with jugadore.fecha_naci,;
           woman with iif(upper(jugadore.sexo) <> "w",.f.,.t.)
   if (jugadore.elo_fide = 0 and par_elo < 4) or par_elo = 0
      replace rc with 0
   else
      replace rc with sum_elo/par_elo
   endif
   select jugadore
   skip
enddo
close databases