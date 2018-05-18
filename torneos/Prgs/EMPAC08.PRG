if homogeneo
   exchange = .f.
   do empad2
   if exchange
      estado ="c04"
   else
      estado ="c09"
   endif
else
   estado = "c09"
endif