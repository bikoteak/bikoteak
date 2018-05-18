set talk off
set near on
select 0
use ? alias elofva
if not file(left(dbf(),len(dbf()) -3) + "cdx")
   index on jug tag jugador
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
         replace lic_fva with m.lic, nombre with m.jug;
                 elo_prov with m.elo,;
                 categoria with m.cat,fecha_naci with fech_nac
         do case
            case prov = "G"
               replace federacion with "Gip"
            case prov = "N"
               replace federacion with "Nav"
            case prov = "B"
               replace federacion with "Biz"
            case prov = "A"
               replace federacion with "Ala"
         endcase
      endif
   endif
enddo
set near off
close databases