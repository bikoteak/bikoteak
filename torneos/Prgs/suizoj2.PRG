public pide
i = 1
blancas = 0
negras = 0
colores = ""
ultimos = "  "
rivales = ""
select cuadro
do while jugadore.num_lista = cuadro.jug_num1 and not eof()
   colorido = iif (i = cuadro.n_ronda,iif(resultado=9," ",;
                  iif(cuadro.status,"B","N"))," ")
   colores = colores + colorido
   do case
      case colorido = "B"
         blancas = blancas + 1
         ultimos = substr(ultimos,2) + "B"
      case colorido = "N"
         negras = negras + 1
         ultimos = substr(ultimos,2) + "N"
   endcase
   rivales = rivales + iif(i = cuadro.n_ronda,str(cuadro.jug_num2,4),space(4))
   if i = cuadro.n_ronda
      skip
   endif
   i = i + 1
enddo
select jugadore
for j = i to control.ronda
   colores = colores + " "
   rivales = rivales + space(4)
endfor
limpio = trim(colores)
forzado = " "
pide = " "
do case
   case ultimos = "BB" .or. blancas > negras + 1
      pide = "N"
      forzado = "*"
   case ultimos = "NN" .or. negras > blancas + 1
      pide = "B"
      forzado = "*"
   case blancas > negras
      pide = "N"
   case blancas < negras
      pide = "B"
   case blancas = negras
      if blancas > 0
         if substr(limpio,len(limpio)) = "N"
            pide = "B"
         else
            pide = "N"
         endif
      endif
endcase
do case
   case pide = "B"
      despla = 0
   case pide = "N"
      despla = 5
   otherwise
      despla = 3
endcase
linea = jugadore.traspaso + space(1) + str(num_lista,3 + despla) + forzado +;
        dirigido + str(tot_ptos,9-despla,1) + space(1) +;
        substr(colores+space(control.ronda),1,control.ronda) +;
        space(1) + rivales
return(linea)