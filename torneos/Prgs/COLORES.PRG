EXTERNAL ARRAY s1,s2
color1 = s1(i,m.hist_color)
do while len(color1) > 0 and at(" ",color1) <> 0
   color1=stuff(color1,at(" ",color1),1,"")
enddo
color2 = s2(i,m.hist_color)
do while len(color2) > 0 and at(" ",color2) <> 0
   color2=stuff(color2,at(" ",color2),1,"")
enddo
do while len(color1) > 0 .and. len(color2) > 0 .and.;
   substr(color1,len(color1)) = substr(color2,len(color2))
   color1 = substr(color1,1,len(color1) - 1)
   color2 = substr(color2,1,len(color2) - 1)
enddo
do case
   case len(color1) = 0 .and. len(color2) = 0
      if s1(i,m.pide_color) = "B" or;
        (s2(i,m.pide_color) = " " and s1(i,m.pide_color) <> "N")
         replace jug_num1 with s1(i,m.num_lista),jug_num2 with s2(i,m.num_lista)
      else
         replace jug_num1 with s2(i,m.num_lista),jug_num2 with s1(i,m.num_lista)
      endif
   case len(color1) <> 0
      if substr(color1,len(color1)) = "N"
         replace jug_num1 with s1(i,m.num_lista),jug_num2 with s2(i,m.num_lista)
      else
         replace jug_num1 with s2(i,m.num_lista),jug_num2 with s1(i,m.num_lista)
      endif
   otherwise
      if substr(color2,len(color2)) = "B"
         replace jug_num1 with s1(i,m.num_lista),jug_num2 with s2(i,m.num_lista)
      else
         replace jug_num1 with s2(i,m.num_lista),jug_num2 with s1(i,m.num_lista)
      endif
endcase
