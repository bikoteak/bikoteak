select 0
use sub_torn
set order to tag(1)
select 0
use control
set relation to sub_torneo into sub_torn
fichero = "internet\" +  "cla" + right("00" + alltrim(str(control.ronda)),2) + sub_torn.nombre
close databases
select 0
use torneo
select 0
use control
ult_ronda = iif(ronda = torneo.num_rondas,.t.,.f.)
nume_rond = control.ronda
if ult_ronda
   DO case
      CASE control.idioma = 1
         cabecera = "Sailkapen Orokorra"
      CASE control.idioma = 2
         cabecera = "Clasificacion final"
      OTHERWISE
         cabecera = "Clasificacion final"
   endcase
else
   DO case
      CASE control.idioma = 1
         cabecera = ltrim(str(control.ronda)) + ".txandaren Sailkapena"
      CASE control.idioma = 2
         cabecera = "Clasificacion " + ltrim(str(control.ronda)) + " Ronda"
      OTHERWISE
         cabecera = "Clasificacion " + ltrim(str(control.ronda)) + " Ronda"
   endcase
endif
use
texto_cab = ""
texto_cam = ""
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
report form clasific environment noconsole to print prompt for not deleted()
copy fields control.sub_torneo,clasific,nombre, federacion, categoria, tot_ptos to &fichero
do cls_html with nume_rond , fichero
close databases