select 0
use torneo
select 0
use control
select 0
use desempa
set order to tag("desempa")
goto top
do while .not. eof() .and. cod_desemp = 0
   skip
enddo
i = 1
do while .not. eof()
   if recno() = 1
      acumulativ = i
   endif
   newdes = "newdes" + ltrim(str(i))
   &newdes = campo_des
   i = i + 1
   skip
enddo
num_desem = i - 1
use
select 0
use cuadro
set order to tag("jugador")
select 0
use jugadore
set order to tag("clasific")
set relation to str(num_lista,3) into cuadro
goto top
do while .not. eof()
   primer = clasific
   guarda1 = num_lista
   des_total = 0
   multi = 10 ** (3 * num_desem)
   i = 1
   do while i <= num_desem and i <= acumulativ
      campo = "newdes" + ltrim(str(i))
      newdes = &campo
      des_total = des_total + multi * &newdes
      multi = multi / 1000
      i = i + 1
   enddo
   new_total = des_total
   tot_ptos_o = jugadore.tot_ptos
   do while not eof() and tot_ptos_o = tot_ptos and new_total = des_total
      guarda2 = num_lista
      ultimo = clasific
      skip
      des_total = 0
      multi = 10 ** (3 * num_desem)
      i = 1
      do while i <= num_desem and i <= acumulativ
         campo = "newdes" + ltrim(str(i))
         newdes = &campo
         des_total = des_total + multi * &newdes
         multi = multi / 1000
         i = i + 1
      enddo
   enddo
   if guarda1 <> guarda2
      dimension tabla(ultimo - primer + 1,torneo.num_rondas)
      m.num_lista = torneo.num_rondas
      seek primer
      for i = 1 to ultimo - primer + 1
         tabla(i,m.num_lista) = jugadore.num_lista
         select cuadro
         do while not eof() and cuadro.jug_num1 = jugadore.num_lista and;
            cuadro.n_ronda <> torneo.num_rondas
            tabla(i,cuadro.n_ronda) = iif(cuadro.resultado = 2,;
               "2",iif(cuadro.resultado = 6 or cuadro.resultado = 8 or;
               cuadro.resultado = 0,"0","4"))
            skip
         enddo
         select jugadore
         skip
      endfor
      for i = 1 to ultimo - primer + 1
         if type("tabla(i,1)") = "L"
            tabla(i,1) = space(1)
         endif   
         for j = 2 to torneo.num_rondas - 1
            if type("tabla(i,j)") = "L"
               tabla(i,j) = space(1)
            endif
            tabla(i,1) = tabla(i,1) + tabla(i,j)
         endfor
      endfor
      =asort(tabla,1)
      select jugadore
      set order to ("num_lista")
      for i = 1 to ultimo - primer + 1
         seek tabla(i,m.num_lista)
         replace clasific with primer + i -1
      endfor
      set order to ("clasific")
   endif
   seek ultimo + 1
enddo
close databases
erase work1.dbf
erase work2.dbf