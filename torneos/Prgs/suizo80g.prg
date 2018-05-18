IF DELETED()
   @ 1,55 SAY "BAJAN  "
ELSE
   @ 1,55 SAY "       "
ENDIF
@  4,11 say Num_jug
@  5,11 GET Licencia
@  6,11 GET Nombre
@  7,11 GET Federacion
@  8,11 GET Categoria
@  9,11 GET Elo_fide
RETURN