SELECT 0
USE resultad
SET ORDER to TAG("resultado")
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
USE rondas
SET RELATION TO jug_num1 INTO jugadore
SET RELATION TO jug_num2 INTO segundo additive
SET RELATION TO resultado INTO resultad additive
DO WHILE NOT EOF()
   select salida
   APPEND BLANK
   replace N_ronda WITH rondas.n_ronda, num_mesa WITH rondas.Num_mesa,;
           jug_num1 WITH rondas.jug_num1, id_1 WITH jugadore.licencia,incomparec WITH " "
   IF rondas.jug_num2 <> 0
      replace jug_num2 WITH rondas.jug_num2, id_2 WITH segundo.licencia, n1 WITH "0", n2 WITH "0"
   else
      replace jug_num2 WITH -1, id_2 WITH segundo.licencia, n1 WITH "1", n2 WITH "1"
   endif
   SELECT rondas
   skip
enddo
CLOSE DATABASES
USE salida
COPY to rondas DELIMITED WITH "" WITH CHARACTER ";"
USE
