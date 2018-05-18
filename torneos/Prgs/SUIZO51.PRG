set deleted off
select 0
use altaelo
set order to tag("altaelo")
select 0
use resultad
set order to tag("resultado")
select 0
use federaci
set order to tag("federacion")
select 0
use federaci again alias federac2
set order to tag("federacion")
select 0
use jugadore alias segundo
set order to tag("num_lista")
set relation to federacion into federac2
select 0
use cuadro
set order to tag("jugador")
set relation to jug_num2 into segundo
set relation to resultado into resultad additive
select 0
use jugadore again
set order to tag("num_lista")
set relation to federacion into federaci
set relation to str(num_lista,3) into cuadro additive
jugador = 999
cabe = "XXI Open Internacional d'Escacs d'Andorra"
txuri = 0
ult_txuri = 0
do while txuri < 30 .and. ult_txuri < len(cabe)
   ult_txuri = txuri
   txuri = txuri + at(" ",substr(cabe,ult_txuri+1))
enddo
do while jugador <> 0
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
   select cuadro
   do while not eof() and jugadore.num_lista = cuadro.jug_num1
      if cuadro.jug_num2 <> 0
         if segundo.elo_fide > 1800 .and. cuadro.resultado < 3
            num_elados = num_elados + 1
         endif
      endif
      skip
   enddo
   select jugadore
   goto recno()
   set printer to &impre
   set print on
   set console off
   ?
   ?
   ?
   ?
   ?
   ?
   ?
   ?
   ?
   ?
   ?
   ? space(15),"22è Open Internacional d'Andorra"
   ?
   ?
   ? "   El abajo firmante, D. Juanjo Escribano Lasa, Arbitro Internacional"
   ? "de la FIDE, como arbitro principal del",substr(cabe,1,ult_txuri)
   ? substr(cabe,ult_txuri+1)
   ?
   ?
   ? space(7),"CERTIFICA",chr(10)+chr(10)
   ? "   que D.",ltrim(nombre)+"("+federaci.pais+")","nacido el",;
     jugadore.fecha_naci
   ? "ha realizado un Torneo valido para la entrada al ELO Internacional de"
   ? str(num_elados,2),;
     "partidas, conforme a los resultados que se adjuntan:"
   ?
   ? "  Codigo   Num    J U G A D O R                 Pais  T Rating Res Res"
   ?
   ? iif(licencia = 0," " + dtoc(fecha_naci),str(licencia,9)),str(num_lista,4),;
     nombre,federaci.pais
   ?
   suma_elo = 0
   suma_res = 0
   select cuadro
   do while not eof() and jugadore.num_lista = cuadro.jug_num1
      if cuadro.jug_num2 <> 0
         if segundo.elo_fide > 1800
            ? str(segundo.licencia,9),str(segundo.num_lista,4),;
              segundo.nombre,federac2.pais," ",segundo.categoria,;
              str(segundo.elo_fide,6),resultad.texto_cast,;
              resultad.texto_cast
            if cuadro.resultado < 3
               suma_elo = suma_elo + segundo.elo_fide
               suma_res = suma_res + resultad.ptos_blan
            endif
         else
            ? space(9),str(segundo.num_lista,4),segundo.nombre,federac2.pais,;
              space(10),resultad.texto_cast
         endif
      else
         ?
      endif
      skip
   enddo
   select jugadore
   media = int((suma_elo/num_elados)+ 0.5)
   porcen = int(100 * suma_res / num_elados)
   do case
      case porcen = 0
         elo_torneo = 0
      case porcen < 50
         select altaelo
         seek porcen
         elo_torneo = media - altaelo.diferencia
         select jugadore   
      otherwise
         elo_torneo = media + 25 * (suma_res - 0.5 * num_elados)   
   endcase
   ?
   ? space(14),"Suman ...................",space(4),str(suma_elo,9),;
     str(num_elados,2),str(suma_res,4,1)
   ?
   ?
   ? "   La media de sus adversarios ha sido",str(media,4),;
     "y el porcentaje obtenido"
   ? "es del",str(porcen,3)+"%,",;
     "con lo que resulta un Torneo de",str(num_elados,2),;
     "partidas con un ELO de"
   ? str(elo_torneo,5),"puntos."
   i = 1
   do while i <= 9
      ?
      i = i + 1
   enddo
   ? space(5),arbitro
   ? space(5),"(Arbitro Principal)"
   ? space(2),"Andorra la Vella a",dtoc(date())
   set print off
   set console on
   set printer to lpt1
enddo
close databases
set deleted on