procedure res_html
parameter Ronda, Archivo

select 0
use torneo

NombreHtml = Archivo + '.html'
Html = fcreate(NombreHtml)
do WriteCabecera with Html, Ronda

select 0
use &Archivo alias Mesa
do while not eof()

	do WriteMesa with Html, Mesa.num_mesa, ;
		Mesa.jug_num1, Mesa.nombre_a, ;
		Mesa.federaci_a, ;
		Mesa.jug_num2, Mesa.nombre_b, ;
		Mesa.federaci_b, ;
		Mesa.texto

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
= fwrite(Html,'<center><h2>Resultados de la ronda ')
= fwrite(Html,transform(Ronda,'99'))
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
parameter Html, Mesa, Jug1, Nombre1, Fed1, ;
		Jug2, Nombre2, Fed2, Res
= fputs(Html,'<tr>')
= fwrite(Html,'  <td align="right"><strong>')
= fwrite(Html,transform(Mesa,'999'))
= fwrite(Html,'</strong></td><td align="right">')
= fwrite(Html,transform(Jug1,'999'))
= fwrite(Html,'</td><td>-</td><td align="right">')
= fwrite(Html,transform(Jug2,'999'))
= fwrite(Html,'</td><td>')
= fwrite(Html,Nombre1)
= fwrite(Html,'</td><td>')
= fwrite(Html,Fed1)
= fwrite(Html,'</td><td><center><strong>')
= fwrite(Html,Res)
= fwrite(Html,'</strong></center></td><td>')
= fwrite(Html,Fed2)
= fwrite(Html,'</td><td>')
= fwrite(Html,Nombre2)
= fputs(Html,'</td>')
= fputs(Html,'</tr>')
return