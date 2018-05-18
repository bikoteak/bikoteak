*clear
*j = 0
*select 0
*use fva
*select 0
*use control
*select 0
*use resultad
*set order to tag("resultado")
*select 0
*use federaci
*set order to tag("federacion")
*select 0
*use jugadore alias segundo
*set order to tag("num_jug")
*select 0
*use cuadro
*set order to tag("jugador")
*set relation to jug_num2 into segundo
*set relation to resultado into resultad additive
*select 0
*use jugadore again
*set order to tag("num_jug")
*set relation to federacion into federaci additive
*select 0
*use seleccio
*set relation to num_jug into jugadore
*set relation to str(num_jug,3) + str(j,2) into cuadro additive
*i = 1
*do while i < 6
*	par_elo = "par_elo_" + str(i,1)
*	&par_elo = 0
*	sum_elo = "sum_elo_" + str(i,1)
*	&sum_elo = 0
*	pto_elo = "pto_elo_" + str(i,1)
*	&pto_elo = 0
*	par_nelo = "par_nelo_" + str(i,1)
*	&par_nelo = 0
*	pto_nelo = "pto_nelo_" + str(i,1)
*	&pto_nelo = 0
*	i = i + 1
*enddo
	 