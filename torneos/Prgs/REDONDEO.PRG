PARAMETERS campo,porcentaje
redondo = campo * porcentaje/100
return(iif(redondo <> int(campo * porcentaje/100),int(redondo + 1),redondo))