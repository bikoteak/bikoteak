set talk off
num_files = adir(tabla,"..\banderas\mundo\*.bmp")
=asort(tabla)
select 0
use federaci
set order to tag(1)
set filter to tipo_fiche = space(3)
goto top
aceptarcancelar = 1
valor = space(15)
clear
do while not eof()
   @ 13,7  GET valor PICTURE '@^' FROM tabla SIZE 15, 15
   @ 09,2  TO 17,63
   @ 10,5  SAY ' Pais:'
   @ 10,11 say federaci.nombre_fed
   @ 12,27 GET aceptarcancelar PICTURE '@*VT \!Aceptar;\?Cancelar';
     SIZE 1, 10, 2 DEFAULT 0
   @ 12,47 GET salir PICTURE '@*VT \!Continuar;\?Salir';
     SIZE 1, 10, 2 DEFAULT 0
   READ CYCLE
   if salir = 2
      exit
   endif
   if aceptarcancelar = 1
      @ 20,20 say valor
      tipo = right(valor,3)
      nombre = substr(valor,1,len(valor)-4)
      fichero = "..\banderas\mundo\" + valor
*      append general bandera from &fichero
      replace fichero with nombre,tipo_fiche with tipo
   else
      @ 20,20 say space(15)
   endif
   skip
enddo
CLOSE DATABASE
