texto_cab = ""
texto_cam = ""
*********************************************************************************************************
** Texto de los desempates y fórmula de cálculo
*********************************************************************************************************
select 0
use desempa
DIMENSION tabla(RECCOUNT())
set order to tag("desempa")
goto top
i=0
do while .not. eof() .and. cod_desemp = 0
   skip
enddo
do while .not. eof()
   i = i + 1
   tabla(i) = campo_des
   texto_cab = texto_cab + trim(lite_mini) + " "
   texto_cam = texto_cam + "str(" + trim(campo_des) + "," +;
               ltrim(str(long_edic)) + "," + ltrim(str(deci_edic)) +;
               ") + [ ] +"
   skip
enddo
use
texto_cab = texto_cab + "N.L."
texto_cam = texto_cam + "str(num_lista,3)"
*******************************************************************************************************
* Creación de todos los premios
*******************************************************************************************************
select 0
use torneo
SELECT 0
USE sub_torn
SET ORDER TO TAG(1)
SELECT 0
USE control
SET RELATION TO sub_torneo INTO sub_torn
SELECT 0
USE clasifi
SELECT 0
USE premios
DO WHILE .not. EOF()
   cabecera = premios.titulo
   DO case
      CASE premios.tipo = "Tramo "
         filtro = "Elo_fide < " + ALLTRIM(STR(premios.tramo))
      CASE premios.tipo = "Edad "
         filtro = "year(DATE()) - fecha_naci > premios.edad_min and;
                   year(DATE()) - fecha_naci < premios.edad_max"
      CASE premios.tipo = "Local "
         filtro = "premios.federacion = clasifi.federacion"
      CASE premios.tipo = "Edad_Local"
         filtro = "year(DATE()) - fecha_naci > premios.edad_min and ;
                   year(DATE()) - fecha_naci < premios.edad_max and ;
                   premios.federacion = clasifi.federacion"
      CASE premios.tipo = "Sexo"
         filtro = "sexo = 'w'"
   ENDCASE
   SELECT clasifi
   SET FILTER TO &filtro
   GOTO top
   report form premios environment noconsole to print prompt for not deleted()
   SELECT premios
   SKIP
ENDDO
CLOSE databases