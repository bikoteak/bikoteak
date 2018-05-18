clear
use control
num_ron = ronda
orden2 = ""
texto_cab = ""
texto_cam = ""
if num_ron = num_rondas
   use desempa index desempa
   do while .not. eof() .and. cod_desemp = 0
      skip
   enddo
   do while .not. eof()
      orden2 = orden2 + trim(campo_des) + "/d,"
      texto_cab = texto_cab + trim(lite_mini) + " "
      texto_cam = texto_cam + "str(" + trim(campo_des) + "," +;
                  ltrim(str(long_edic)) + "," + ltrim(str(deci_edic)) +;
                  "),"
      skip
   enddo
endif
use
texto_cab = texto_cab + " N.L."
texto_cam = texto_cam + "str(num_jug,5)"
clear
con_lin = 0
set print on
set printer to listcuad.prn
set console off
select 3
use jugadore
set order to tag("num_jug")
select 2
use federaci
set order to tag("federacion")
select 1
use jugadore again alias wjuga
if num_ron = num_rondas
   set order to tag("clasific")
else
   set order to tag("num_jug")
endif
set relation to federacion into federaci
do while .not. eof()
   @ 10,10 say nombre
   ptos_tot = 0
   if (con_lin = 25 .and. num_rondas <= 9) .or.;
      (con_lin = 18 .and. num_rondas > 9)
      con_lin = 0
      eject
   endif
   if con_lin = 0
      ? "A  Num       N O M          Fed C "+;
        "Rat. "
      i = 1
      do while i <= num_rondas
         ?? "  " + str(i,2) + "  "
         i = i + 1
      enddo
      ?? " " + texto_cab
   endif
   ? "S0A",space(36)+" "
   i = 1
   do while i <= num_rondas
      c_rival = "rival_r" + ltrim(str(i))
      c_color = "color_r" + ltrim(str(i))
      busca = &c_rival
      if busca = 0
         ?? space(6)
      else
         if num_ron = num_rondas
            select jugadore
            seek busca
            select wjuga
            ?? str(c->clasific,3),&c_color+" "
         else
            ?? str(&c_rival,3),&c_color+" "
         endif
      endif
      i = i + 1
   enddo
   if num_ron = num_rondas
      if elo_fide <> 0
         ? "TA  "+str(clasific,3),nombre,b->pais,categoria,;
           str(elo_fide,4)+"  "
      else
         ? "TA  "+str(clasific,3),nombre,b->pais,categoria,"      "
      endif
   else   
      if elo_fide <> 0
         ? "TA  "+str(num_jug,3),nombre,b->pais,categoria,;
           str(elo_fide,4)+"  "
      else
         ? "TA  "+str(num_jug,3),nombre,b->pais,categoria,"      "
      endif
   endif
   i = 1
   do while i <= num_rondas
      c_result = "result_r" + ltrim(str(i))
      c_rival = "rival_r" + ltrim(str(i))
      ntexto = " "
      do case
         case &c_result = 1
            ptos_tot = ptos_tot + 1
         case &c_result = 2
            ptos_tot = ptos_tot + .5
         case &c_result = 6
            ntexto = "x"
         case &c_result = 7
            ntexto = "x"
            ptos_tot = ptos_tot + 1
         case &c_result = 8
            ntexto = "x"
         case &c_result = 9
            ntexto = "+"
            ptos_tot = ptos_tot + 1
      endcase
      if &c_rival = 0 .and. &c_result <> 9
         ?? space(6)
      else
         ?? str(ptos_tot,4,1)+ntexto+" "
      endif
      i = i + 1
   enddo
   if .not. deleted()
      ?? &texto_cam
   endif
   con_lin = con_lin + 1
   skip
enddo
? ""
eject
set printer to lpt1
set print off
set console on
close databases