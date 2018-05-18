set talk off
select 0
use federaci
set order to tag(1)
select 0
use banderas
set order to tag(1)
set relation to federacion into federaci
do while not eof()
   do case
      case federaci.tipo_fed = 1
         fichero = "..\banderas\mundo\" + trim(federaci.fichero) + "." + federaci.tipo_fiche
         @ 10,10 say fichero
         append general bandera from "&fichero" class paint.picture
      case federaci.tipo_fed = 2
         fichero = "..\banderas\autonomia\" + trim(federaci.fichero) + "." + federaci.tipo_fiche
         @ 10,10 say fichero
         append general bandera from "&fichero" class paint.picture
      case federaci.tipo_fed = 3
         fichero = "..\banderas\provincia\" + trim(federaci.fichero) + "." + federaci.tipo_fiche
         @ 10,10 say fichero
         append general bandera from "&fichero" class paint.picture
   endcase      
   skip
enddo
CLOSE DATABASE
