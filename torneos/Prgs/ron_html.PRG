procedure ron_html
parameter Ronda, Archivo

SELECT 0
USE calendario
SET ORDER TO TAG("n_ronda")
SEEK ronda
select 0
use &Archivo alias Mesa
set relation to jug_num1 into jugadore
set relation to jug_num2 into segundo additive

set date to ansi
set console off
set century on
set alternate to &archivo + ".pgn"
set alternate on
do while not eof()
   IF RECNO() = 1
      ?? '[Event "' + trim(torneo.nom_torneo) + " " + trim(sub_torn.nombre) + '"]'
   else
      ? '[Event "' + trim(torneo.nom_torneo) + " " + trim(sub_torn.nombre) + '"]'
   endif
   ? '[Site "' + trim(torneo.localidad) + '"]'
   ? '[Date "' + DTOC(TTOD(calendario.fecha)) + '"]'
   ? '[Round "' + ltrim(str(ronda)) + "." + ltrim(str(mesa.num_mesa))  + '"]'
   ? '[White "' + trim(Mesa.nombre_a) + '."]'
   ? '[Black "' + trim(Mesa.nombre_b) + '."]'
   ? '[Result "*"]'
   ? '[ECO "A00"]'
   ? '[WhiteElo "' + ltrim(str(jugadore.elo_fide)) + '"]'
   ? '[BlackElo "' + ltrim(str(segundo.elo_fide)) + '"]'
   ? '[PlyCount "0"]'
   ?
   ? " *"
   ?
   skip
enddo
goto top
set alternate off
set alternate to
set century off
set date to ital
set console on

select mesa
goto top
NombreHtml = Archivo + '.html'
Html = fcreate(NombreHtml)
do WriteCabecera with Html, Ronda

do while not eof()

	do WriteMesa with Html, Mesa.num_mesa, ;
		Mesa.jug_num1, Mesa.nombre_a, ;
		Mesa.federaci_a, Mesa.tot_ptos_a, ;
		Jugadore.elo_fide, ;
		Mesa.jug_num2, Mesa.nombre_b, ;
		Mesa.federaci_b, Mesa.tot_ptos_b, ;
		Segundo.elo_fide
	skip
enddo

do WriteCola with Html
= fclose(Html)
close databases

return


procedure WriteCabecera
parameter Html, Ronda
= fputs(Html,'<html>')
= fputs(Html,'<head><title>' + trim(torneo.localidad) + str(year(date()),5) + '</title></head>')
= fputs(Html,'<body>')
= fputs(Html,'<center><h1>' + trim(torneo.Nom_torneo) + '</h1></center>')
= fwrite(Html,'<center><h2>Emparejamientos de la ronda ')
= fwrite(Html,transform(Ronda,'99'))
= fwrite(html,sub_torn.nombre)
= fputs(Html,'</h2></center>')
= fputs(Html,'<br>')
= fputs(Html,'<center><table cellpadding="2">')
= fputs(Html,'<tr><th>Mesa</th></tr>')
return

procedure WriteCola
parameter Html
= fputs(Html,'</table></center>')
= fputs(Html,'</body>')
= fputs(Html,'</html>')
return

procedure WriteMesa
parameter Html, Mesa, Jug1, Nombre1, Fed1, Ptos1, elo1, ;
		Jug2, Nombre2, Fed2, Ptos2, elo2
= fputs(Html,'<tr>')
= fwrite(Html,'  <td align="right"><strong>')
= fwrite(Html,transform(Mesa,'999'))
= fwrite(Html,'</strong></td><td>')
= fwrite(Html,Nombre1)
= fwrite(Html,'(')
= fwrite(Html,transform(Ptos1,'99.9'))
= fwrite(Html,')</td><td>')
= fwrite(Html,Fed1)
= fwrite(Html,'</td><td align="right">')
= fwrite(Html,transform(elo1,'9999'))
= fwrite(Html,'</td><td align="right"><strong>')
= fwrite(Html,transform(Jug1,'999'))
= fwrite(Html,'</strong></td><td>-</td><td align="right"><strong>')
= fwrite(Html,transform(Jug2,'999'))
= fwrite(Html,'</strong></td><td>')
= fwrite(Html,Fed2)
= fwrite(Html,'</td><td align="right">')
= fwrite(Html,transform(elo2,'9999'))
= fwrite(Html,'</td><td>')
= fwrite(Html,Nombre2)
= fwrite(Html,'(')
= fwrite(Html,transform(Ptos2,'99.9'))
= fputs(Html,')</td>')
= fputs(Html,'</tr>')
return