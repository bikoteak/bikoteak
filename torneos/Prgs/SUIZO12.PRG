clear
use control
num_ron = ronda
use
select 0
use resultad
set order to tag("resultado")
@ 08,0 say "Resultados"
do while .not. eof()
   @ row()+1,0 say str(resultado,1) + " =" + texto
   skip
enddo
select 0
use jugadore
set order to tag("num_lista")
select 0
use jugadore alias segundo again
set order to tag("num_lista")
select 0
use cuadro
set filter to num_ron = n_ronda
goto top
set relation to jug_num1 into jugadore
set relation to jug_num2 into segundo additive
numer_mesa = 999
completo = " "
do while at(completo,"SN") = 0
   @ 10,15 say "Ronda completa" get completo picture "!"
   read
enddo
if completo = "S"
   do while .not. eof()
      do actualiz
   enddo
else
   do while numer_mesa <> 0
      do actualiz
   enddo
endif
close databases
procedure actualiz
if completo = "N"
   @ 10,15 say "Introducir numero de mesa" get numer_mesa picture "###"
   read
   locate for num_mesa = numer_mesa
   if eof()
      if numer_mesa <> 0
         @ 12,15 say "Mesa no encontrada"
      endif
      return
   endif
endif
resul_old = resultado
@ 12,15 say jugadore.nombre
@ 12,55 say segundo.nombre
@ 12,45 say "Res:" get resultado
read
if resul_old = resultado
   if completo = "S"
      skip
      if not eof()
         skip
      endif
   endif
   return
endif
select resultad
seek resul_old
select jugadore
if eof()
   ? 'jugador',cuadro->jug_num1,'no encontrado'
else
   replace tot_ptos with tot_ptos - resultad.ptos_blan,;
           tot_buc_c with tot_buc_c - resultad.ptos_bucho
endif
if cuadro.jug_num2 <> 0
   select segundo
   if eof()
      ? 'jugador',cuadro->jug_num2,'no encontrado'
   else
      replace tot_ptos with tot_ptos - resultad.ptos_negro,;
              tot_buc_c with tot_buc_c - 1 + resultad.ptos_bucho
   endif
endif
select resultad
seek cuadro->resultado
select jugadore
if eof()
   ? 'jugador',cuadro->jug_num1,'no encontrado'
else
   replace tot_ptos with tot_ptos + resultad.ptos_blan,;
           tot_buc_c with tot_buc_c + resultad.ptos_bucho
endif
if cuadro->jug_num2 <> 0
   select segundo
   if eof()
      ? 'jugador',cuadro->jug_num2,'no encontrado'
   else
      replace tot_ptos with tot_ptos + resultad.ptos_negro,;
              tot_buc_c with tot_buc_c + 1 - resultad.ptos_bucho
   endif
endif
select cuadro
resul_old = resultado
skip
if not eof()
   do case
      case resul_old = 0
         resul_old = 1
      case resul_old = 1
         resul_old = 0
      case resul_old = 7
         resul_old = 6
      case resul_old = 6
         resul_old = 7
   endcase
   replace resultado with resul_old
endif
if completo = "S" and not eof()
   skip
endif
return