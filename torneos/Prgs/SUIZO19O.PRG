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
      texto_cab = texto_cab + &vis + trim(lite_mini) + &vfs + " "
      texto_cam = texto_cam + "str(" + trim(campo_des) + "," +;
                  ltrim(str(long_edic)) + "," + ltrim(str(deci_edic)) +;
                  "),"
      skip
   enddo
endif
texto_cab = texto_cab + " " + &vis + "N.L." + &vfs + ""
texto_cam = texto_cam + "str(num_jug,5)"
clear
use jugadore
sort on clasific to wjuga
close databases
con_lin = 0
set print on
set printer to listcuad.prn
set console off
? &top_page
select 3
use jugadore
set order to tag("num_jug")
select 2
use federaci index federaci
select 1
use wjuga
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
      ? "A  -1Num-0 -1      N O M         -0 -1Fed-0 -1C-0 "+;
        "-1Rat.-0 "
      i = 1
      do while i <= num_rondas
         ?? "-1  " + str(i,2) + " -0 "
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
      select 3
      seek busca
      select 1
      if busca = 0
         ?? space(6)
      else
         ?? str(c->clasific,3),&c_color+" "
      endif
      i = i + 1
   enddo
   if elo_fide <> 0
      ? "TA  "+str(clasific,3),nombre,b->pais,categoria,;
        str(elo_fide,4)+"  "
   else
      ? "TA  "+str(clasific,3),nombre,b->pais,categoria,"      "
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
erase wjuga.dbf
run print listcuad.prn