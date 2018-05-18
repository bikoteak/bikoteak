EXTERNAL ARRAY pendient,s1,s2
*if grupos = 10 and downfloat = 2 and valor_x = 1
*if comienzo = 13
*   set echo on
*   activate window debug
*   set step on
*else
*   set step off
*   deactivate window debug
*   set echo off
*endif
opcionc07 = "S"
*num_valx = valx_usado
num_valx = 0
m.num_empa = m.num_empa + 1
emp_valido = .t.
***********************************************************************
* control de bye
***********************************************************************
if grupo = grupos and mod(num_jug_gr,2) = 1 and;
   valor_p * 2 + 1 = num_jug_gr
   select bye
   seek s2(num_jug_gr - valor_p,m.num_lista)
   if not eof()
      emp_valido = .f.
      select cuadro
      opcionc07 = "P"
      estado = "c07"
      return
   endif
endif
select cuadro
***********************************************************************
* control de jugador flotante descendente por segunda vez
***********************************************************************
if downfloat < 2 and homogeneo and 2 * valor_p < num_jug_gr
   for jj = valor_p + 1 to num_jug_gr - valor_p
      do empab5 with "D" , jj
      if not emp_valido
         opcionc07 = "P"
         estado = "c07"
         return
      endif   
   endfor
endif
***********************************************************************
* control de que han jugado, o se ha prohibido el emparejamiento en ronda 0
***********************************************************************
for intento = 1 to valor_p
   seek str(s1(intento,m.num_lista),3) + str(s2(intento,m.num_lista),3)
   if not eof() and (resultado < 6 or n_ronda = 0)
      emp_valido = .f.
      exit
   endif
***********************************************************************
* control de jugador flotante ascendente por segunda vez
***********************************************************************
   if upfloat = 0 and not homogeneo
      if num_jug_gr > 2
         do empab5 with "A" , intento
      endif
      if not emp_valido
         exit
      endif   
   endif
***********************************************************************
* control de colores
***********************************************************************
   if s1(intento,m.pide_color) = s2(intento,m.pide_color) and;
      s1(intento,m.pide_color) <> " "
      if valor_x = num_valx
         emp_valido = .f.
         exit
      else
         if color_malo = 0
            if (pide_blan > pide_negra and s1(intento,m.pide_color) = "N") or;
               (pide_negra > pide_blan and s1(intento,m.pide_color) = "B")
               emp_valido = .f.
               exit
            endif
         else
            color_malo = color_malo - 1
         endif
      endif
   endif
   if empab2(s1(intento,m.num_lista),s2(intento,m.num_lista),;
      s1(intento,m.hist_color),s2(intento,m.hist_color),;
      s1(intento,m.pide_color),s2(intento,m.pide_color),;
      s1(intento,m.pide_colov),s2(intento,m.pide_colov))
   else
      emp_valido = .f.
      exit
   endif
   if s1(intento,m.pide_color) = s2(intento,m.pide_color)
      num_valx = num_valx + 1 
   endif
***********************************************************************
* control de color de los que no tienen color
***********************************************************************
   if s1(intento,m.pide_color) = " " and s2(intento,m.pide_color) = " "
      if max(pide_blan,pide_negra) > valor_p
         emp_valido = .f.
         estado = "c07"
         return
      endif
      if max(pide_blan,pide_negra) = valor_p and mod(num_jug_gr,2) = 0
         emp_valido = .f.
         estado = "c07"
         return
      endif
      s1(intento,m.pide_color) = "B"
      s2(intento,m.pide_color) = "N"
      pide_negra = pide_negra + 1
      pide_blan  = pide_blan  + 1
      pide_nulo  = pide_nulo  - 2
   endif
   if s1(intento,m.pide_color) = " " or s2(intento,m.pide_color) = " "
      if s1(intento,m.pide_color) = "B" or s2(intento,m.pide_color) = "B"
         if pide_negra >= num_jug_gr/2
            emp_valido = .f.
            estado = "c07"
            return
         else
            if s1(intento,m.pide_color) = "B"
               s2(intento,m.pide_color) = "N"
            else
               s1(intento,m.pide_color) = "N"
            endif   
            pide_negra = pide_negra + 1
            pide_nulo  = pide_nulo  - 1
         endif
      else
         if pide_blan >= num_jug_gr/2
            emp_valido = .f.
            estado = "c07"
            return
         else
            if s1(intento,m.pide_color) = "N"
               s2(intento,m.pide_color) = "B"
            else
               s1(intento,m.pide_color) = "B"
            endif   
            pide_blan = pide_blan + 1
            pide_nulo = pide_nulo - 1
         endif
      endif
   endif
   if not emp_valido
      exit
   endif
endfor
if emp_valido
   hora_fin = sys(2)
   if hora_fin >= hora_ini
      ? str(m.num_empa,2),str(val(hora_fin) - val(hora_ini),4),"segundos"
   else
      ? str(m.num_empa,2),str(val(hora_fin) + 86400 - val(hora_ini),4),"segundos"
   endif
   for i = 1 to valor_p
      for j = 1 to num_campos
         pendient(comienzo + i -1,j) = s1(i,j)
      endfor
   endfor
   for i = 1 to num_jug_gr - valor_p
      for j = 1 to num_campos
         pendient(comienzo + valor_p + i - 1,j) = s2(i,j)
      endfor
   endfor
   select rondas
   if reccount() > comienzo / 2
      goto (comienzo + 1)/2
      delete rest
      pack
   endif
   for i = 1 to valor_p
      append blank
      do color
      replace num_empa with m.num_empa
   endfor
   if grupo = grupos and num_jug_gr = valor_p * 2 + 1 
      append blank
      replace jug_num1 with s2(i,m.num_lista),jug_num2 with 0,;
              num_empa with m.num_empa
   endif
   select cuadro
   if sw_historia
      i = alen(historia,1) + 1
      dimension historia(i,num_histor)
   else
      i = 1
      sw_historia = .t.
   endif
   historia(i,m.comienz_ol) = comienzo
   historia(i,m.num_jug_ol) = num_jug_gr
   historia(i,m.valor_p_ol) = valor_p
   historia(i,m.val_p_g_ol) = val_p_g
   historia(i,m.valor_x_ol) = valor_x
   historia(i,m.transpo_ol) = transposi
   historia(i,m.homogen_ol) = homogeneo
   historia(i,m.remaind_ol) = remainder
   historia(i,m.num_tra_ol) = num_transp
   historia(i,m.top_tra_ol) = top_transp
   historia(i,m.num_tr2_ol) = num_trans2
   historia(i,m.top_tr2_ol) = top_trans2
   historia(i,m.upfloat_ol) = upfloat
   historia(i,m.downflo_ol) = downfloat
   historia(i,m.intento_ol) = intento - 1
   comienzo = comienzo + 2 * valor_p
   val_p_g = val_p_g - valor_p
   if homogeneo
      remainder = .f.
      if mod(num_jug_gr,2) = 1
         homogeneo = .f.
      endif
      fin_grupo = .t.
      estado = "c01"
   else
      if num_brackets < 3
         homogeneo = .t.
         remainder = .t.
      endif
      if num_jug_gr = 2
         remainder = .f.
         fin_grupo = .t.
         estado = "c01"
      else
         num_jug_gr = num_jug_gr - valor_p * 2
         do empar1
* se cambia a c03, dado que se debe guardar el valor_x ya usado
         estado = "c03"
         valor_x = valor_x - num_valx
*         estado = "c02"
      endif
   endif
else
   estado = "c07"   
endif