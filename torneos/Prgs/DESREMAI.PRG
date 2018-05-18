EXTERNAL ARRAY pendient
if not sw_historia
   return
endif
i = alen(historia,1)
comienzo   = historia(i,m.comienz_ol)
num_jug_gr = historia(i,m.num_jug_ol)
valor_p    = historia(i,m.valor_p_ol)
val_p_g    = historia(i,m.val_p_g_ol)
valor_x    = historia(i,m.valor_x_ol)
transposi  = historia(i,m.transpo_ol)
homogeneo  = historia(i,m.homogen_ol)
remainder  = historia(i,m.remaind_ol)
num_transp = historia(i,m.num_tra_ol)
top_transp = historia(i,m.top_tra_ol)
num_trans2 = historia(i,m.num_tr2_ol)
top_trans2 = historia(i,m.top_tr2_ol)
upfloat    = historia(i,m.upfloat_ol)
downfloat  = historia(i,m.downflo_ol)
intento    = historia(i,m.intento_ol)
if i > 1
   dimension historia(i-1,num_histor)
else
   sw_historia = .f.
   dimension historia(1,num_histor)
endif
dimension v_trans(num_jug_gr,num_campos)
for m = comienzo to comienzo + num_jug_gr - 1
   for m3 = 1 to num_campos
      v_trans(m + 1 - comienzo,m3) = pendient(m,m3)
   endfor
endfor
do empac04