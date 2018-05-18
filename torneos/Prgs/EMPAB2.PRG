parameters jug1,jug2,his_color1, his_color2, p_color1, p_color2,;
           p_colov1, p_colov2
if ((right(his_color1,2) = "BB" or;
    (p_color1 = "N" and p_colov1 > 1)) and;
   (right(his_color2,2) = "BB" or;
    (p_color2 = "N" and p_colov2 > 1))) or;
   ((right(his_color1,2) = "NN" or;
    (p_color1 = "B" and p_colov1 > 1)) and;
   (right(his_color2,2) = "NN" or;
    (p_color2 = "B" and p_colov2 > 1)))
***********************************************************************
* Van forzados los dos jugadores
***********************************************************************
   if control.ronda + 1 = torneo.num_rondas and grupo < mitad
***********************************************************************
* Control de color en la ultima ronda mitad superior
***********************************************************************
      wait window str(jug1,3) + " - " + str(jug2,3) +;
                  " colores forzados a " + p_color1;
                  timeout(5)
      return .t.
   else
      return .f.
   endif
else
***********************************************************************
* No va forzado al menos uno de los jugadores
***********************************************************************
   return .t.
endif