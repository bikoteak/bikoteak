
* Programa.: suizo80P.PRG
* Autor....: Juanjo ESCRIBANO LASA
* Fecha....: 03/12/91
* Aviso....: Copyright 1991, All Rights Reserved
* Objeto...: Manejador de Posicion
*
STORE " " TO poschoice
@ 21,0 SAY clearline
@ 21,0 SAY "AUKERAK: (I)kusi, (B)ilatu, "+;
           "(K)okatu, (J)arraitu, (A)urrekoa, (U)rrengoa. ";
       GET poschoice PICTURE "!"
READ 
CLEAR GETS
@ 21,0 SAY clearline
IF .NOT. (poschoice $ "IBKJAU")
   RETURN
ENDIF
IF poschoice = "B"
   * ---(F)ind
   ACCEPT "Saka NOMBRE " TO findkey
   @ 21,0 SAY clearline
   STORE TRIM(findkey) TO findkey
   IF findkey = " "
      RETURN
   ENDIF
   STORE RECNO() TO lastrecord
   FIND "&findkey"
   IF .NOT.(BOF() .OR. EOF())
      DO suizo80g
      CLEAR GETS
   ELSE
      * ---NO FIND.
      GOTO lastrecord
      @ 21,0 SAY clearline
      @ 21,0 SAY " ***  EZ AURKITUA  ***"
      STORE " " TO select
      @ 22,0 SAY "Saka ezazu edozein tela...";
             GET select
      READ 
      @ 21,0 SAY clearline
      @ 22,0 SAY clearline
   ENDIF
ELSE
   * ---(S)kip, (C)ontinue, (D)isplay, or (L)ocate
   STORE RECNO() TO lastrecord
   DO CASE
      CASE poschoice = "U"
      * ---(S)kip.
          IF .NOT. EOF()
            SKIP
          ENDIF
      CASE poschoice = "A"
          IF .NOT. BOF()
            SKIP -1
          ENDIF
      CASE poschoice = "J"
      * ---(C)ontinue.
          IF .NOT. EOF()
            CONTINUE
          ENDIF
      OTHERWISE
      * ---(D)isplay or (L)ocate
         DO suizo80l
         IF expression = " "
            RETURN
         ENDIF
         IF poschoice = "I"
            IF string = " "
               RETURN
            ENDIF
            DO suizo80f
         ENDIF
   ENDCASE
   * ---Check for END-OF-FILE.
   IF .NOT. (EOF() .OR. BOF())
      DO suizo80g
      CLEAR GETS
   ELSE
      * ---EOF encountered.
      GOTO lastrecord
      @ 21,0 SAY clearline
      @ 21,0 SAY "Fitxategi-Amaiera bilatua."
      STORE " " TO select
      @ 22,0 SAY "Saka ezazu edozein tekla...";
             GET select
      READ 
      @ 21,0 SAY clearline
      @ 22,0 SAY clearline
   ENDIF
ENDIF
RETURN
* EOF: suizo80P.PRG
