set talk off
set near on
select 0
use ? alias elofva
if not file(left(dbf(),len(dbf()) -3) + "cdx")
   index on nom tag jugador
endif
set order to tag("jugador")
select 0
use jugadore
define window ventana from 05,08 to 18,72 double
do while .t.
   clear
   abizena = space(20)
   @ 10,10 say "Sar ezazu jokalariarenen abizenak" get abizena
   read
   if abizena = space(1)
      exit
   endif
   select elofva
   seek trim(abizena)
   if .not. eof()
      browse window ventana nomodify norefresh
      scatter memvar
      grabar = " "
      do while at(grabar,"SN") = 0
         @ 12,10 say "Grabar (S/N):" get grabar picture "!"
         read
      enddo
      select jugadore
      if grabar = "S"
         append blank
         replace nombre with m.nom,;
                 elo_prov with m.elo,;
                 fecha_naci with m.fechanac,;
                 federacion with "ESP"
      endif
   endif
enddo
set near off
close databases