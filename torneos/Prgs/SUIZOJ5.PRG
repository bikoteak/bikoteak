suspend
i = 1
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
select rondas
return