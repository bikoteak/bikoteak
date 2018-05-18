set deleted off
select 0
use control
dimension paises(control.num_rondas + 1)
paises = ""
select 0
use resultad
set order to tag("resultado")
select 0
use jugadore alias segundo
set order to tag("num_lista")
select 0
use cuadro
set order to tag("jugador")
set relation to jug_num2 into segundo
set relation to resultado into resultad additive
select 0
use jugadore again
set order to tag("num_lista")
set relation to str(num_lista,3) into cuadro
jugador = 999
cabe = ltrim(texto)+" "
txuri = 0
ult_txuri = 0
do while txuri < 30 .and. ult_txuri < len(cabe)
   ult_txuri = txuri
   txuri = txuri + at(" ",substr(cabe,ult_txuri+1))
enddo
do while jugador <> 0
   select jugadore
   clear
   @ 10,10 say "Introducir numero de jugador" get jugador picture "###"
   read
   if jugador = 0
      exit
   endif
   seek jugador
   if eof()
      loop
   endif
   impre = "ltres" + ltrim(str(jugador)) + ".prn"
   num_elados = 0
   sum_elo = 0
   if elo_fide > 1800
      num_elados = 1
      sum_elo = elo_fide
   else
      sum_elo = 1800
   endif
   num_maes = 0
   num_gran = 0
   num_titul = 0
   if jugadore.elo_fide >= 2300 or;
      jugadore.categoria = "f" or jugadore.categoriaw = "f" or;
      jugadore.categoria = "m" or jugadore.categoriaw = "m" or;
      jugadore.categoria = "g" or jugadore.categoriaw = "g"
      num_titul = 1
   endif
   num_partid = 0
   select cuadro
   i = 1
   do while not eof() and cuadro.jug_num1 = jugadore.num_lista
      paises(i) = space(3)
      if cuadro.jug_num2 <> 0
         if cuadro.resultado < 3
            paises(i) = segundo.federacion
            num_partid = num_partid + 1
            if segundo.elo_fide >= 2300 or;
               segundo.categoria = "f" or segundo.categoriaw = "f" or;
               segundo.categoria = "m" or segundo.categoriaw = "m" or;
               segundo.categoria = "g" or segundo.categoriaw = "g"
               num_titul = num_titul + 1
            endif
            do case
               case segundo.categoria = "m"
                  num_maes = num_maes + 1
               case segundo.categoria = "g"
                  num_gran = num_gran + 1
            endcase
            if segundo.elo_fide > 1800
               num_elados = num_elados + 1
               sum_elo = sum_elo + segundo.elo_fide
            else
               sum_elo = sum_elo + 1800   
            endif
         endif
      endif
      skip
      i = i + 1
   enddo
   select jugadore
   goto recno()
   paises(i) = jugadore.federacion
   set printer to &impre
   set print on
   set console off
   if asort(paises) <> 1
      @ 10,10 say "Error en ordenacion tabla paises"
      wait
      quit
   endif
   dimension paises(control.num_rondas + 2)
   paises(control.num_rondas+2) = " "
   primer_pais = 0
   for i = 1 to control.num_rondas
      if paises(i) = space(1)
         primer_pais = i
      endif
   endfor
   primer_pais = primer_pais + 1
   pais_max = 0
   pais_dis = 0
   i = primer_pais
   do while i <= control.num_rondas + 1
      pais_dis = pais_dis + 1
      cont_pais = 0
      pais_old = paises(i)
      do while pais_old = paises(i) and i <= control.num_rondas + 1
         cont_pais = cont_pais + 1
         i = i + 1
      enddo
      pais_max = max(pais_max,cont_pais)
   enddo
   no_fed = control.num_rondas + 2 - pais_max - primer_pais
   ?
   ?
   ?
   ?
   ?
   ?
   ?
   ?
   ?
   ? space(10),trim(ltrim(texto))
   ?
   ?
   ?
   ? "   El abajo firmante, D. Juan José Escribano Lasa,"
   ? "Arbitro Internacional de la FIDE, como arbitro principal del"
   ? substr(cabe,1,ult_txuri),substr(cabe,ult_txuri+1)
   ?
   ? space(7),"CERTIFICA"
   ?
   ? "   que D.",ltrim(nombre)+"("+jugadore.federacion+")",;
     "ha realizado un Torneo valido para la"
   ? "norma de maestro internacional de",str(num_partid,2),;
     "partidas, conforme a los resultados que"
   ? "se adjuntan:"+chr(10)
   ? "  Codigo    Num","   J U G A D O R         Pais ","T  Rat. Res"
   ? str(licencia,9),str(num_lista,4),nombre,jugadore.federacion," ",;
     iif(sexo <> "w",categoria,categoriaw),str(elo_fide,5)
   ?
   suma_res = 0
   select cuadro
   do while not eof() and jugadore.num_lista = cuadro.jug_num1
      if cuadro.jug_num2 <> 0
         if cuadro.resultado < 3
            suma_res = suma_res + resultad.ptos_blan
         endif
         ? iif(segundo.licencia <> 0,str(segundo.licencia,9),space(9)),;
           str(segundo.num_lista,4),segundo.nombre,segundo.federacion," ",;
           iif(segundo.sexo <> "w",segundo.categoria,segundo.categoriaw),;
           iif(segundo.elo_fide > 1800,str(segundo.elo_fide,5),space(5)),;
           resultad.texto_cast
      else
         ?
      endif
      skip
   enddo
   ?
   ? space(14),"Suman ...................",space(4),str(sum_elo,8),;
     "Puntos ELO"
   ? "con",str(suma_res,4,1),"Puntos"
   ?
   ? "   El Torneo ha sido de Categoria","_____","lo que obliga a los"
   ? "siguientes requisitos:"
   ?
   ? "   Puntos                   ","___"+". Han sido",str(suma_res,4,1)+"."
   ? "   Nacionalidades             3 . Han sido",str(pais_dis,4)+"."
   ? "   No de la misma Federacion"," 4 "+". Han sido",str(no_fed,4)+"."
   ? "   Jugadores con Elo        "," 8 "+". Han sido",str(num_elados,4)+"."
   ? "   Titulados o mas de 2.300 "," 5 "+". Han sido",str(num_titul,4)+"."
   ? "   (Grandes/) Maestros Int. "," 3 "+". Han sido",str(num_maes+num_gran,4)+;
     "."
   ? "   o Grandes Maestros       "," 2 "+". Han sido",str(num_gran,4)+"."
   i = 1
   do while i <= 7
      ?
      i = i + 1
   enddo
   ? space(5),arbitro
   ? space(5),"(Arbitro principal)"
   ? space(2),ltrim(vloca),"a",dtoc(date())
   set print off
   set console on
   set printer to lpt1
enddo

close databases
set deleted off