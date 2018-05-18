CLOSE DATABASES
SET debug on
SET STEP ON
SELECT 0
USE ? alias elo_feda
INDEX ON id_number TAG id_number
SET ORDER TO tag id_number
SELECT 0
USE fedafide
INDEX ON lic_fide TAG lic_fide
SET ORDER TO tag lic_fide
SET RELATION TO lic_feda INTO elo_feda
SELECT 0
USE jugadore
set relation to licencia into fedafide
DO WHILE NOT EOF()
   replace licencia_n WITH elo_feda.id_number, elo_naci WITH elo_feda.ro
SKIP
enddo
CLOSE all 