set talk off
select 0
use control
select 0
use c:\suizo\jul99frl alias rtng1
set order to tag("id_number")
select 0
use jugadore
zap
select 0
use c:\oropesa\inscrip2
set relation to licencia into rtng1
do while not eof()
   if control.sub_torneo = torneo
      select rtng1
      scatter memvar
      select jugadore
      append blank
      if not eof("rtng1")
         replace licencia with m.id_number,nombre with m.name,;
            elo_fide with m.ro,federacion with m.country,;
            categoria with m.title,sexo with m.sex,fecha_naci with m.birthday
      else
         replace licencia with 0,nombre with inscrip2.nombre,;
            elo_fide with 0,federacion with inscrip2.federacion,;
            categoria with inscrip2.titulo,sexo with inscrip2.sexo,;
            fecha_naci with inscrip2.fecha_naci
      endif
      select inscrip2
   endif
   skip
enddo
close databases