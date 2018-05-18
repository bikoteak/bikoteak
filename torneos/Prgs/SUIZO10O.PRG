clear
con_pag = 0
con_lin = 99
use control
num_ron = ronda
use
disco = "ronda" + ltrim(str(num_ron)) + ".prn"
@ 12,10 say "Prepare la impresora"
wait
set printer to &disco
set print on
set margin to 5
set console off
select 2
use jugadore
set order to tag("num_jug")
select 1
use rondas
mesa = 1
do while .not. eof()
   select 2
   seek a->jug_num1
   if con_lin >= top_lin
      con_lin = 0
      con_pag = con_pag + 1
      if con_pag > 1
         eject
      endif
      num_salto = 1
      do while num_salto <= salto
         ?
         num_salto = num_salto + 1
      enddo   
      ? &top_page
      ? space(20),&vis+texto+&vfs
      ?
      ? space(24),&vis+trim(tex_emp),str(num_ron,2),"Ronda"+&vfs
      ?
      ? &vis+"Mesa"+&vfs
   endif
   ? str(mesa,3),str(a->jug_num1,4),"-",str(a->jug_num2,3),space(3),;
     substr(trim(nombre)+"("+ltrim(str(tot_ptos,4,1))+")"+space(20),1,25),"- "
   seek a->jug_num2
   ?? trim(nombre)+"("+ltrim(str(tot_ptos,4,1))+")"
   select 1
   con_lin = con_lin + 1
   mesa = mesa + 1
   skip
enddo
?
?
?
?
? " Fdo.",arbitro
? " "+trim(vloca),"a",dtoc(date())
eject
close databases
set printer to
set margin to 0
set print off
set console on
clear
opcion = "N"
@ 10,10 say "Desea guardar la ronda: " get opcion picture "!"
read
if opcion = "S"
   set print on
   set margin to 5
   set console off
   set printer to &disco
   select 2
   use jugadore index jugadore
   select 1
   use rondas
   con_pag = 0
   con_lin = 99
   mesa = 1
   do while .not. eof()
      select 2
      seek a->jug_num1
      if con_lin >= top_lin
         con_lin = 0
         con_pag = con_pag + 1
         if con_pag > 1
            eject
         endif
         num_salto = 1
         do while num_salto <= salto
            ?
            num_salto = num_salto + 1
         enddo   
         ? &top_page
         ? space(20),&vis+texto+&vfs
         ?
         ? space(24),&vis+trim(tex_emp),str(num_ron,2),"Ronda"+&vfs
         ?
         ? &vis+"Mesa"+&vfs
      endif
      ? str(mesa,3),str(a->jug_num1,4),"-",str(a->jug_num2,3),space(3),;
        substr(trim(nombre)+"("+str(tot_ptos,3,1)+")"+space(20),1,25),"- "
      seek a->jug_num2
      ?? trim(nombre)+"("+str(tot_ptos,3,1)+")"
      select 1
      con_lin = con_lin + 1
      mesa = mesa + 1
      skip
   enddo
   ?
   ?
   ?
   ?
   ? " Fdo.",arbitro
   ? " "+trim(vloca),"a",dtoc(date())
   eject
   close databases
   set margin to 0
   set printer to lpt1
   set print off
   set console on
   clear
   select 2
   use hisrondas
   delete all for n_ronda = num_ron
   pack
   select 1
   use rondas
   mesa=1
   do while .not. eof()
      select 2
      append blank
      replace jug_num1 with a->jug_num1,jug_num2 with a->jug_num2;
              n_ronda with num_ron,num_mesa with mesa,resultado with 8
      mesa=mesa+1
      select 1
      skip
   enddo
   skip -1
   if jug_num2 = 0
      replace resultado with 9
   endif
   close databases
endif