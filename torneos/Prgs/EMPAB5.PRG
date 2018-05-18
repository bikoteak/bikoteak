parameter tipo,jugador
EXTERNAL ARRAY s2
*if control.ronda + 1 = control.num_rondas and grupo < mitad
*   return
*endif
if tipo = "A"
   do case
      case upfloat = 0
         comi = 1
         longitud = 2
      case upfloat = 1
         comi = 2
         longitud = 1
      otherwise
         return
   endcase
else
   do case
      case downfloat = 0
         comi = 1
         longitud = 2
      case downfloat = 1
         comi = 2
         longitud = 1
      otherwise
         return
   endcase
endif
if at(tipo,substr(s2(jugador,m.traspaso),comi,longitud)) <> 0
   emp_valido = .f.
endif