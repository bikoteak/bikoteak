procedure cls_html
parameter Ronda, Archivo

NombreHtml = Archivo + '.html'
Html = fcreate(NombreHtml)
do WriteCabecera with Html, Ronda

select 0
use &Archivo alias Mesa
do while not eof()

	do WriteMesa with Html, Mesa.clasific, ;
		Mesa.nombre, Mesa.federacion, ;
		Mesa.categoria, Mesa.tot_ptos

	skip
enddo

do WriteCola with Html
= fclose(Html)
close databases

return


procedure WriteCabecera
parameter Html, Ronda
= fputs(Html,'<center><table cellpadding="2">')
= fputs(Html,'<tr><th>Cls.</th></tr>')
return

procedure WriteCola
parameter Html
= fputs(Html,'</table></center>')
return

procedure WriteMesa
parameter Html, Clas, Nombre, Federacion, ;
		Categoria, Puntos
= fputs(Html,'<tr>')
= fwrite(Html,'  <td align="right">')
= fwrite(Html,transform(Clas,'999'))
= fwrite(Html,'</td><td>')
= fwrite(Html,Nombre)
= fwrite(Html,'</td><td>')
= fwrite(Html,Federacion)
= fwrite(Html,'</td><td>')
= fwrite(Html,Categoria)
= fwrite(Html,'</td><td align="right">')
= fwrite(Html,transform(Puntos, '99.9'))
= fputs(Html,'</td>')
*for j=1 to i - 1
*   = fwrite(Html,'<td>')
*   = fwrite(Html,&tabla(j))
*   = fwrite(Html,'</td><td align="right">')
*   = fwrite(Html,transform(Puntos, '99.9'))
*   = fputs(Html,'</td>')
*endfor
= fputs(Html,'</tr>')
return