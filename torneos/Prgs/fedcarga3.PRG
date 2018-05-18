CLOSE DATABASES
ERASE salida.txt
fichero = FCREATE("salida.txt")
IF fichero = -1
   WAIT "Error creando fichero" timeout(10)
endif
FPUTS(fichero,"No;NombreCompleto;Titulo;ID;Elonac;FIDE;FNac;Fed;Sex;FIDE Id;Mesa;NoEq")
USE jugadore
i = 1
DO WHILE NOT EOF()
   campo = LTRIM(STR(i))+";"+LTRIM(nombre)+";"+LTRIM(categoria)+";"+LTRIM(STR(licencia_n))+";"+;
      LTRIM(STR(elo_naci))+";"+LTRIM(STR(elo_fide))+";"+LTRIM(STR(fecha_naci))+";"+federacion+";"+;
      Sexo+";"+LTRIM(STR(licencia))+";"+ltrim(STR(n_tablero))+";"+LTRIM(STR(n_equipo))
   FPUTS(fichero,campo)
   i = i + 1
   SKIP
ENDDO
FCLOSE(fichero)
CLOSE ALL




