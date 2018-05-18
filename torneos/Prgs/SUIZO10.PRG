clear
opcion = "N"
@ 10,10 say "Desea guardar la ronda: " get opcion picture "!"
read
if opcion = "S"
   select 0
   use control
   replace ronda with ronda + 1
   select 0
   use jugadore
   replace all traspaso with substr(traspaso,2)
   set order to tag("num_lista")
   select 0
   use jugadore again alias segundo
   set order to tag("num_lista")
   select 0
   use cuadro
   delete all for n_ronda = control.ronda
   pack
   select 0
   use rondas
   set relation to jug_num1 into jugadore
   set relation to jug_num2 into segundo additive
   mesa=1
   do while .not. eof()
      if jugadore.tot_ptos <> segundo.tot_ptos and jug_num1 <> 0 and;
         jug_num2 <> 0
         if jugadore.tot_ptos > segundo.tot_ptos
            select jugadore
            replace traspaso with substr(traspaso,1,1) + "D"
            select segundo
            replace traspaso with substr(traspaso,1,1) + "A"
         else
            select jugadore
            replace traspaso with substr(traspaso,1,1) + "A"
            select segundo
            replace traspaso with substr(traspaso,1,1) + "D"
         endif
      endif
      if rondas.jug_num1 <> 0 and rondas.jug_num2 = 0
         select jugadore
         replace traspaso with substr(traspaso,1,1) + "D"
      endif
      select cuadro
      append blank
      replace jug_num1 with rondas.jug_num1,jug_num2 with rondas.jug_num2;
              n_ronda with control.ronda,num_mesa with mesa,resultado with 8;
              status with .t.
      if jug_num1 = 0
         select segundo
         replace no_disputa with .t.,traspaso with substr(traspaso,1,1) + "D"
      endif
      append blank
      replace jug_num1 with rondas.jug_num2,jug_num2 with rondas.jug_num1;
              n_ronda with control.ronda,num_mesa with mesa,resultado with 8;
              status with .f.
      if jug_num2 = 0
         select jugadore
         replace no_disputa with .t.,traspaso with substr(traspaso,1,1) + "D"
      endif
      mesa=mesa+1
      select rondas
      skip
   enddo
   skip -1
   if jug_num2 = 0
      replace resultado with 9
   endif
   close databases
endif