SELECT 0
USE control
SELECT 0
USE resultad
SET ORDER TO TAG("resultado")
SELECT 0
USE salida
zap
SELECT 0
USE jugadore
SET ORDER TO TAG("NUM_LISTA")
SELECT 0
USE jugadore AGAIN ALIAS segundo
SET ORDER TO TAG("NUM_LISTA")
SELECT 0
USE cuadro
SET RELATION TO jug_num1 INTO jugadore
SET RELATION TO jug_num2 INTO segundo additive
SET RELATION TO resultado INTO resultad additive
SET FILTER TO n_ronda = control.ronda AND status
GOTO top
DO WHILE NOT EOF()
   select salida
   APPEND BLANK
   replace N_ronda WITH control.ronda, num_mesa WITH cuadro.Num_mesa,;
           jug_num1 WITH cuadro.jug_num1, id_1 WITH jugadore.licencia,;
           n1 WITH ALLTRIM(resultad.sw_res_b)
   IF cuadro.jug_num2 <> 0
      replace jug_num2 WITH cuadro.jug_num2, id_2 WITH segundo.licencia, n2 WITH ALLTRIM(resultad.sw_res_n)
   else
      replace jug_num2 WITH -1, id_2 WITH segundo.licencia, n2 WITH ALLTRIM(resultad.sw_res_n)
   ENDIF
   if BETWEEN(resultad.resultado,6,8)
      replace incomparec WITH "F"
   else 
      replace incomparec WITH " "    
   endif
   SELECT cuadro
   skip
enddo
CLOSE DATABASES
USE salida
COPY to rondas DELIMITED WITH "" WITH CHARACTER ";"
USE
