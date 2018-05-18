use clasifi2
ptos_viejo = tot_ptos
registro = recno()
do while ptos_viejo = tot_ptos
   skip
enddo
skip -1
if media_elo = 0
   replace all media_elo with 0
else
   skip
   replace rest media_elo with 0 
endif
sort to clasifi2 on &orden
use