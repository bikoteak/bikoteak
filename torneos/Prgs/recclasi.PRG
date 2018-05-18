CLOSE DATABASES
SELECT 0
USE jugadore
COPY TO copy_jug
GOTO top
select 0
use sub_torn
set order to tag(1)
select 0
use control
set relation to sub_torneo into sub_torn
fichero = "internet\" +  "cla" + right("00" + alltrim(str(control.ronda)),2) + sub_torn.nombre
SELECT 0
USE &fichero ALIAS ayuda
SELECT jugadore
DO WHILE .not. EOF()
   SELECT ayuda
   GOTO top
   DO WHILE .not. EOF()
      IF jugadore.nombre = ayuda.nombre
         SELECT jugadore
         replace clasific WITH ayuda.clasific, tot_ptos WITH ayuda.tot_ptos
         SELECT ayuda
         GOTO bottom
      endif
      SKIP
   ENDDO
   SELECT jugadore    
   SKIP
ENDDO
CLOSE DATABASES
DO suizo18
USE jugadore
ZAP
APPEND FROM copy_jug
USE
ERASE copy_jug