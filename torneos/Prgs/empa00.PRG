release all
close databases
if type("fin_bye") = "U"
   hora_ini = sys(2)
   use dirigido
   delete all for automatico
   pack
   use
endif
******************************************
* Definicion de variables de uso general *
******************************************
dimension v_trans(2),s1(2),s2(2)
num_campos = 9
num_jug = 1
pide_color = 2
pide_colov = 3
num_ord = 4
bracket_in = 5
bracket = 6
traspaso = 7
hist_color = 8
num_lista = 9
*
num_histor = 16
dimension historia(1,num_histor)
num_lis_ol = 1
comienz_ol = 2
num_jug_ol = 3
valor_p_ol = 4
val_p_g_ol = 5
valor_x_ol = 6
transpo_ol = 7
homogen_ol = 8
remaind_ol = 9
num_tra_ol = 10
top_tra_ol = 11
num_tr2_ol = 12
top_tr2_ol = 13
upfloat_ol = 14
downflo_ol = 15
intento_ol = 16
sw_historia = .f.
*
num_brackets = 0
opcionc07 = " "
transposi = .t.
homogeneo = .t.
comienzo = 1
m.num_empa = 0
num_jug_gr = 0
pide_blan = 0
pide_negra = 0
pide_nulo = 0
valor_p = 0
val_p_g = 0
valor_x = 0
valor_x_or = 0
num_transp = 0
top_transp = 0
num_trans2 = 0
top_trans2 = 0
downfloat = 0
upfloat = 0
remainder = .f.
intento = 1
color_malo = 0
******************************************
* Definicion de entorno                  *
******************************************
set talk off
set deleted on
set safety off
select 0
use torneo
select 0
use cuadro
set order to tag("jugador")
copy field jug_num1 to kk for resultado = 7 or resultado = 9
select 0
use bye
zap
append from kk
set order to tag("bye")
erase kk.dbf
select 0
use rondas
zap
select 0
use control
select 0
use ausencia
set index to ausencia.cdx
set order to tag(1)
select 0
use dirigido
set order to tag("dirigido")
set filter to n_ronda = control.ronda + 1 AND status
GOTO top
sum 1 to total_dir
select 0
use jugadore
set order to tag("clasific")
set relation to str(num_lista,3) into cuadro
set relation to str(control.ronda + 1,2) + str(num_lista,3) into ausencia additive
******************************************
* Creacion de grupos                     *
******************************************
sum 1 to total_jug for eof("ausencia")
total_jug = total_jug - total_dir
total_pen = total_jug
dimension dena(total_jug,num_campos),pendient(total_jug,num_campos)
goto top
num_regis = 1
orden = 1
for grupos = 1 to total_jug
   m.tot_ptos = jugadore.tot_ptos
   if control.ronda + 1 = torneo.num_rondas and;
      m.tot_ptos * 2 = control.ronda
      mitad = grupos
   endif
   do while not eof() and m.tot_ptos = jugadore.tot_ptos
      select ausencia
      seek str(control.ronda + 1,2) + str(jugadore.num_lista,3)
      if eof()
         select dirigido
         seek str(jugadore.num_lista,3)
         if eof()
            dena(num_regis,m.num_lista) = jugadore.num_lista
            dena(num_regis,m.num_jug) = jugadore.num_jug
            dena(num_regis,m.num_ord) = orden
            dena(num_regis,m.bracket_in) = grupos
            dena(num_regis,m.bracket) = grupos
            dena(num_regis,m.traspaso) = jugadore.traspaso
            acum_color = ""
            suma = 0
            select cuadro
            do while not eof() and cuadro.jug_num1 = jugadore.num_lista
               if resultado < 9
                  if status
                     acum_color = acum_color + "B"
                     suma = suma + 1
                  else
                     acum_color = acum_color + "N"
                     suma = suma - 1
                  endif   
               endif
               skip
            enddo
            do case
               case suma > 0
                  quiere = "N"
               case suma < 0
                  quiere = "B"
                  suma = 0 - suma
               case suma = 0
                  if empty(acum_color)
                     quiere = " "
                  else
                     quiere = substr(acum_color,len(acum_color))
                     if quiere ="B"
                        quiere = "N"
                     else
                        quiere = "B"
                     endif
                  endif      
            endcase
            dena(num_regis,m.pide_color) = quiere
            dena(num_regis,m.pide_colov) = suma
            dena(num_regis,m.hist_color) = acum_color
            select jugadore
            pendient(num_regis,m.num_lista) = dena(num_regis,m.num_lista)
            pendient(num_regis,m.num_jug) = dena(num_regis,m.num_jug)
            pendient(num_regis,m.num_ord) = dena(num_regis,m.num_ord)
            pendient(num_regis,m.bracket_in) = dena(num_regis,m.bracket_in)
            pendient(num_regis,m.bracket) = dena(num_regis,m.bracket)
            pendient(num_regis,m.traspaso) = dena(num_regis,m.traspaso)
            pendient(num_regis,m.pide_color) = dena(num_regis,m.pide_color)
            pendient(num_regis,m.pide_colov) = dena(num_regis,m.pide_colov)
            pendient(num_regis,m.hist_color) = dena(num_regis,m.hist_color)
            num_regis = num_regis + 1
         else
            @ 10,10 say str(jugadore.num_lista,3) + "dirigido"
         endif
      endif
      select jugadore
      skip
      orden = orden + 1
   enddo
   if eof()
      exit
   endif
endfor
use
select cuadro
set order to tag("emparejado")
bracket_m = grupos
if type("fin_bye") = "U"
   fin_bye = .f.
endif
goto top
******************************************
* Trabajo con todos los grupos           *
******************************************
set alternate to empareja.txt
set alternate on
for grupo = 1 to grupos
   downfloat = 0
   upfloat   = 0
   sw_pri_vez = .t.
   do empa01
endfor
set alternate to
set alternate off
if used("dirigido")
   select dirigido
   set filter to n_ronda = control.ronda + 1 and status
   copy to kk
   use
   select rondas
   append from kk
   erase kk.dbf
endif
******************************************
* fin de programa                        *
******************************************
close databases
if fin_bye
   return
endif
select 0
use jugadore
set order to tag("num_lista")
select 0
use jugadore again alias segundo
set order to tag("num_lista")
select 0
use rondas
set relation to jug_num1 into jugadore
set relation to jug_num2 into segundo additive
replace all minimo with iif(jugadore.tot_ptos = segundo.tot_ptos,min(jug_num1,jug_num2),;
   iif(jugadore.tot_ptos > segundo.tot_ptos,jug_num1,jug_num2))
replace all ordenacion with str(max(jugadore.tot_ptos,segundo.tot_ptos),4,1) +;
                            str(min(jugadore.tot_ptos,segundo.tot_ptos),4,1)
replace all ordenacion with space(8),minimo with 999 for minimo = 0
close databases
use rondas
sort on ordenacion/d,minimo to work
zap
select 0
use control
select rondas
append from work
replace all num_mesa with recno(), n_ronda with control->ronda + 1
use
erase work.dbf
set safety on
set deleted off
close databases
hora_fin = sys(2)
if hora_fin > hora_ini
   ? "Duracion =",str(val(hora_fin) - val(hora_ini),4),"segundos"
else
   ? "Duracion =",str(val(hora_fin) + 86400 - val(hora_ini),4),"segundos"
ENDIF
DO swissemp