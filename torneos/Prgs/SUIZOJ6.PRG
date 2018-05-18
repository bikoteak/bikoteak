parameters rondilla
retorno = 0
select cuadro
seek str(jugadore.num_lista,3) + str(rondilla,2)
if not eof()
   retorno = cuadro.jug_num2
endif
selec jugadore
return retorno
   