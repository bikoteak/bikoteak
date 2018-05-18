*SET STEP ON
CLOSE databases
SELECT 0
USE jugadore
set order to TAG("num_lista")
COPY TO kk
USE kk
pack
SELECT 0
USE filtro
grupos = RECCOUNT()
GOTO top
******************************************************************************************************
* Separacion del fichero inicial en grupos confome al filtro
******************************************************************************************************
DO WHILE NOT EOF()
   nomfic = "grupo" + LTRIM(STR(RECNO()))
   SELECT kk
   GOTO top
   DO case
      case filtro.federacion <> SPACE(3)
         COPY TO &nomfic FOR federacion = filtro.federacion
         DELETE ALL FOR federacion = filtro.federacion
         PACK
      case filtro.inicio <> 0
         COPY TO &nomfic FOR BETWEEN(num_jug, filtro.inicio, filtro.final)
         DELETE ALL FOR BETWEEN(num_jug, filtro.inicio, filtro.final)
         PACK
      OTHERWISE
         COPY TO &nomfic
   ENDCASE
   SELECT filtro
   SKIP
enddo
CLOSE DATABASES
SELECT 0
USE filtro
******************************************************************************************************
* Comienzo del sorteo de grupos
******************************************************************************************************
DO WHILE NOT EOF()
   nomfic = "grupo" + LTRIM(STR(RECNO()))
   SELECT 0
   USE &nomfic ALIAS grupo
   DO sorteord
*******************************************************************************************************
* Fin de sorteo de grupo
*******************************************************************************************************   
   SELECT filtro
   skip
ENDdo
CLOSE databases
******************************************************************************************************
* Crear fichero de premiados y no premiados
******************************************************************************************************
USE grupo1
COPY TO premsi
COPY TO premno
USE premsi
ZAP
USE premno
ZAP
USE
******************************************************************************************************
* Cargar fichero de premiados y no premiados
******************************************************************************************************
SELECT 0
USE filtro
DO WHILE NOT EOF()
   nomfic = "grupo" + LTRIM(STR(RECNO()))
   SELECT 0
   USE &nomfic
   COPY TO kk2 FOR RECNO() <= filtro.cantidad
   COPY TO kk3 FOR RECNO() > filtro.cantidad
   USE premsi
   APPEND FROM kk2
   USE premno
   APPEND from kk3
   USE
   SELECT filtro
   SKIP
ENDDO
CLOSE databases
******************************************************************************************************
* Sortear fichero de premiados y no premiados
******************************************************************************************************
USE premsi
DO sorteord
*USE premno
*DO sorteord
******************************************************************************************************
* unir fichero de premiados y no premiados
******************************************************************************************************
USE kk
ZAP
APPEND FROM premsi
*APPEND FROM premno
replace ALL num_jug WITH RECNO()
use
******************************************************************************************************
* imprimir fichero
******************************************************************************************************
SELECT 0
USE torneo
SELECT 0
USE sub_torn
SET ORDER TO tag 1
SELECT 0
USE control
SET RELATION TO sub_torneo INTO sub_torn
USE kk
MODIFY REPORT sorteo
REPORT FORM sorteo ENVIRONMENT TO PRINTER prompt
CLOSE databases
erase kk.dbf
ERASE kk2.dbf
ERASE kk3.dbf
************************************************************************************************
* Procedimiento de sorteo puro
************************************************************************************************
PROCEDURE sorteord
   num_max = RECCOUNT()
   DIMENSION tabla(num_max), salida(num_max)
   FOR i = 1 TO num_max
      tabla(i) = i
   endfor
   =rand(-1)
   FOR i = 1 TO num_max - 1
      numero = INT(1 + (num_max-i + 1) * RAND())
      IF numero > num_max
         SUSPEND
      endif
      salida(i) = tabla(numero)
      IF EOF()
         SUSPEND
      endif
      replace num_jug WITH salida(i)
      skip
      =ADEL(tabla,numero)
   ENDFOR
   salida(i) = tabla(1)
   replace num_jug WITH salida(i)
   SORT ON num_jug TO kk2
   ZAP
   APPEND FROM kk2
   USE
return