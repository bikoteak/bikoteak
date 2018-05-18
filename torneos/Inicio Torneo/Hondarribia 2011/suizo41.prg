clear
use control
num_ron = ronda
orden2 = ""
texto_cab = ""
texto_cam = ""
use desempa
set order to tag("desempa")
goto top
do while .not. eof() .and. cod_desemp = 0
   skip
enddo
do while .not. eof()
   texto_cab = texto_cab + trim(lite_mini) + " "
   texto_cam = texto_cam + "str(jugadore." + trim(campo_des) + "," +;
               ltrim(str(long_edic)) + "," + ltrim(str(deci_edic)) +;
               ") + [ ] +"
   skip
enddo
use
set deleted off
texto_cab = texto_cab + " N.L."
texto_cam = texto_cam + "str(jugadore.num_lista,4)"
report form cuadroct environment noconsole to print prompt
set deleted on
close databases
