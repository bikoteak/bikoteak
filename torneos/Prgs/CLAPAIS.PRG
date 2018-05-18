set talk off
use paises
sort on federacion, sub_torneo,tot_ptos/d to clapais1
use
select 0
use clapais2
zap
select 0
use clapais1
do while not eof()
   viejo = federacion
   cate = sub_torneo
   select clapais2
   append blank
   replace federacion with viejo, tot_ptos with clapais1.tot_ptos,;
   sub_torneo with clapais1.sub_torneo
   select clapais1
   do while not eof() and viejo = clapais1.federacion;
      and cate = clapais1.sub_torneo 
      skip
   enddo
enddo
close databases
select 0
use clapais3
zap
select 0
use clapais2
do while not eof()
   viejo = federacion
   total_ptos = 0
   select clapais3
   append blank
   replace federacion with viejo
   select clapais2
   do while not eof() and viejo = federacion
      select clapais3
      campo = clapais2.sub_torneo
      replace &campo with clapais2.tot_ptos
      select clapais2
      total_ptos = total_ptos + clapais2.tot_ptos
      skip
   enddo
   select clapais3
   replace total_pais with total_ptos
   select clapais2
enddo
close data
use clapais3
sort on total_pais/d to clapais4
use clapais4
list to print noconsole
