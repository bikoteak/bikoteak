set deleted off
select 0
use control
select 0
use resultad alias resulta1
set order to tag("resultado")
select 0
use resultad alias resulta2 again
set order to tag("resultado")
select 0
use resultad alias resulta3 again
set order to tag("resultado")
select 0
use banderas alias bandera1
set order to tag("federacion")
select 0
use banderas alias bandera2 again
set order to tag("federacion")
select 0
use banderas alias bandera3 again
set order to tag("federacion")
select 0
use jugadore alias jugador1
set order to tag("num_lista")
set relation to federacion into bandera1
select 0
use jugadore alias jugador2 again
set order to tag("num_lista")
set relation to federacion into bandera2
select 0
use jugadore alias jugador3 again
set order to tag("num_lista")
set relation to federacion into bandera3
select 0
use acumula
base = int((control.ronda-1)/3) * 3
c_ronda = right('00' + ltrim(str(base + 1)),2)
rival1 = "rival_r" + c_ronda
resul1 = "resul_r" + c_ronda
c_ronda = right('00' + ltrim(str(base + 2)),2)
rival2 = "rival_r" + c_ronda
resul2 = "resul_r" + c_ronda
c_ronda = right('00' + ltrim(str(base + 3)),2)
rival3 = "rival_r" + c_ronda
resul3 = "resul_r" + c_ronda
set relation to &rival1 into jugador1
set relation to &rival2 into jugador2 additive
set relation to &rival3 into jugador3 additive
set relation to &resul1 into resulta1 additive
set relation to &resul2 into resulta2 additive
set relation to &resul3 into resulta3 additive
*modi report cuadro3
report form cuadro3 to print prompt noconsole
close databases
set deleted on