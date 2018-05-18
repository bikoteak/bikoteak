parameters rondilla
public tot_pun
if rondilla = 1
   tot_pun = 0
endif
select cuadro
seek str(jugadore.num_lista,3) + str(rondilla,2)
if eof()
   select jugadore
   return(space(5))
endif   
select resultad
seek cuadro.resultado
select jugadore
tot_pun = tot_pun + resultad.ptos_blan
if cuadro.jug_num2 = 0 and cuadro.resultado = 8
   return(space(5))
else
   return(str(tot_pun,4,1) + resultad.incomparec)
endif
