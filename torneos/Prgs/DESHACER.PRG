suspend
comienzo = comi_old
*for i = comienzo to comienzo + valor_p - 1
*   pendient(i,m.traspaso) = substr(pendient(i,m.traspaso),1,1) + "D"
*   pendient(i,m.bracket)  = pendient(i,m.bracket_in)
*endfor
m.select = select()
select rondas
delete all for num_empa = m.num_empa
pack
select (m.select)
m.num_empa = m.num_empa - 1
if grupo > 1
   grupo = grupo - 1
endif
comienzo = comi_old
homogeneo = .t.