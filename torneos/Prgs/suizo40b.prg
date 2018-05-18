set talk off
SELECT 0
USE TORNEO
scatter memvar
select 0
use tablaelo
set order to tag(1)
select 0
use fileelo
set order to tag(1)
set relation to cod_elofil into tablaelo
select tablaelo
guarda = recno()
select 0
use ? alias elo
if not file(left(dbf(),len(dbf()) -3) + "cdx")
   do case
      case fileelo.cod_elofil = 1
         index on id_number tag id_number
      case fileelo.cod_elofil = 2
         index on jugador tag name
      case fileelo.cod_elofil = 3
         index on jug tag name
      case fileelo.cod_elofil = 4
         index on nom tag name
   endcase
endif
SET INDEX TO left(dbf(),len(dbf()) -3) + "cdx"
set order to tag("id_number")
select 0
use jugadore
zap
SELECT 0
USE inscritos
SET RELATION TO id_number INTO elo
do while NOT EOF()
   select elo
   if .not. eof()
      scatter memvar
      select jugadore
      append blank
      select tablaelo
      goto guarda
      do while not eof() and fileelo.cod_elofil = tablaelo.cod_elofil
         select jugadore
         m.campo = tablaelo.cod_progra
         m.campo_fil = tablaelo.field_name
         if tablaelo.field_rut <> 0
            do case
               case tablaelo.field_rut = 11
                  &campo = suizoj11(jugadore.nombre, jugadore.sexo,elo.&campo_fil)
               case tablaelo.field_rut = 12
                  &campo = suizoj12(jugadore.sexo, elo.&campo_fil)
               case tablaelo.field_rut = 13
                  &campo = suizoj13(elo.&campo_fil)
               case tablaelo.field_rut = 14
                  &campo = suizoj14(elo.&campo_fil)
               case tablaelo.field_rut = 15
                  &campo = suizoj15(elo.&campo_fil)
            endcase      
         else
            &campo = elo.&campo_fil
         endif
         replace &campo with m.&campo
         select tablaelo
         skip
      ENDDO
      SELECT jugadore
      IF fecha_naci = 0 and inscritos.naci <> 0
         replace fecha_naci WITH inscritos.naci
      endif
      IF inscritos.feda <> 0
            replace elo_naci WITH inscritos.feda
      endif
      if inscritos.fce <> 0
         replace elo_prov WITH inscritos.fce
      endif
      select tablaelo
   else
      select jugadore
      append blank
      replace nombre WITH inscritos.nombre,;
              federacion WITH inscritos.pais,;
              fecha_naci WITH inscritos.naci,;
              fecha_naci WITH inscritos.naci,;
              elo_naci WITH inscritos.feda,;
              sexo WITH inscritos.sexo,;
              elo_prov WITH inscritos.fce
      select tablaelo
   ENDIF
   SELECT inscritos
   skip
enddo
close databases
clear