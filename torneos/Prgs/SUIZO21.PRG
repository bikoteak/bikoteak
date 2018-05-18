clear
@ 5,20 say "Introduccion de los datos de su impresora"
@ 08,12 say "Tama¤o de la hoja:" get top_page
@ row()+1,02 say "Numero de lineas de detalle:" get top_lin picture "###"
@ row()+1,06 say "Caracteres de subrayado:" get vis
@ row()+1,02 say "Caracteres de fin subrayado:" get vfs
@ row()+2,11 say "Pantalla Color/B&n:" get vcolor picture"!"
@ row()+2,13 say "Unidad de copias:" get helb picture"!"
read
save to suizo all
