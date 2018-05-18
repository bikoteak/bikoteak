EXTERNAL ARRAY s1,s2
do case
   case s1(i,m.pide_color) = s2(i,m.pide_color) and;
        s1(i,pide_colov) = s2(i,m.pide_colov) and;
        s1(i,pide_colov) = 2
      do colores     
   case s1(i,m.pide_color) = "B" and;
       (s2(i,m.pide_color) = "N" or s2(i,m.pide_color) = " ")
      replace jug_num1 with s1(i,m.num_lista),jug_num2 with s2(i,m.num_lista)
   case s1(i,m.pide_color) = "N" and;
       (s2(i,m.pide_color) = "B" or s2(i,m.pide_color) = " ")
      replace jug_num1 with s2(i,m.num_lista),jug_num2 with s1(i,m.num_lista)
   case s1(i,m.pide_colov) > 1
      if s1(i,m.pide_color) = "B"
         replace jug_num1 with s1(i,m.num_lista),jug_num2 with s2(i,m.num_lista)
      else
         replace jug_num1 with s2(i,m.num_lista),jug_num2 with s1(i,m.num_lista)
      endif
   case s2(i,m.pide_colov) > 1
      if s2(i,m.pide_color) = "N"
         replace jug_num1 with s1(i,m.num_lista),jug_num2 with s2(i,m.num_lista)
      else
         replace jug_num1 with s2(i,m.num_lista),jug_num2 with s1(i,m.num_lista)
      endif
   case right(s1(i,m.hist_color),2) = "BB"
      replace jug_num1 with s2(i,m.num_lista),jug_num2 with s1(i,m.num_lista)
   case right(s1(i,m.hist_color),2) = "NN"
      replace jug_num1 with s1(i,m.num_lista),jug_num2 with s2(i,m.num_lista)
   case right(s2(i,m.hist_color),2) = "BB"
      replace jug_num1 with s1(i,m.num_lista),jug_num2 with s2(i,m.num_lista)
   case right(s2(i,m.hist_color),2) = "NN"
      replace jug_num1 with s2(i,m.num_lista),jug_num2 with s1(i,m.num_lista)
   case s1(i,m.pide_colov) <> s2(i,m.pide_colov)
      if s1(i,m.pide_colov) > s2(i,m.pide_colov)
         if s1(i,m.pide_color) ="B"
            replace jug_num1 with s1(i,m.num_lista),jug_num2 with s2(i,m.num_lista)
         else
            replace jug_num1 with s2(i,m.num_lista),jug_num2 with s1(i,m.num_lista)
         endif
      else
         if s2(i,m.pide_color) ="N"
            replace jug_num1 with s1(i,m.num_lista),jug_num2 with s2(i,m.num_lista)
         else
            replace jug_num1 with s2(i,m.num_lista),jug_num2 with s1(i,m.num_lista)
         endif
      endif
   otherwise
      do colores
endcase