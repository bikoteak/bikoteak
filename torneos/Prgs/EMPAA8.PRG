valx_usado = 0
if min(pide_blan,pide_negra) + pide_nulo >= max(pide_blan,pide_negra)
   valor_x = 0
   return
endif
valor_q = int((num_jug_gr + 1)/2)
if pide_negra > pide_blan
   valor_x = pide_negra - valor_q
else
   valor_x = pide_blan - valor_q
endif
