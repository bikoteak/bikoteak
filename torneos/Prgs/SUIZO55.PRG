opcion = " "
clear
do while opcion <> "S" .and. opcion <> "N"
	@ 10,10 say "Generar FVA.dbf (S=Si,N=No):";
			get opcion picture "!"
	read
enddo
if opcion = "S"
* select 0
* use seleccio
* zap
* select 0
* use jugadore
* set order to tag ("num_jug")
* do while .not. eof() .and. (elo_prov = 0 .or. clasific = 0)
* 	skip
* enddo
* do while .not. eof()
*	select seleccio
*	append blank
*	replace num_jug with jugadore.num_jug
*	select jugadore
*	skip
*	do while .not. eof() .and. (elo_prov = 0 .or. clasific = 0)
*		skip
*	enddo
* enddo
* close databases
* do suizo55r
* else
* 	exit	
endif


