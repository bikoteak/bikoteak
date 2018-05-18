
* Programa.: suizo80S.PRG
* Autor....: Juanjo ESCRIBANO LASA
* Fecha....: 03/12/91
* Aviso....: Copyright 19**, All Rights Reserved
* Objeto...: Generador de Gets en modo Edit
*
IF DELETED()
   @ 1,55 SAY "BAJAN  "
ELSE
   @ 1,55 SAY "       "
ENDIF
@  4,11 say Num_jug
@  5,11 GET Licencia
@  6,11 get Nombre
@  7,11 GET Federacion
@  8,11 GET Categoria
@  9,11 GET Elo_fide
@ 10,11 GET Elo_naci
@ 11,11 GET Elo_prov
@ 12,11 GET Oharra
RETURN
* EOF: suizo80S.PRG
