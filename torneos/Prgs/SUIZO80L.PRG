
* Programa.: suizo80L.PRG
* Autor....: Juanjo ESCRIBANO LASA
* Fecha....: 03/12/91
* Aviso....: Copyright 1991, All Rights Reserved
* Objeto...: Display de registros en modo Locate (Sequencial)
*
STORE " " TO expression,string
* ---LOCATE section.
DO WHILE expression = " "
   @ 21,0 SAY clearline
   *
   @ 20,0 SAY "Ä"
   ACCEPT "Kokatzeko baldintza sakatu " TO expression
   @ 19,0 SAY clearline
   STORE TRIM(expression) TO expression
   DO CASE
      CASE LEN(expression) = 0
      * ---Exit.
         RETURN
      CASE TYPE('&expression')="L"
      * ---LOCATE the record.
         * ---Close index file for a faster LOCATE.
    SET INDEX TO
         LOCATE FOR &expression
         IF .NOT. EOF()
            * ---Found a matching record.
            STORE RECNO() TO lastrecord
             * ---Reopen index file.
            SET INDEX TO jugnom
            GOTO lastrecord
         ELSE
            * ---Reopen index file and
            * ---reset EOF marker to true (.T.).
            SET INDEX TO jugnom
            GO BOTTOM
            SKIP
         ENDIF
      OTHERWISE
      * ---INVALID EXPRESSION.
         @ 22,0 SAY clearline
         STORE " " TO select
         @ 22,0 SAY "BALIOGABEKO ADIERAZPENA: "+;
                    "Saka ezazu edozein tekla... ";
                GET select
         READ 
         @ 22,0 SAY clearline
         STORE " " TO expression
   ENDCASE
ENDDO
IF poschoice = "K"
   * ---Return to calling program if only the LOCATE was desired.
   RETURN
ENDIF
*
* ---DISPLAY section.
STORE " " TO string
DO WHILE string = " "
   ACCEPT "Ikusteko adierazpena " TO string
   @ 19,0 SAY clearline
   STORE TRIM(string) TO string
   DO CASE
      CASE LEN(string) = 0
      * ---Exit.
         @ 21,0 SAY clearline
         @ 22,0 SAY clearline
         RETURN
      CASE TYPE("&string")="U"
      * ---INVALID EXPRESSION.
         @ 22,0 SAY clearline
         STORE " " TO select
         @ 22,0 SAY "BALIOGABEKO ADIERAZPENA: "+;
                    "Saka ezazu edozein tekla... ";
                GET select
         READ 
         @ 22,0 SAY clearline
         STORE " " TO string
   ENDCASE
ENDDO
* ---Now, DISPLAY the expression.
STORE .F. TO is_eof,is_some
DO WHILE .NOT. is_eof
  @ 4,0 CLEAR
   @ 20, 0 to 20,79
   STORE 4 TO row
   DO WHILE .NOT. EOF() .AND. row-3 <= 15
      STORE .T. TO is_some
      @ row,0 SAY &string
      STORE row + 1 TO row
      CONTINUE
   ENDDO
   * ---A logical memory variable is used to detect the
   * ---end-of-file.  The EOF function cannot be used since
   * ---it is reset by the READ statement below.
   STORE EOF() TO is_eof
   IF .NOT. is_some
      * ---No matching records.
      @ 4,0 SAY "*** EZ DAGO HORRELAKO ERREGISTRORIK ***"
   ENDIF
   STORE " " TO select
   @ 21,0 SAY "Saka ezazu edozein tekla... ";
          GET select
   READ 
   @ 21,0 SAY clearline
ENDDO
  @ 4,0 CLEAR
GO TOP
RETURN
* EOF: suizo80L.PRG
