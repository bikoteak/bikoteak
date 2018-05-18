select 0
USE torneo.dbf
select 0
USE schedule
SET ORDER TO TAG num_ronda
select 0
USE banderas.dbf alias banderas1
SET ORDER TO TAG Federacion
select 0
USE federaci.dbf alias federaci1
SET ORDER TO TAG Federacion
SET RELATION TO federacion INTO Banderas1
select 0
USE jugadore.dbf alias jugadore1
SET ORDER TO TAG Num_jug
SET RELATION TO federacion INTO Federaci1
select 0
USE banderas.dbf AGAIN ALIAS Banderas2
SET ORDER TO TAG Federacion
select 0
USE federaci.dbf AGAIN ALIAS Federaci2
SET ORDER TO TAG Federacion
SET RELATION TO federacion INTO Banderas2
select 0
USE jugadore.dbf AGAIN ALIAS Jugadore2
SET ORDER TO TAG Num_jug
SET RELATION TO federacion INTO Federaci2
select 0
USE rondas.dbf
SET RELATION TO jug_num1 INTO Jugadore1
SET RELATION TO jug_num2 INTO Jugadore2 ADDITIVE
SET RELATION TO n_ronda INTO schedule additive
MODIFY REPORT schedule.frx NOENVIRONMENT
report form schedule TO PRINTER prompt
close databases