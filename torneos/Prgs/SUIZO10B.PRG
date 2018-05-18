clear
use control
num_ron = ronda
use
disco = "hojas" + ltrim(str(num_ron)) + ".prn"
set printer to &disco
set print on
set console off
select 2
use jugadore index jugadore
select 1
use rondas
mesa = 1
do while .not. eof()
   select 2
   seek a->jug_num1
   ?? str(num_ron,2)
   ?? str(mesa,3),str(a->jug_num1,4),"-",str(a->jug_num2,3),space(3),;
     substr(trim(nombre)+"("+ltrim(str(tot_ptos,4,1))+")"+space(20),1,25),"- "
   seek a->jug_num2
   ?? trim(nombre)+"("+ltrim(str(tot_ptos,4,1))+")"
   ?
   select 1
   mesa = mesa + 1
   skip
enddo
set console on
set print off
set printer to lpt1
close databases
