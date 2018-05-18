clear
use control
num_ron = ronda
use jugadore
sort to arbitro on tot_ptos/d,num_jug for .not. deleted()
use arbitro
con_pag = 0
con_lin = 99
set printer to fichas.prn
set print on
set console off
do while .not. eof()
   ptos_viejo = tot_ptos
   tot_blancas = 0
   tot_negras = 0
   tot_nulo = 0
   do while ptos_viejo = tot_ptos .and. .not. eof()
      if con_lin > top_lin
         con_lin = 0
         con_pag = con_pag + 1
         if con_pag > 1
            eject
         endif
         ? space(15),texto
         ?
         ? space(5),"Fichas de emparejamientos tras la",;
           ltrim(str(num_ron)),"Ronda"
         ?
      endif
      i = 1
      blancas = 0
      negras = 0
      colores = ""
      ultimos = "  "
      rivales = ""
      do while i <= num_ron
         color = "color_r" + ltrim(str(i))
         colores = colores + &color
         do case
            case &color = "B"
               blancas = blancas + 1
               ultimos = substr(ultimos,2) + "B"
            case &color = "N"
               negras = negras + 1
               ultimos = substr(ultimos,2) + "N"
         endcase
         rival = "rival_r" + ltrim(str(i))
         rivales = rivales + str(&rival,4)
         i = i + 1
      enddo
      limpio = trim(colores)
      forzado = " "
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
            if substr(limpio,len(limpio)) = "N"
               pide = "B"
            else
               pide = "N"
            endif
      endcase
      do case
         case pide = "B"
            despla = 0
            tot_blancas = tot_blancas + 1
         case pide = "N"
            despla = 5
            tot_negras = tot_negras + 1
         otherwise
            despla = 3
            tot_nulo = tot_nulo + 1
      endcase
      ? space(despla),str(num_jug,3)+forzado,space(5-despla),;
        str(tot_ptos,4,1),substr(colores+space(num_ron),1,num_ron),rivales
      con_lin = con_lin + 1
      skip
   enddo
   ?
   ? "Blancas",str(tot_blancas,3),"Negras",str(tot_negras,3)
   if tot_nulo <> 0
      ?? " Sin color",str(tot_nulo,3)
   endif
   ?
   con_lin = con_lin + 3
enddo
eject
close databases
erase arbitro.dbf
set print off
set console on
set printer to lpt1