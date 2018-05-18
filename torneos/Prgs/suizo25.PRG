clear
num_ron = 0
do while num_ron = 0
   @ 10,10 say "Teclear el numero de ronda" get num_ron picture "##"
   read
enddo
use hisrondas
delete all for n_ronda = num_ron
pack
use