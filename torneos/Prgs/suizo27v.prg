set near on
select 0
use elofva
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
      if cuadro.resultado < 3
         elo_val = iif(segundo.elo_prov <> 0, segundo.elo_prov,;
                       iif(segundo.elo_naci <> 0, segundo.elo_naci,;
                           iif(segundo.elo_fide <> 0, segundo.elo_fide,0)))
         if elo_val <> 0
            par_elo = par_elo + 1
            sum_elo = sum_elo + segundo.elo_fide
            pto_elo = pto_elo + resultad.ptos_blan
         endif
      endif
      skip
   enddo
   select elofva
   append blank
   replace idnumber with jugadore.licencia, ;
           name with jugadore.nombre,;
           fed with jugadore.federacion,;
           w with pto_elo,n with par_elo,;
           woman with iif(upper(jugadore.sexo) <> "w",.f.,.t.)
   elo_val = iif(jugadore.elo_prov <> 0, jugadore.elo_prov,;
                 iif(jugadore.elo_naci <> 0, jugadore.elo_naci,;
                      iif(jugadore.elo_fide <> 0, jugadore.elo_fide,0)))
   replace rc with iif ((elo_val = 0 and par_elo < 4) or par_elo = 0, 0, sum_elo/par_elo)
   select jugadore
   skip
enddo
set near off
close databases