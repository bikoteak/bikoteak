set talk off
select 0
USE control
SELECT 0
USE TORNEO
scatter memvar
select 0
use tablaelo
set order to tag(1)
select 0
use fileelo
set order to tag(1)
set relation to str(cod_elofil,1) + control.tipo_torn into tablaelo
GOTO top
browse
select tablaelo
guarda = recno()
select 0
use ? alias elo
if not file(left(dbf(),len(dbf()) -3) + "cdx")
   do case
      case fileelo.cod_elofil = 1
         index on LOWER(name) tag name
      case fileelo.cod_elofil = 2
         index on jugador tag name
      case fileelo.cod_elofil = 3
         index on jug tag name
      case fileelo.cod_elofil = 4
         index on nom tag name
   endcase
endif
SET INDEX TO left(dbf(),len(dbf()) -3) + "cdx"
set order to tag(1)
select 0
use jugadore
define window ventana from 05,08 to 18,72 double
do while .t.
   CLEAR
   fitxategi = "N"
   abizena = space(32)
   kodea = 0
   @ 10,10 say "Id-Fitxategia" get fitxategi picture "!"
   @ 12,10 say "Sar ezazu jokalariaren kodea" get kodea picture "9999999999999"
   @ 14,10 say "Sar ezazu jokalariarenen abizenak" get abizena
   read
   IF fitxategi = "S"
      SELECT 0
      USE inscritos
      DO WHILE NOT EOF()
         select elo
         kodea = inscritos.id_fide
         if kodea <> 0
            set order to tag id_number
            seek kodea
            if .not. eof()
               DO grabar
            endif
         ENDIF
         SELECT INSCRITOS 
         SKIP
      enddo
      exit
   endif
   if abizena = space(1) and kodea = 0
      exit
   endif
   select elo
   if kodea <> 0
      set order to tag id_number
      seek kodea
   else   
      set order to tag name
      seek lower(trim(abizena))
   ENDIF
   if .not. eof()
      browse window ventana nomodify norefresh
      scatter memvar
      grabar = " "
      do while at(grabar,"SN") = 0
         @ 14,10 say "Grabar (S/N):" get grabar picture "!"
         read
      enddo
      select jugadore
      if grabar = "S"
         DO grabar
      endif   
   endif
enddo
close databases
CLEAR
*********************************************************************************************************
* Procedimiento grabar
*********************************************************************************************************

PROCEDURE grabar
SELECT JUGADORE
append blank
select tablaelo
goto guarda
do while not eof() and fileelo.cod_elofil = tablaelo.cod_elofil AND tablaelo.tipo_torn = control.tipo_torn
   select jugadore
   m.campo = tablaelo.cod_progra
   m.campo_fil = tablaelo.field_name
   cambio_elo = .f.
   IF SUBSTR(tablaelo.field_name,1,3) = "RO_"
      cambio_elo = .t.
   endif
   if tablaelo.field_rut <> 0
      do case
          case tablaelo.field_rut = 13
            &campo = suizoj13(elo.&campo_fil)
         case tablaelo.field_rut = 14
            &campo = suizoj14(elo.&campo_fil)
         case tablaelo.field_rut = 15
            &campo = suizoj15(elo.&campo_fil)
      endcase      
   ELSE
      IF cambio_elo
         &campo = IIF(elo.&campo_fil <> 0,elo.&campo_fil,elo.rt_s)
      else
         &campo = elo.&campo_fil
      endif
   ENDIF
   replace &campo with m.&campo
   select tablaelo
   skip
enddo
select tablaelo
RETURN