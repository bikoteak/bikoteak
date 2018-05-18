clear
use control
num_ron = ronda
use
erase wron1.dbf
erase wron2.dbf
use rondas
copy to wron1
use
select 2
use wron1
select 1
use rondas
do while .not. eof()
   select 2
   append blank
   replace jug_num1 with a->jug_num2,jug_num2 with a->jug_num1
   select 1
   skip
enddo
close databases
use wron1
sort on jug_num1 to wron2
close databases
select 2
use jugadore
set order to tag("num_jug")
select 1
use wron2
if jug_num1 = 0
   skip
endif
j_num=-999
correcto = .t.
do while .not. eof()
   do case
      case jug_num1=j_num
         ? "Repetido jugador",str(jug_num1,3)
         correcto = .f.
         skip
      case jug_num1 > jugadore->num_jug
         select 2
         if .not. eof()
            if .not. deleted()
               ? "Jugador",str(num_jug,3),"sin emparejar"
               correcto = .f.
            endif
            skip
            select 1
         else
            select 1
            ? "Jugador",str(jug_num1,3),"no encontrado"
            correcto = .f.
            j_num=jug_num1
            skip
         endif
      case jug_num1 = jugadore->num_jug
         select 2
         if deleted()
            ? "Jugador",str(a->jug_num1,3),"eliminado"
            correcto = .f.
         endif
         i = 1
         do while i < num_ron
            rival = "rival_r" + ltrim(str(i))
            color = "color_r" + ltrim(str(i))
            if &rival = a->jug_num2 .and. &color <> " "
               ? "Match",str(a->jug_num1,3),"-",str(a->jug_num2,3)
               correcto = .f.
            endif
            if a->jug_num2 = 0 .and. &color = " "
               ? "Match",str(a->jug_num1,3),"-",str(a->jug_num2,3)
               correcto = .f.
            endif
            i = i + 1
         enddo
         skip
         select 1
         j_num=jug_num1
         skip
      otherwise
         ? "Jugador",str(jug_num1,3),"no encontrado"
         correcto = .f.
         j_num=jug_num1
         skip
   endcase
enddo
select 2
do while .not. eof()
   if .not. deleted()
      ? "Jugador",str(num_jug,3),"sin emparejar"
      correcto = .f.
   endif
   skip
enddo
close databases
erase wron1.dbf
erase wron2.dbf
wait
if correcto
   select 2
   use jugadore
   set order to tag("num_jug")
   select 1
   use rondas
   replace all minimo with min(jug_num1,jug_num2)
   goto top
   do while .not. eof()
      select jugadore
      seek rondas->jug_num1
      campo1 = tot_ptos
      seek rondas->jug_num2
      campo2 = tot_ptos
      select rondas
      replace ordenacion with str(max(campo1,campo2),4,1) +;
                              str(min(campo1,campo2),4,1)
      skip
   enddo
   close databases
   use rondas
   sort on ordenacion/d,minimo to work
   zap
   use rondas index rondas1,rondas2
   append from work
   replace all num_mesa with recno()
   use
   erase work.dbf
endif