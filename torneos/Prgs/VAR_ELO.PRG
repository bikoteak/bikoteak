******* Crear archivos de altas y variacion de Elo

VarFIDE = fcreate('varfide.txt')
do VarCabecera with VarFIDE, 'FIDE'

VarFEDA = fcreate('varfeda.txt')
do VarCabecera with VarFEDA, 'FEDA'

VarFCE = fcreate('varfce.txt')
do VarCabecera with VarFCE, 'FCE'

AltaFIDE = fcreate('altafide.txt')
do AltaCabecera with AltaFIDE, 'FIDE'

AltaFEDA = fcreate('altafeda.txt')
do AltaCabecera with AltaFEDA, 'FEDA'

AltaFCE = fcreate('altafce.txt')
do AltaCabecera with AltaFCE, 'FCE'

******* Obtener datos de encuentros

select jug1.num_lista as J1, jug1.nombre as Nombre1, ;
	jug1.elo_fide as FIDE1, jug1.elo_naci as FEDA1, ;
	jug1.elo_prov as FCE1, jug2.elo_fide as FIDE2, ;
	jug2.elo_naci as FEDA2, jug2.elo_prov as FCE2, ;
	cuadro.resultado as Result ;
	from jugadore jug1, cuadro, jugadore jug2 ;
	into cursor tablero ;
	where jug1.num_lista = cuadro.jug_num1 and ;
	cuadro.jug_num2 = jug2.num_lista ;
	order by jug1.num_lista

******** Recorrer encuentros para calculos

do while not eof('tablero')

	****** Obtener datos del jugador
	
	Jug1 = tablero.J1
	Nombrej1 = tablero.Nombre1
	FIDEj1 = tablero.FIDE1
	FEDAj1 = EloFEDA(tablero.FIDE1,tablero.FEDA1)
	FCEj1 = EloFCE(tablero.FIDE1,tablero.FEDA1,tablero.FCE1)

	****** Recorrer oponentes del jugador para calculos
	****** de Elo
		
	FIDEn = 0
	FIDEw = 0
	FIDEt = 0
	FEDAn = 0
	FEDAw = 0
	FEDAt = 0
	FCEn = 0
	FCEw = 0
	FCEt = 0

	do while tablero.J1 = Jug1
	
		****** Obtener Elos oponente
		
		FIDEj2 = tablero.FIDE2
		FEDAj2 = EloFEDA(tablero.FIDE2,tablero.FEDA2)
		FCEj2 = EloFCE(tablero.FIDE2,tablero.FEDA2,tablero.FCE2)
		
		****** Calculos FIDE
	
		if FIDEj2 > 0 and tablero.Result < 3
			FIDEn = FIDEn + 1
			FIDEt = FIDEt + EloAjustado(FIDEj1,FIDEj2)
			if tablero.Result = 1
				FIDEw = FIDEw + 1
			else 
				if tablero.Result = 2
					FIDEw = FIDEw + 0.5
				endif
			endif
		endif
	
		****** Calculos FEDA
		
		if FEDAj2 > 0 and tablero.Result < 3
			FEDAn = FEDAn + 1
			FEDAt = FEDAt + EloAjustado(FEDAj1,FEDAj2)
			if tablero.Result = 1
				FEDAw = FEDAw + 1
			else 
				if tablero.Result = 2
					FEDAw = FEDAw + 0.5
				endif
			endif
		endif
	
		****** Calculos FCE
		
		if FCEj2 > 0 and (tablero.Result < 3 or tablero.Result = 7)
			FCEn = FCEn + 1
			if tablero.Result = 7
				FCEt = FCEt + FCEj1
				FCEw = FCEw + 1
			else
				FCEt = FCEt + EloAjustado(FCEj1,FCEj2)
				if tablero.Result = 1
					FCEw = FCEw + 1
				else 
					if tablero.Result = 2
						FCEw = FCEw + 0.5
					endif
				endif
			endif
		endif
			
		skip in 'tablero'
	enddo

	****** Escribir a archivos las altas y variaciones de Elo
		
	if FIDEn > 0
		FIDEm = FIDEt / FIDEn
		if FIDEj1 > 0
			FIDEp = Porcentaje(FIDEj1,FIDEm)
			FIDEwe = FIDEn * FIDEp
			do WriteVar with VarFIDE,Jug1,Nombrej1,FIDEj1, ;
					FIDEn,FIDEm,FIDEw,FIDEwe
		else
			if FIDEw >= FIDEn/2
				FIDEu = FIDEm + 25*(FIDEw-FIDEn/2)
			else
				FIDEu = FIDEm - Diferencia(FIDEw/FIDEn)
			endif
			do WriteAlta with AltaFIDE,Jug1,Nombrej1,FIDEn, ;
					FIDEm, FIDEw, FIDEu
		endif
	endif
		
	if FEDAn > 0
		FEDAm = FEDAt / FEDAn
		if FEDAj1 > 0
			FEDAp = Porcentaje(FEDAj1,FEDAm)
			FEDAwe = FEDAn * FEDAp
			do WriteVar with VarFEDA,Jug1,Nombrej1,FEDAj1, ;
					FEDAn,FEDAm,FEDAw,FEDAwe
		else
			if FEDAw >= FEDAn/2
				FEDAu = FEDAm + 25*(FEDAw-FEDAn/2)
			else
				FEDAu = FEDAm - Diferencia(FEDAw/FEDAn)
			endif
			do WriteAlta with AltaFEDA,Jug1,Nombrej1,FEDAn, ;
					FEDAm, FEDAw, FEDAu
		endif
	endif
	
	if FCEn > 0
		FCEm = FCEt / FCEn
		if FCEj1 > 0
			FCEp = Porcentaje(FCEj1,FCEm)
			FCEwe = FCEn * FCEp
			do WriteVar with VarFCE,Jug1,Nombrej1,FCEj1, ;
					FCEn,FCEm,FCEw,FCEwe
		else
			if FCEw >= FCEn/2
				FCEu = FCEm + 25*(FCEw-FCEn/2)
			else
				FCEu = FCEm - Diferencia(FCEw/FCEn)
			endif
			do WriteAlta with AltaFCE,Jug1,Nombrej1,FCEn, ;
					FCEm, FCEw, FCEu
		endif
	endif

enddo

= fclose(VarFIDE)
= fclose(VarFEDA)
= fclose(VarFCE)

do AltaNota with AltaFIDE
= fclose(AltaFIDE)

do AltaNota with AltaFEDA
= fclose(AltaFEDA)

do AltaNota with AltaFCE
= fclose(AltaFCE)

close data


********* Funciones auxiliares

procedure AltaNota
parameter AltaElo
= fputs(AltaElo,'')
= fputs(AltaElo,'')
= fputs(AltaElo,'')
= fputs(AltaElo,'NOTA: Los resultados para obtencion de Elo sólo serán válidos con un')
= fputs(AltaElo,'      mínimo de cuatro partidas al final del torneo.')
return

procedure AltaCabecera
parameter AltaElo, TextoElo
= fputs(AltaElo,'')
= fputs(AltaElo,'')
= fputs(AltaElo,"              XXI Open Internacional d'Escacs d'Andorra")
= fputs(AltaElo,'')
= fputs(AltaElo,'')
= fwrite(AltaElo,'***  Resultados para obtención de Elo ')
= fwrite(AltaElo,TextoElo)
= fputs(AltaElo,'  ***')
= fputs(AltaElo,'')
= fputs(AltaElo,' N  Jugador                         N Elom  W   Elo')
= fputs(AltaElo,'------------------------------------------------------')
return


procedure WriteAlta
parameter AltaElo, Jug, Nombre, Elon, Elom, Elow, Elou
= fwrite(AltaElo,transform(Jug,'999 '))
= fwrite(AltaElo,Nombre)
= fwrite(AltaElo,transform(Elon,'9 '))
= fwrite(AltaElo,transform(Elom,'9999 '))
= fwrite(AltaElo,transform(Elow,'9.9 '))
= fputs(AltaElo,transform(Elou,'9999.99'))
return

procedure VarCabecera
parameter VarElo, TextoElo
= fputs(VarElo,'')
= fputs(VarElo,'')
= fputs(VarElo,"              XXI Open Internacional d'Escacs d'Andorra")
= fputs(VarElo,'')
= fputs(VarElo,'')
= fwrite(VarElo,'***  Variaciones de Elo ')
= fwrite(VarElo,TextoElo)
= fputs(VarElo,'  ***')
= fputs(VarElo,'')
= fputs(VarElo,' N  Jugador                          Elo  N Elom  W   We    Var')
= fputs(VarElo,'----------------------------------------------------------------')
return

procedure WriteVar
parameter VarElo, Jug, Nombre, Elo, Elon, Elom, Elow, Elowe
= fwrite(VarElo,transform(Jug,'999 '))
= fwrite(VarElo,Nombre)
= fwrite(VarElo,transform(Elo,' 9999 '))
= fwrite(VarElo,transform(Elon,'9 '))
= fwrite(VarElo,transform(Elom,'9999 '))
= fwrite(VarElo,transform(Elow,'9.9 '))
= fwrite(VarElo,transform(Elowe,'9.99 '))
= fputs(VarElo,transform(Elow-Elowe,'99.99k'))
return

function Diferencia
parameter Pctje
select diferencia from altaelo into cursor dif ;
	where porcentaje = round(Pctje*100,0)
return dif.diferencia

function DifPorcentaje
parameter Dif
select porcentaje from varelo into cursor pdif ;
	where round(Dif,0) >= mindif and round(Dif,0) <= maxdif
return pdif.porcentaje

function Porcentaje
parameter Elo, Media
if not Elo > 0
	Ret = 0
else
	if Elo > Media
		Dif = Elo - Media
		Ret = DifPorcentaje(Dif)
	else
		Dif = Media - Elo
		Ret = 1 - DifPorcentaje(Dif)
	endif
endif
return Ret

function EloAjustado
parameter Elo1, Elo2
Elo = Elo2
if Elo1 > 0 and Elo1 - 350 > Elo2
		Elo = Elo1 - 350
else 
	if Elo1 > 0 and Elo1 + 350 < Elo2
			Elo = Elo1 + 350
	endif
endif
return Elo

function EloFEDA
parameter FIDE, FEDA
Elo = FEDA
if not FEDA > 0
	Elo = FIDE
endif
return Elo

function EloFCE
parameter FIDE, FEDA, FCE
Elo = FCE
if not FCE > 0
	Elo = EloFEDA(FIDE,FEDA)
endif
return Elo
