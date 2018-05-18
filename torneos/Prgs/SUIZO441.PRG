select 3
use grupo
select 2
use work
sum 1 to num_jugad
do while num_jugad > 1
   bilatu = .t.
   rival1 = num_jug
   rival2 = int(num_jugad/2) + 1
   i = 1
   do while i < rival2
      skip
      do while deleted()
         skip
      enddo
      i = i + 1
   enddo
   i = 1
   do while i <= num_ronda
      rival = "rival_r" + ltrim(str(i))
      result = "result_r" + ltrim(str(i))
      if &campo = rival1 .and. &result < 6
         skip
         do while .not. eof() .and. deleted()
            skip
         enddo
         if .not. eof()
            i = 0
         else
            i = num_rinda
            bilatu = .f.
         endif
      endif
      i = i + 1
   enddo
   if bilatu
      rival2 = num_jug
      select grupo
      append blank
      replace num_jug1 with rival1,num_jug2 with rival2
      select work
      delete all for num_jug = rival1 .or. num_jug = rival2
      num_jugad = num_jugad - 2
      goto top
      do while .not. eof() .and. deleted()
         skip
      enddo
   else
      * deshacer anterior y probar
      list
      exit
   endif
enddo
if num_jugad = 1
   do suizo444
endif
