close databases
select 0
use resultad
set order to tag("resultado")
select 0
use acumula
zap
select 0
use cuadro
set order to tag("jugador")
set relation to resultado into resultad
goto top
do while not eof() and jug_num1 = 0
   skip
enddo
do while not eof()
   anterior = jug_num1
   acum = 0
   select acumula
   append blank
   replace num_lista with cuadro.jug_num1
   select cuadro
   do while anterior = jug_num1 and not eof()
      c_ronda = right('00' + ltrim(str(n_ronda)),2)
      rival = "rival_r" + c_ronda
      color = "color_r" + c_ronda
      acumu = "acumu_r" + c_ronda
      resul = "resul_r" + c_ronda
      acum = acum + resultad.ptos_blan
      selec acumula
      replace &rival with cuadro.jug_num2,;
              &color with iif(cuadro.resultado > 2," ",iif(cuadro.status,"B","N"));
              &acumu with acum,&resul with cuadro.resultado
      select cuadro 
      skip
   enddo
enddo
close databases
do suizo57