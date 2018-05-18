set talk off
set safety off
set date ital
SET BELL OFF
SET DELIMITER OFF
SET MENUS OFF
SET STATUS OFF
SET HELP OFF
*SET ESCAPE OFF
set path to ..\prgs, ..\reports,;
            ..\dbfcom~1, ..\internet
close all
fecha =DTOC(DATE())
arbitro = "IA Juanjo Escribano"
clear
@ 1,1,48,159 box
@ 3,2,03,158 box
@ 2,4 SAY arbitro
@ 2,40 say "|"
@ 2,46 say " D O N O S T I A"
@ 2,80 say "|" 
@ 2,82 say "Fecha:"
@ 2,90 say fecha
@ 4,46 say "X A K E - J O K U"

aukera = 1
DO WHILE .T.
   @ 6,08 to 32,99 clear
   @ 6,40 say "M E N U     P R I N C I P A L"
   @ 12,62 say " - Efectue su seleccion con las"
   @ 13,62 say "   teclas de movimiento del cursor"
   @ 14,62 say "   y pulsando RETURN."
   @ 16,62 say " - Los distintos submenues aparecen"
   @ 17,62 say "   dentro de esta ventana."
   @ 21,62 say " ======="
   @ 22,62 say " -Autor-  Juanjo Escribano Lasa"
   @ 23,62 say " =======  Versión 1.0"
   @ 26,62 say "     Donostia,Octubre de 1990"
   @ 11,07,24,45 box
   @ 11,60,33,100 box
   @ 12,9 prompt "INICIO DE TORNEO  "
   @ 14,9 prompt "PROCESO DE RONDAS "
   @ 16,9 prompt "FIN DE TORNEO     "
   @ 18,9 prompt "PROGRAMAS SERVICIO"
   @ 20,9 prompt "FIN DE SESION     "
   menu to aukera
   DO CASE
      CASE aukera = 1
         @  6,40 SAY "    INICIO DEL TORNEO         "
         @ 12,61 to 31,99 clear
         aukera1 = 1
         DO WHILE .T.
            @ 12,62 prompt "Comienzo del Torneo         "
            @ 14,62 prompt "Altas desde fichero         "
            @ 15,62 prompt "Modificacion de Jugadores   "
            @ 17,62 prompt "Eliminacion no presentados  "
            @ 18,62 prompt "Ordenacion final            "
            @ 20,62 prompt "Listado de inscritos        "
            @ 21,62 prompt "Listado de firmas           "
            @ 23,62 prompt "Banderas                    "
            @ 24,62 prompt "Etiquetas Identificación    "
            @ 25,62 prompt "Cargar ELO FIDE             "
            @ 26,62 prompt "Sorteo aleatorio            "
            @ 28,62 prompt "VOLVER AL MENU PRINCIPAL    "
            menu to aukera1
            DO CASE
               CASE aukera1 = 1
                  do suizo01
               CASE aukera1 = 2
                  do suizo40c
               CASE aukera1 = 3
                  do suizo80
               CASE aukera1 = 4
                  do suizo04
               CASE aukera1 = 5
                  do suizo05
               CASE aukera1 = 6
                  do suizo06
               CASE aukera1 = 7
                  do suizo24
               CASE aukera1 = 8
                  do bandera0
               CASE aukera1 = 9
                  do suizo30
               CASE aukera1 = 10
                  do frlcarga
               CASE aukera1 = 11
                  do sorteo
               CASE aukera1 = 12
                  exit
            ENDCASE
         ENDDO
      CASE aukera = 2
         @  6,40 SAY "    PROCESO DE RONDAS         "
         @ 12,61 to 31,99 clear
         aukera1 = 1
         DO WHILE .T.
            @ 12,62 prompt "Listado emparejamiento        "
            @ 13,62 prompt "Listado Oviedo                "
            @ 14,62 prompt "Etiquetas Resultados          "
            @ 15,62 prompt "Etiquetas mesa                "
            @ 17,62 prompt "Actual. emparejamiento        "
            @ 18,62 prompt "Actualizar resultados         "
            @ 19,62 prompt "Listar resultados             "
            @ 21,62 prompt "Baja/Alta Jugador             "
            @ 22,62 prompt "Cambiar número emparejamiento "
            @ 23,62 prompt "Preparar Clasificacion diaria "
            @ 24,62 prompt "Fichas arbitrales             "
            @ 25,62 prompt "Listar Clasificacion diaria   "
            @ 26,62 prompt "Cuadro diario                 "
            @ 27,62 prompt "Listado jugadores dirigidos   "
            @ 29,62 prompt "Emparejar                     "
            @ 31,62 prompt "VOLVER AL MENU PRINCIPAL      "
            menu to aukera1
            DO CASE
               CASE aukera1 = 1
                  do suizo11
               CASE aukera1 = 2
                  do suizo22
               CASE aukera1 = 3
                  do suizo31
               CASE aukera1 = 4
                  do mahia
               CASE aukera1 = 5
                  do suizo10
               CASE aukera1 = 6
                  do suizo12
               CASE aukera1 = 7
                  do suizo13
               CASE aukera1 = 8
                  do suizo14
               CASE aukera1 = 9
                  do cambnum
               CASE aukera1 = 10
                  do suizo17
               CASE aukera1 = 11
                  do suizo28
               CASE aukera1 = 12
                  do suizo18
               CASE aukera1 = 13
                  do suizo19
               CASE aukera1 = 14
                  do suizo81
               CASE aukera1 = 15
                  do empa00
               CASE aukera1 = 16
                  exit
            ENDCASE
         ENDDO
      CASE aukera = 3
         @  6,40 SAY "    FINAL DEL TORNEO          "
         @ 12,61 to 31,99 clear
         aukera1 = 1
         DO WHILE .T.
            @ 12,62 prompt "Clasificacion final        "
            @ 13,62 prompt "Listado cuadro             "
            @ 15,62 prompt "Listado de variacion Elo   "
            @ 16,62 prompt "Generar disco Elo FVA      "
            @ 18,62 prompt "Certificado Torneo Elo     "
            @ 19,62 prompt "Certificado Torneo Norma   "
            @ 20,62 prompt "Listado FCE                "
            @ 22,62 prompt "Listado Premios            "
            @ 23,62 prompt "IT3 - Informe Torneo       "
            @ 24,62 prompt "VOLVER AL MENU PRINCIPAL   "  
            menu to aukera1
            DO CASE
               CASE aukera1 = 1
                  do suizo17
               CASE aukera1 = 2
                  do suizo20
               CASE aukera1 = 3
                  do suizo27
               CASE aukera1 = 4
                  do suizo55
               CASE aukera1 = 5
                  do suizo51
               CASE aukera1 = 6
                  do suizo53
               CASE aukera1 = 7
                  DO suizo41
               CASE aukera1 = 8
                  DO premios
               CASE aukera1 = 9
                  DO torneo
               CASE aukera1 = 10
                  exit
            ENDCASE
         ENDDO
       CASE aukera = 4
         @  6,40 SAY "  PROGRAMAS DE SERVICIO       "
         @ 12,61 to 31,99 clear
         aukera1 = 1
         DO WHILE .T.
            @ 12,62 prompt "Datos impresora/pantalla/diskette"
            @ 14,62 prompt "Copia de seguridad            "
            @ 15,62 prompt "Restaurar de copia            "
            @ 17,62 prompt "VOLVER AL MENU PRINCIPAL      "
            menu to aukera1
            DO CASE
               CASE aukera1 = 1
                  do suizo21
               CASE aukera1 = 2
                   run erase &helb.:*.fxp
                   run erase &helb.:*.bak
                   run xcopy *.* &helb.:/s/m
               CASE aukera1 = 3
                   run copy &helb.:*.dbf  >nul
                   run copy &helb.:*.idx  >nul
                   run copy &helb.:*.mem  >nul
               CASE aukera1 = 4
                  exit
            ENDCASE
         ENDDO
       CASE aukera = 5
          exit
  ENDCASE
ENDDO