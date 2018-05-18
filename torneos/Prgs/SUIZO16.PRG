clear
select 3
use resultad index resultad
select 2
use jugadore index jugadore
select 1
use hisronda
set relation to resultado into resultad
set filter to resultado = 5
goto top
num_ron = 0
do while num_ron = 0
   @ 10,10 say "Introducir numero de ronda :" get num_ron picture "##"
   read
enddo
do while n_ronda <> num_ron .and. .not. eof()
  skip
enddo
clear
@ 09,10 say "Resultados"
@ 10,10 say "0 =  0-1"
@ 11,10 say "1 =  1-0"
@ 12,10 say "2 =  0.5"
@ 13,10 say "5 = aplaz"
@ 14,10 say "6 =  0-1 i"
@ 15,10 say "7 =  1-0 i"
@ 16,10 say "8 =  0-0 i"
@ 17,10 say "9 =  S. E."
do while n_ronda = num_ron .and. .not. eof()
   select 2
   seek a->jug_num1
   @ 20,01 get nombre
   seek a->jug_num2
   @ 20,40 get nombre
   clear gets
   select 1
   @ 20,30 say "Res:" get resultado
   read
   resul = resultado
   select 3
   seek resul
   if resul <> 5
      select 2
      seek a->jug_num1
      rival = "rival_r" + ltrim(str(num_ron))
      color = "color_r" + ltrim(str(num_ron))
      result= "result_r" + ltrim(str(num_ron))
      replace &rival with a->jug_num2,&result with a->resultado,;
              tot_ptos with tot_ptos+c->ptos_blan
      if resul < 6
         replace &color with 'B',tot_buc_c with tot_buc_c+c->ptos_blan
      else
         replace tot_buc_c with tot_buc_c+0.5
      endif
      select 1
      do case
         case resultado=0
           resul=1
         case resultado=1
           resul=0
         case resultado=2
           resul=2
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
      seek a->jug_num2
      replace &rival with a->jug_num1,&result with resul,;
              tot_ptos with tot_ptos+c->ptos_negro
      if resul < 6
         replace &color with 'N',tot_buc_c with tot_buc_c+c->ptos_negro
      else
         replace tot_buc_c with tot_buc_c+0.5
      endif
   endif
   select 1
   skip
enddo
close databases