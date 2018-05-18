clear
SET DELETED OFF
use jugadore
set order to tag("num_lista")
jug_num = 999
do while jug_num <> 0
   @ 10,10 say "Introducir numero de jugador:" get jug_num picture "###"
   @ 12,10 say "Teclear 0 para acabar"
   read
   if jug_num <> 0
      seek jug_num
      if eof()
         @ 14,10 say "Numero de jugador no existe"
         loop
      endif
      if .not. deleted()
         delete
         @ 14,10 say nombre + " borrado"
      else
         recall
         @ 14,10 say nombre + " de alta"
      endif
   endif
ENDDO
SET DELETED ON
close databases