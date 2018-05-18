clear
use jugadore
set order to tag("num_lista")
num_ron = 0
do while num_ron = 0
   @ 10,10 say "Introducir numero de ronda :" get num_ron picture "##"
   read
enddo
jug_num = 999
do while jug_num <> 0
   @ 10,10 say "Introducir numero de jugador:" get jug_num picture "###"
   @ 12,10 say "Introducir 0 para terminar"
   read
   @ 14,10
   seek jug_num
   if .not. eof() .and. deleted()
      replace tot_buc_c with tot_buc_c - .5 * (num_rondas - num_ron)
      recall
   else
      @ 14,10 say "Numero de jugador no encontrado o ya de alta"
   endif
enddo
close databases