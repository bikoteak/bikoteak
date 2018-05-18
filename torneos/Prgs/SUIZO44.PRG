clear
use control
num_ron = ronda
ptos_mitad = num_ron / 2
use jugadore
sort to arbitro on tot_ptos/d,num_jug for .not. deleted()
use arbitro
do while .not. eof() .and. tot_ptos > ptos_mitad
   ptos_viejo = tot_ptos
   copy to work for ptos_viejo = tot_ptos .and. .not. deleted()
   do while .not. eof() .and. ptos_viejo = tot_ptos
      skip
   enddo
   do suizo441
enddo
goto bott
do while .not. bof() .and. tot_ptos < ptos_mitad
   ptos_viejo = tot_ptos
   copy to work for ptos_viejo = tot_ptos .and. .not. deleted()
   do while .not. bof() .and. ptos_viejo = tot_ptos
      skip -1
   enddo
   do suizo442
enddo
do while .not. bof() .and. .not. eof() .and. tot_ptos = ptos_mitad
   ptos_viejo = tot_ptos
   copy to work for ptos_viejo = tot_ptos .and. .not. deleted()
   do suizo443
enddo
close databases
erase arbitro.dbf
erase work.dbf
