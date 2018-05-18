parameters rondilla
select cuadro
seek str(jugadore.num_lista,3) + str(rondilla,2)
if eof()
   select jugadore
   return(space(5))
endif   
select resultad
seek cuadro.resultado
select jugadore
if cuadro.jug_num2 = 0 and cuadro.resultado = 8
   return(space(5))
else
   return(str(resultad.ptos_blan,4,1) + resultad.incomparec)
endif
