CLOSE databases
SELECT 0
USE feda1212
INDEX ON lower(name) TAG nombre
SET ORDER TO nombre
SELECT 0
USE jugadore
SET RELATION TO LOWER(nombre) INTO feda1212
replace all licencia_n WITH feda1212.id_number, elo_naci WITH feda1212.rt_s
CLOSE DATABASES
