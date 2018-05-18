clear
select 3
use resultad index resultad
select 2
use jugadore index jugadore
select 1
use hisronda
set relation to resultado into resultad
num_ron = 0
do while num_ron = 0
   @ 10,10 say "Introducir numero de ronda :" get num_ron picture "##"
   read
enddo
set filter to n_ronda=num_ron
goto top
rival = "rival_r" + ltrim(str(num_ron))
color = "color_r" + ltrim(str(num_ron))
result= "result_r" + ltrim(str(num_ron))
do while num_ron = n_ronda .and. .not. eof()
   do case
      case resultado=0
        resul=1
      case resultado=1
        resul=0
      case resultado=2
        resul=2
      case resultado=5
        resul=5
      case resultado=6
        resul=7
      case resultado=7
        resul=6
      case resultado=8
        resul=8
      case resultado=9
        resul=9
   endcase
   select 2
   seek a->jug_num1
   if eof()
      ? 'jugador',a->jug_num1,'no encontrado'
   else
      replace tot_ptos with tot_ptos-c->ptos_blan
      if resul < 5
         replace tot_buc_c with tot_buc_c-c->ptos_blan
      else
         replace tot_buc_c with tot_buc_c-0.5
      endif
   endif
   seek a->jug_num2
   if eof()
      ? 'jugador',a->jug_num2,'no encontrado'
   else
      replace tot_ptos with tot_ptos-c->ptos_negro
      if resul < 5
         replace tot_buc_c with tot_buc_c-c->ptos_negro
      else
         replace tot_buc_c with tot_buc_c-0.5
      endif
   endif
   select 1
   skip
enddo
close databases
