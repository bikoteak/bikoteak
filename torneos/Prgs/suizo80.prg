
* Programa.: suizo80.PRG
* Autor....: Juanjo ESCRIBANO LASA
* Fecha....: 03/12/91
* Aviso....: Copyright 1991, All Rights Reserved
* Objeto...: Programa principal
*PUBLIC select, selectnum, editchoice, poschoice
*PUBLIC error, findkey, expression, string, is_eof
*PUBLIC clearline, addchoice, is_some, lastrecord
*
SET TALK OFF
SET BELL OFF
SET DELIMITER OFF
* ---Use blanks to clear-to-end-of-line.
STORE SPACE(80) TO clearline
STORE DTOC(DATE()) TO fecha

DO WHILE .T.

CLEAR
@  2,19 SAY "J O K A L A R I E N   E G U N E R A P E N A"
@ 1,0 to 3,79 double
@ 7,20 to 20,60 double
@  8,35 SAY " 1. Begiratze"
@  9,35 SAY " 2. Altak"
@ 10,35 SAY " 3. Aldaketak"
@ 11,35 SAY " 4. Birrantolatu"
@ 12,35 SAY " 5."
@ 13,35 SAY " 6."
@ 14,35 SAY " 7."
@ 15,35 SAY " 8."
@ 16,35 SAY " 9."
@ 18,35 SAY " 0. Irtera"
STORE 5 TO selectnum
DO WHILE selectnum < 0 .OR. selectnum > 4
   STORE " " TO select
   @ 20,33 SAY "Aukeratu : : "
   @ 20,43 GET select PICTURE "#"
   READ
   STORE VAL(select) TO selectnum
ENDDO

DO CASE
   CASE selectnum= 0
      RETURN
   CASE selectnum= 1
      USE jugadore
      set order to alias("jugnom")
      CLEAR
      @ 1, 0 SAY "B E G I R A T Z E    J O K A L A R I E N   E G U N E R A P E N A"
      @ 1,72 SAY fecha
      DO suizo80f
      IF ( EOF() .OR. BOF() )
         * ---The data file is empty.
         STORE " " TO select
         @ 21,0 SAY "FITXATEGIA HUTSIK"
         @ 22,0 SAY "Saka ezazu edozein tekla...";
                GET select
         READ
      ELSE
         * ---The data file contains records.
         DO suizo80g
         CLEAR GETS
         STORE "X" TO poschoice
         DO WHILE poschoice <> " "
            DO suizo80p
         ENDDO
      ENDIF
      USE
   CASE selectnum= 2
   *  DO add
      SET SAFETY OFF
      USE jugadore
      set order to tag("num_jug")
      COPY STRUCTURE TO Xjugadore.add
      SELECT 2
      USE Xjugadore.add
      CLEAR
      @ 1, 0 SAY "A L T A K   J O K A L A R I E N   E G U N E R A P E N A"
      @ 1,72 SAY fecha
      DO suizo80f
      @ 21,0 SAY "Saka <PgDn> irtetzeko"
      STORE "X" TO addchoice
      DO WHILE LEN (addchoice) <> 0
         APPEND BLANK
         DO suizo80g
         READ
         * ---NOMBRE cannot be blank.
         STORE TRIM( NOMBRE ) TO addchoice
         IF addchoice = " "
            addchoice = ""
         ENDIF
      ENDDO
      GO BOTTOM
      IF RECNO() <> 0
         DELETE
         PACK
      ENDIF
      USE
      SELECT 1
      APPEND FROM Xjugadore.add
      USE
      SELECT 2
      USE
      SELECT 1
      erase xjugadore.add
      SET SAFETY OFF
   CASE selectnum= 3
   *  DO edit
      USE jugadore
      set order to tag("nombre")
      CLEAR
      @ 1, 0 SAY "A L D A K E T A K    J O K A L A R I E N   E G U N E R A P E N A"
      @ 1,72 SAY fecha
      DO suizo80f
      IF ( EOF() .OR. BOF() )
         * ---The data file is empty.
         STORE " " TO select
         @ 21,0 SAY "FITXATEGIA HUTSIK"
         @ 22,0 SAY "Saka ezazu edozein tekla...";
                GET select
         READ
      ELSE
         * ---El fichero tiene registros.
      lastrecord = recno()
         DO suizo80g
         CLEAR GETS
         DO suizo80e
      ENDIF
      USE
   CASE selectnum= 4
   *  DO pack
      DO suizo80d
ENDCASE

ENDDO .T.
* EOF: suizo80.PRG