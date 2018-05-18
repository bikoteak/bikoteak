
* Programa.: suizo80E.PRG
* Autor....: Juanjo ESCRIBANO LASA
* Fecha....: 03/12/91
* Aviso....: Copyright 19**, All Rights Reserved
* Objeto...: Modo Edit
*
DO WHILE .T.
   STORE " " TO editchoice
   @ 21,0 SAY "AUKERAK: (A)ldaketa,ba(J)an,"+;
           "(E)rrekup.,(B)ilatu,(U)rrengoa,au(R)rekoa";
        GET editchoice PICTURE "!"
   READ 
   CLEAR GETS
   @ 21,0 SAY clearline
   IF .NOT. (editchoice $ "AJEBUR")
     RETURN
   ENDIF
   DO CASE
      CASE editchoice = "A"
      * ---(E)dit
         @ 21,0 SAY "Saka <PgDn> irtetzeko"
         IF .NOT. (BOF() .OR. EOF())
            DO suizo80s
            READ
         ENDIF
      CASE editchoice = "J"
      * ---(D)elete
         DELETE
         @ 1,55 SAY "BAJAN  "
      CASE editchoice = "E"
      * ---(U)ndelete
         RECALL
         @ 1,55 SAY "       "
      CASE editchoice = "B"
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
         @ 22,0 SAY "Saka ezazu edozein tecla...";
               GET select
         READ 
         @ 21,0 SAY clearline
         @ 22,0 SAY clearline
      ENDIF
      CASE editchoice = "U"
      * ---(S)kip.
          IF .NOT. EOF()
            SKIP
          ENDIF
      CASE editchoice = "R"
          IF .NOT. BOF()
            SKIP -1
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
ENDDO
RETURN
* EOF: suizo80E.PRG
