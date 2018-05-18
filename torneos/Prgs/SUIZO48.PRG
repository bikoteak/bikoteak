clear
use control
num_ron = ronda
use
if num_ron = 1
   return
endif
clear
select 3
use jugadore
set order to tag("num_jug")
select 2
use jugadore again alias segundo
set order to tag("num_jug")
select 1
use rondas index rondas1,rondas2
set order to 0
goto top
num_jug1 = 0
num_jug2 = 0
set relation to num_jug1 into jugadore
set relation to num_jug2 into segundo
do while .not. eof()
   guarda = recno()
   retro = " "
   do while at(retro,"SN") = 0
      retro = "N"
      @ 10,10 say "Mesa N." + str(num_mesa,3) get num_jug1 picture "###"
      @ 10,24 say "-" get num_jug2 picture "###"
      if recno() > 1
         @ 12,10 say "Retroceder (S/N):" get retro picture "!"
      endif
      read
   enddo
   if retro = "S"
      skip -1
      replace jug_num1 with 0,jug_num2 with 0
      loop
   endif
   if num_jug1 > num_jug2 .and. num_jug2 <> 0
      cambio = num_jug1
      num_jug1 = num_jug2
      num_jug2 = cambio
   endif
   @ 14,10 clear
   if num_jug1 = num_jug2
      @ 14,10 say "El rival debe ser otro jugador"
      loop
   endif
   if num_jug1 = 0
      @ 14,10 say "El jugador 1 debe ser <> 0"
      loop
   endif
   if num_jug2 = 0
      skip
      if .not. eof()
         @ 14,10 say "El jugador 2 debe ser <> 0"
         skip -1
         loop
      else
         skip -1
      endif
   endif
   set order to 1
   seek num_jug1
   if .not. eof()
      @ 14,10 say "Jugador " + str(num_jug1,3) + " repetido"
      set order to 0
      goto guarda
      loop
   endif
   if num_jug2 <> 0
       seek num_jug2
       if .not. eof()
          @ 14,10 say "Jugador " + str(num_jug2,3) + " repetido"
          set order to 0
          goto guarda
          loop
       endif
   endif
   set order to 2
   seek num_jug1
   if .not. eof()
      @ 14,10 say "Jugador " + str(num_jug1,3) + " repetido"
      set order to 0
      goto guarda
      loop
   endif
   if num_jug2 <> 0
      seek num_jug2
      if .not. eof()
         @ 14,10 say "Jugador " + str(num_jug2,3) + " repetido"
         set order to 0
         goto guarda
         loop
      endif
   endif
   set order to 0
   goto guarda
   select jugadore
*   seek num_jug1
   if eof() or deleted()
      @ 14,10 say "Jugador " + str(num_jug1,3) + " no encontrado o eliminado"
      select rondas
      loop
   endif
   blanca1 = 0
   negras1 = 0
   color1 = ""
   ultima1 = "  "
   do while i < num_ron
      color = "color_r" + ltrim(str(i))
      if &color = "B"
         blanca1 = blanca1 + 1
         ultima1 = substr(ultima1,2) + "B"
         color1 = color1 + "B"
      endif
      if &color = "N"
         negras1 = negras1 + 1
         ultima1 = substr(ultima1,2) + "N"
         color1 = color1 + "N"
      endif
      i = i + 1
   enddo
   if num_jug2 <> 0
      seek num_jug2
      if eof()
         @ 14,10 say "Jugador " + str(num_jug2,3) + " no encontrado"
         select rondas
         loop
      else
         if deleted()
            @ 14,10 say "Jugador " + str(num_jug2,3) + " eliminado"
            select rondas
            loop
         endif
      endif
   endif
   if num_jug2 <> 0
      bilatu = .f.
      color2 = ""
      ultima2 = "  "
      blanca2 = 0
      negras2 = 0
      i = 1
      do while i < num_ron
         rival = "rival_r" + ltrim(str(i))
         color = "color_r" + ltrim(str(i))
         if &color = "B"
            blanca2 = blanca2 + 1
            ultima2 = substr(ultima2,2) + "B"
            color2= color2 + "B"
         endif
         if &color = "N"
            negras2 = negras2 + 1
            ultima2 = substr(ultima2,2) + "N"
            color2= color2 + "N"
         endif
         if &rival = num_jug1 .and. &color = " "
            @ 14,10 say "Match "+str(num_jug1,3)+"-"+str(num_jug2,3)
            bilatu = .t.
         endif
         i = i + 1
      enddo
      select rondas
      if bilatu
         loop
      endif
      forza1 = " "
      pide1 = " "
      do case
         case ultima1 = "BB" .or. blanca1 > negras1 + 1
            pide1 = "N"
            forza1 = "*"
         case ultima1 = "NN" .or. negras1 > blanca1 + 1
            pide1 = "B"
            forza1 = "*"
         case blanca1 > negras1
            pide1 = "N"
         case blanca1 < negras1
            pide1 = "B"
         case blanca1 = negras1 .and. len(color1) <> 0
            if substr(color1,len(color1)) = "N"
               pide1 = "B"
            else
               pide1 = "N"
            endif
      endcase
      forza2 = " "
      pide2 = " "
      do case
         case ultima2 = "BB" .or. blanca2 > negras2 + 1
            pide2 = "N"
            forza2 = "*"
         case ultima2 = "NN" .or. negras2 > blanca2 + 1
            pide2 = "B"
            forza2 = "*"
         case blanca2 > negras2
            pide2 = "N"
         case blanca2 < negras2
            pide2 = "B"
         case blanca2 = negras2 .and. len(color2) <> 0
            if substr(color2,len(color2)) = "N"
               pide2 = "B"
            else
               pide2 = "N"
            endif
      endcase
      if forza1 = "*" .and. forza2 = "*" .and. pide1 = pide2
         @ 14,10 say "Forzados al mismo color"
         if num_ron = num_rondas
            forzarlo = " "
            do while at(forzarlo,"SN") = 0
               @ 14,10 say "Desea forzarlo" get forzarlo picture "!"
               read
            enddo
            if forzarlo = "S"
               forza1 = " "
               forza2 = " "
            else
               loop
            endif
         else
            loop
         endif
      endif
      do case
         case pide1 = "B" .and. pide2 <> "B"
            replace jug_num1 with num_jug1,jug_num2 with num_jug2
         case pide1 = "N" .and. pide2 <> "N"
            replace jug_num1 with num_jug2,jug_num2 with num_jug1
         case forza1 = "*"
            if pide1 = "B"
               replace jug_num1 with num_jug1,jug_num2 with num_jug2
            else
               replace jug_num1 with num_jug2,jug_num2 with num_jug1
            endif
         case forza2 = "*"
            if pide2 = "N"
               replace jug_num1 with num_jug1,jug_num2 with num_jug2
            else
               replace jug_num1 with num_jug2,jug_num2 with num_jug1
            endif
         otherwise
            if blanca1 - negras1 - (blanca2 - negras2) = 0
               do while len(color1) > 0 .and. len(color2) > 0 .and.;
                  substr(color1,len(color1)) = substr(color2,len(color2))
                  color1 = substr(color1,1,len(color1) - 1)
                  color2 = substr(color2,1,len(color2) - 1)
               enddo
               do case
                  case len(color1) = 0 .and. len(color2) = 0
                     if pide1 = "B"
                        replace jug_num1 with num_jug1,jug_num2 with num_jug2
                     else
                        replace jug_num1 with num_jug2,jug_num2 with num_jug1
                     endif
                  case len(color1) <> 0
                     if substr(color1,len(color1)) = "N"
                        replace jug_num1 with num_jug1,jug_num2 with num_jug2
                     else
                        replace jug_num1 with num_jug2,jug_num2 with num_jug1
                     endif
                  otherwise
                     if substr(color2,len(color2)) = "B"
                        replace jug_num1 with num_jug1,jug_num2 with num_jug2
                     else
                        replace jug_num1 with num_jug2,jug_num2 with num_jug1
                     endif
               endcase
            else
               do case
                  case blanca1 <> negras1
                  if pide1 = "B"
                     replace jug_num1 with num_jug1,jug_num2 with num_jug2
                  else
                     replace jug_num1 with num_jug2,jug_num2 with num_jug1
                  endif
                  case color1 = ""
                  if pide2 <> "B"
                     replace jug_num1 with num_jug1,jug_num2 with num_jug2
                  else
                     replace jug_num1 with num_jug2,jug_num2 with num_jug1
                  endif
                  otherwise
                  if pide1 = "N"
                     replace jug_num1 with num_jug1,jug_num2 with num_jug2
                  else
                     replace jug_num1 with num_jug2,jug_num2 with num_jug1
                  endif
               endcase
            endif
      endcase
   else
      select rondas
      replace jug_num1 with num_jug1,jug_num2 with num_jug2
   endif
   skip
enddo
close databases
clear
erase wron1.dbf
erase wron2.dbf
use rondas
copy to wron1
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
use jugadore index jugadore
select 1
use wron2
if jug_num1 = 0
   skip
endif
j_num=-999
do while .not. eof()
   do case
      case jug_num1=j_num
         ? "Repetido jugador",str(jug_num1,3)
         skip
      case jug_num1 > b->num_jug
         select 2
         if .not. eof()
            if .not. deleted()
               ? "Jugador",str(num_jug,3),"sin emparejar"
            endif
            skip
            select 1
         else
            select 1
            ? "Jugador",str(jug_num1,3),"no encontrado"
            j_num=jug_num1
            skip
         endif
      case jug_num1 = b->num_jug
         select 2
         if deleted()
            ? "Jugador",str(a->jug_num1,3),"eliminado"
         endif
         i = 1
         do while i < num_ron
            rival = "rival_r" + ltrim(str(i))
            color = "color_r" + ltrim(str(i))
            if &rival = a->jug_num2 .and. &color <> " "
               ? "Match",str(a->jug_num1,3),"-",str(a->jug_num2,3)
            endif
            if a->jug_num2 = 0 .and. &color <> " "
               ? "Match",str(a->jug_num1,3),"-",str(a->jug_num2,3)
            endif
            i = i + 1
         enddo
         skip
         select 1
         j_num=jug_num1
         skip
      otherwise
         ? "Jugador",str(jug_num1,3),"no encontrado"
         j_num=jug_num1
         skip
   endcase
enddo
select 2
do while .not. eof()
   if .not. deleted()
      ? "Jugador",str(num_jug,3),"sin emparejar"
   endif
   skip
enddo
close databases
erase wron1.dbf
erase wron2.dbf
wait
