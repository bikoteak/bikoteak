SET DELETED OFF
SET POINT TO "."
SELECT 0
USE torneo
SELECT 0
USE sub_torn
SELECT 0
USE federaci
SELECT 0
USE federaci AGAIN ALIAS federaci2
SELECT 0
USE resultad
SET ORDER TO TAG("resultado")
SELECT 0
USE jugadore ALIAS segundo
SELECT 0
USE jugadore AGAIN
SELECT 0
USE cuadro
SET ORDER TO TAG("jugador")
SET RELATION TO jug_num2 INTO segundo additive
SET RELATION TO resultado INTO resultad
SET ALTERNATE TO elofide.txt
SET ALTERNATE on
SELECT jugadore
DO WHILE not eof()
   ? "001 " + STR(num_lista,4) + " " + sexo + IIF(sexo = "w",IIF(categoriaw <> " "," w" + categoriaw + " ","    "),"  " + categoria + " ") +;
     nombre + "  " + STR(elo_fide,4) + " " + federacion + " " +;
     STR(licencia,11) + " " + STR(fecha_naci,4) + SPACE(7) + STR(tot_ptos,4,1) +;
     " " + STR(clasific,4) + "  "
   SELECT cuadro
   rondilla = 1
   SEEK STR(jugadore.num_lista,3)
   DO while NOT EOF() AND jugadore.num_lista = cuadro.jug_num1
      IF rondilla = n_ronda
         ?? STR(jug_num2,4) + " " + IIF(status,"w","b") + " " + resultad.texto_ingl + "  "
         SKIP
      ELSE
         ?? SPACE(10)
      endif
      rondilla = rondilla + 1
   enddo
   SELECT jugadore
   SKIP
ENDDO
? "012 " + torneo.nom_torneo
? "022 " + torneo.localidad
? "032 " + torneo.pais
? "042 " + DTOC(torneo.fec_ini)
? "052 " + DTOC(torneo.fec_fin)
count TO cuantos
? "062 " + STR(cuantos,4)
COUNT FOR licencia <> 0 TO cuantos
? "072 " + STR(cuantos,4)
? "092 " + "Suizo Individual Mixto"
? "102 " + "IA Juanjo Escribano"
? "112 " + "FA Enrique Oiarzabal Iturrioz"
? "112 " + "   Javier Oyarzabal Alzugaray"
   ? "122 " + TRIM(torneo.prim_per) + "-" + torneo.segu_per
? "132 " + SPACE(87) + "11/07/16  " + "11/07/17  " + "11/07/18  " +;
                       "11/07/19  " + "11/07/20  " + "11/07/21  " +;
                       "11/07/22  " + "11/07/23  " + "11/07/24  "
set alternate to
CLOSE DATABASES
SET DELETED ON



