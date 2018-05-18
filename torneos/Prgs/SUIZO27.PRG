set deleted off
opcion = " "
clear
do while opcion <> "S" .and. opcion <> "N"
   @ 10,10 say "Listado Actuaciones FIDE (S=Si,N=No):";
           get opcion picture "!"
   read
enddo
if opcion = "S"
* Obtención del diskete de la FIDE
   do suizo27d
*
   select 0
   use seleccio
   zap
   select 0
   use jugadore
   set order to tag("num_lista")
   do while .not. eof() .and. (elo_fide = 0 .or. clasific = 0)
      skip
   enddo
   do while .not. eof()
      select seleccio
      append blank
      replace num_jug with jugadore.num_lista
      select jugadore
      skip
      do while .not. eof() .and. (elo_fide = 0 .or. clasific = 0)
         skip
      enddo
   enddo
   close databases
   fichero = "listfide.prn"
   tipo_list = 1
   do suizo27r
   select 0
   use jugadore alias segundo
   set order to tag("num_lista")
   select 0
   use cuadro
   set order to tag("jugador")
   set relation to jug_num2 into segundo
   select 0
   use seleccio
   zap
   select 0
   use jugadore again
   set order to tag("num_lista")
   set relation to str(num_lista,3) into cuadro
   do while .not. eof() .and. elo_fide <> 0
      skip
   enddo
   do while .not. eof()
      num_elados = 0
      select cuadro   
      do while not eof() and cuadro.jug_num1 = jugadore.num_lista
         if cuadro.resultado < 3
            if segundo.elo_fide <> 0
               num_elados = num_elados + 1
            endif
         endif
         skip
      enddo
      if num_elados > 3
         select seleccio
         append blank
         replace num_jug with jugadore.num_lista
      endif
      select jugadore
      skip
      do while .not. eof() .and. elo_fide <> 0
         skip
      enddo
   enddo
   close databases
   fichero = "fidealta.prn"
   tipo_list = 2
   do suizo27r
endif
opcion = " "
do while opcion <> "S" .and. opcion <> "N"
   @ 10,10 say "Listado Actuaciones FEDA (S=Si,N=No):";
           get opcion picture "!"
   read
enddo
if opcion = "S"
   select 0
   use seleccio
   zap
   select 0
   use jugadore
   set order to tag("num_lista")
   do while .not. eof() .and. ((jugadore.federacion <> "ESP" .and. elo_naci = 0 );
            .or. (elo_fide = 0 .and. elo_naci = 0))
      skip
   enddo
   do while .not. eof()
      select seleccio
      append blank
      replace num_jug with jugadore.num_lista
      select jugadore
      skip
      do while .not. eof() .and. ((jugadore.federacion <> "ESP" .and. elo_naci = 0 );
            .or. (elo_fide = 0 .and. elo_naci = 0))
         skip
      enddo
   enddo
   close databases
   fichero = "listfeda.prn"
   tipo_list = 3
   do suizo27r
   select 0
   use jugadore alias segundo
   set order to tag("num_lista")
   select 0
   use cuadro
   set order to tag("jugador")
   set relation to jug_num2 into segundo
   select 0
   use seleccio
   zap
   select 0
   use jugadore again
   set order to tag("num_lista")
   set relation to str(num_lista,3) into cuadro additive
   do while .not. eof() .and. (elo_fide <> 0 .or. elo_naci <> 0 .or.;
            (jugadore.federacion <> "ESP" .and. elo_naci = 0))
      skip
   enddo
   do while .not. eof()
      num_elados = 0
      select cuadro
      do while not eof() and jugadore.num_lista = cuadro.jug_num1
         if cuadro.resultado < 3
            if segundo.elo_fide <> 0 .or. segundo.elo_naci <> 0
               num_elados = num_elados + 1
            endif
         endif
         skip
      enddo
      select jugadore
      goto recno()
      if num_elados > 3
         select seleccio
         append blank
         replace num_jug with jugadore.num_lista
         select jugadore
      endif
      skip
      do while .not. eof() .and. (elo_fide <> 0 .or. elo_naci <> 0 .or.;
               (jugadore.federacion <> "ESP" .and. elo_naci = 0))
         skip
      enddo
   enddo
   close databases
   fichero = "fedaalta.prn"
   tipo_list = 4
   do suizo27r
endif
opcion = " "
do while opcion <> "S" .and. opcion <> "N"
   @ 10,10 say "Listado  Actuaciones  FVA  (S=Si,N=No):";
           get opcion picture "!"
   read
enddo
if opcion = "S"
   do suizo27v
endif
set deleted on