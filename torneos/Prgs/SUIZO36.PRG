close databases
set talk off
set near on
select 0
use fedafide
set order to tag("lic_fide")
select 0
use ? alias elofeda
set near on
if not file(left(dbf(),len(dbf()) -3) + "cdx")
   index on JUGADOR tag jugador
endif
set order to tag("jugador")
define window ventana from 11,08 to 24,72 double
select 0
use ? alias elofide
set relation to code into fedafide
set filter to country = "ESP" or country = "AND"
goto top
do while not eof("elofide") and not eof("fedafide")
   skip
enddo
do while not eof()
   clear
   release abizena
   abizena = upper(elofide.name)
   @ 10,10 say "Sar ezazu jokalariarenen abizenak" get abizena size 1,36
   clear gets
   select elofeda
   seek trim(abizena)
   if .not. eof()
      browse window ventana nomodify norefresh
      scatter memvar
      grabar = " "
      do while at(grabar,"SN") = 0
         @ 12,10 say "Grabar (S/N):" get grabar picture "!"
         read
      enddo
      select fedafide
      if grabar = "S"
         append blank
         replace lic_feda with elofeda.clave, lic_fide with elofide.code
      endif
   endif
   select elofide
   skip
   do while not eof("elofide") and not eof("fedafide")
      skip
   enddo
enddo
clear
set near off
close databases