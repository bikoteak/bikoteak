use clasifi2
do while not eof()
   ptos_viejo = tot_ptos
   registro = recno()
   do while not eof() and ptos_viejo = tot_ptos
      skip
   enddo
   skip -1
   if media_elo = 0
      goto registro
      do while not eof() and ptos_viejo = tot_ptos
         replace media_elo with 0
         skip
      enddo
   else
      skip
   endif
enddo
sort to clasifi on &orden
use
