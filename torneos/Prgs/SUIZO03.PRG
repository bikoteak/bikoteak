clear
num_ron = num_rondas
@ 10,10 say "Introducir numero de Ronda:" get num_ron
read
use jugadore index jugadore
do while .not. eof()
   guarda = recno()
   min = num_ron
   max = 0
   i = 1
   suma = 0
   tot_suma = 0
   buchol = 0
   sonen  = 0
   @ 10,10 say "Jugador " get guarda picture "###"
   clear gets
   do while i <= num_ron
      rival = "rival_r"+ ltrim(str(i))
      resul = "result_r"+ ltrim(str(i))
      do case
         case &resul = 1
            suma = suma + 1
         case &resul = 2
            suma = suma + 0.5
         case &resul = 7
            suma = suma + 1
         case &resul = 9
            suma = suma + 1
      endcase
      if &rival <> 0
         seek &rival
         if tot_buc_c < min
            min = tot_buc_c
         endif
         if tot_buc_c > max
            max = tot_buc_c
         endif
         if &resul = 0 .or. &resul = 6
            sonen  = sonen  + tot_ptos
         else
            if &resul = 2
               sonen  = sonen  + tot_ptos/2
            endif
         endif
         buchol = buchol + tot_buc_c
      else
         if num_ron/2 < min
            min = num_ron/2
         endif
         if num_ron/2 > max
            max = num_ron/2
         endif
         buchol = buchol + num_ron/2
      endif
      tot_suma = tot_suma + suma
      goto guarda
      i = i + 1
   enddo
   replace tot_media with buchol-min-max,tot_buchol with buchol,;
           tot_sonen with sonen,tot_acum with tot_suma
   skip
enddo
sort to clasifi on tot_ptos/d,num_jug
close databases
use clasifi
con_pag = 0
con_lin = 99
puesto = 1
set print on
set printer to clasific.prn
set console off
? &top_page
do while .not. eof()
   if con_lin >= top_lin
      con_lin = 0
      con_pag = con_pag + 1
      if con_pag > 1
         eject
      endif
      ? space(15),&vis+texto+&vfs
      ?
      ? space(24),&vis+"Clasificacion",ltrim(str(num_ron)),"Ronda"+&vfs
      ?
      ? space(14),&vis+"   J U G A D O R    "+&vfs,&vis+"Ptos"+&vfs
      i = 1
      do while i <= 4
         do case
            case desem1 = i
               ?? " " + &vis + "Bucholz"+&vfs
            case desem2 = i
               ?? " " + &vis + "Sonnen"+&vfs
            case desem3 = i
               ?? " " + &vis + "Mediano"+&vfs
            case desem4 = i
               ?? " " + &vis + "Acum"+&vfs
         endcase
         i = i + 1
      enddo
   endif
   if .not. deleted()
      ? space(10),str(puesto,3),nombre,str(tot_ptos,4,1) + " "
      i = 1
      do while i <= 4
         do case
            case desem1 = i
               ?? str(tot_buchol,6,1)+"  "
            case desem2 = i
               ?? str(tot_sonen,6,2)+" "
            case desem3 = i
               ?? str(tot_media,6,1)+"  "
            case desem4 = i
               ?? str(tot_acum,4,1)+" "
         endcase
         i = i + 1
      enddo
      con_lin = con_lin + 1
      puesto = puesto + 1
   endif
   skip
enddo
?
?
?
?
? space(11),"Fdo.",arbitro
? space(11),trim(vloca),"a",dtoc(date())
eject
close databases
set printer to lpt1
set print off
set console on
run print clasific.prn
erase clasifi.dbf
