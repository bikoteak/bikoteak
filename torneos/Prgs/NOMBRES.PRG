parameters nombre
m.nombre= upper(substr(nombre,1,1)) + lower(substr(nombre,2))
inicio = 2
do while at(" ",substr(trim(m.nombre),inicio)) +;
         at(".",substr(trim(m.nombre),inicio)) +;
         at("-",substr(trim(m.nombre),inicio)) <> 0
   do case
      case at(" ",substr(trim(m.nombre),inicio)) = 0
         xx = at("-",substr(trim(m.nombre),inicio))
      case at(".",substr(trim(m.nombre),inicio)) = 0
         xx = at(" ",substr(trim(m.nombre),inicio))
      case at("-",substr(trim(m.nombre),inicio)) = 0
         xx = at(" ",substr(trim(m.nombre),inicio))
      otherwise
         xx = min(at(" ",substr(trim(m.nombre),inicio)),;
            at(".",substr(trim(m.nombre),inicio)),;
            at("-",substr(trim(m.nombre),inicio)))
   endcase
   m.nombre= stuff(m.nombre,inicio + xx,1,;
             upper(substr(m.nombre,inicio + xx,1)))
   inicio = inicio + xx + 1
enddo
return(m.nombre)