clear
gili = "N"
@ 10,10 say "Arbitro, Sabes lo que estas haciendo?." get gili;
        picture "!"
read
if gili <> "S"
   return
endif
release gili
clear
select 0
use torneo
@ 04,06 say "Texto de la cabecera:" get nom_torneo
@ row()+1,20 say "Localidad:" get localidad
@ row()  ,60 say "Pais:" get pais
@ row()+1,13 say "Numero de rondas:" get num_rondas picture "##"
@ row()+2,10 say "Fecha comienzo:" get fec_ini
@ row()  ,40 say "Fecha final:" get fec_fin
@ row()+2,10 say "Primer periodo:" get prim_per
@ row()+1,10 say "Segundo periodo:" get segu_per
read
use
select 0
use control
replace ronda with 0
use
release all
use desempa
set order to tag("desempa")
browse
USE calendario
browse
use jugadore
zap
use
use dirigido
zap
use ausencia
zap
use cuadro
zap
use
clear