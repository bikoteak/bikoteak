
* Programa.: suizo80D.PRG
* Autor....: Juanjo ESCRIBANO LASA
* Fecha....: 03/12/91
* Aviso....: Copyright 19**, All Rights Reserved
* Objeto...: Reorganizar la Base de datos. Se vuelve a crear Index
*
STORE DTOC(DATE()) TO fecha
CLEAR
@  2, 0 SAY "B I R R A N T O L A T U    J O K A L A R I E N   E G U N E R A P E N A"
@  2,72 SAY fecha
@  3, 0 to 03,79 double
STORE "E" TO select
@  5, 0 SAY "Fitxategia birrantolatu (B/E) ";
        GET select PICTURE "!"
READ
IF select <> "B"
   RETURN
ENDIF
USE
* ---Recreate index file.
USE jugadore INDEX jugnom,jugadore
PACK
USE
STORE " " TO select
@ 22,0 SAY clearline
@ 22,0 SAY "Saka ezazu edozein tekla...";
       GET select
READ
RETURN
* EOF: suizo80D.PRG
