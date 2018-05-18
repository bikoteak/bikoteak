procedure lin_html
parameter Archivo

select torneo

NombreHtml = Archivo + '.html'
Html = fcreate(NombreHtml)
do WriteCabecera with Html

select 0
use &Archivo alias Lista
do while not eof()

	do Writejuga with Html, lista.num_lista, ;
		lista.licencia, ;
		lista.nombre, lista.categoria, ;
		lista.federacion, lista.elo_fide, lista.fecha_naci

	skip
enddo

do WriteCola with Html
= fclose(Html)
close databases

return


procedure WriteCabecera
parameter Html
= fputs(Html,'<html>')
= fputs(Html,'<head><title>' + trim(torneo.localidad) + str(year(date()),5) + '</title></head>')
= fputs(Html,'<body>')
= fputs(Html,'<center><h1>' + trim(torneo.Nom_torneo) + '</h1></center>')
= fwrite(Html,'<center><h2>Listado de inscritos ')
= fwrite(html,space(5)+sub_torn.nombre)
= fputs(Html,'</h2></center>')
= fputs(Html,'<br>')
= fputs(Html,'<center><table cellpadding="6">')
= fwrite(Html,'<tr>')
= fwrite(Html,'<th>N.Lista</th>')
= fwrite(Html,'<th>Nombre</th>')
= fwrite(Html,'<th>Titulo</th>')
= fwrite(Html,'<th>Pais</th>')
= fwrite(Html,'<th>Elo</th>')
= fwrite(Html,'<th>A.N.</th>')
= fputs(Html,'</tr>')
return

procedure WriteCola
parameter Html
= fputs(Html,'</table></center>')
= fputs(Html,'</body>')
= fputs(Html,'</html>')
return

procedure Writejuga
parameter Html, Numli, Numj, Nombre, Tit, pais, elo, anonaci
= fputs(Html,'<tr>')
= fwrite(Html,'  <td align="right"><strong>')
= fwrite(Html,transform(numli,'999'))
= fwrite(Html,'</strong></td><td>')
= fwrite(Html,Nombre)
= fwrite(Html,'</td><td>')
= fwrite(Html,tit)
= fwrite(Html,'</td><td>')
= fwrite(Html,pais)
= fwrite(Html,'</td><td align="right"><strong>')
= fwrite(Html,transform(elo,'9999'))
= fwrite(Html,'</strong></td><td align="right">')
= fwrite(Html,transform(anonaci,'9999'))
= fputs(Html,'</td>')
= fputs(Html,'</tr>')
return