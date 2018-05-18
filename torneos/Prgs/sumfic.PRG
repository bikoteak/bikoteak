****************************************************************************************************
* Este programa pega los dos primeros ficheros que recibe por parametro en el tercero
****************************************************************************************************
PARAMETERS fic1, fic2, fic3
num1 = FOPEN(fic1)
IF num1 = -1
   WAIT "Error abriendo fichero " + fic1 timeout(10)
   CANCEL
endif
num2 = FOPEN(fic2)
? num2,fic2
IF num2 = -1
   WAIT "Error abriendo fichero " + fic2 timeout(10)
   CANCEL
ENDIF
num3 = FOPEN(fic3,1)
IF num3 = -1
   WAIT "Error abriendo fichero " + fic3 timeout(10)
   CANCEL
endif
DO WHILE NOT FEOF(num1)
   registro = Fgets(num1)
   grabado = FPUTS(num3,registro)
   IF grabado = 0
      CANCEL
   endif
ENDDO
DO WHILE NOT FEOF(num2)
   registro = Fgets(num2)
   grabado = FPUTS(num3,registro)
   IF grabado = 0
      WAIT "Error grabando fichero " + fic3 timeout(10)
      CANCEL
   endif
ENDDO
grabado = FCLOSE(num3)
CLOSE all
