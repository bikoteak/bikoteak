*************************************************
* bucle basico del programa segun estado        *
*************************************************
estado = "c01"
fin_grupo = .f.
do while not fin_grupo
   estado_old = estado
*   ? "Estado =",estado,"grupo",grupo,"grupos",grupos,comienzo
   do case
      case estado = "c01"
         do empac01
      case estado = "c02"
         do empac02
      case estado = "c03"
         do empac03
      case estado = "c04"
         do empac04
      case estado = "c05"
         do empac05
      case estado = "c06"
 *        ? "down=",ltrim(str(downfloat)),"up=",ltrim(str(upfloat)),"P=",ltrim(str(valor_p)),;
 *          "P-G=",ltrim(str(val_p_g)),;
 *         "x=",ltrim(str(valor_x)),"com=",ltrim(str(comienzo)),;
 *        "s1(1,1)=",ltrim(str(s1(1,1))),"s2(1,1)=",ltrim(str(s2(1,1)))
 *        if type("s1(2,1)") <> "U"
 *           ?? " s1(2,1)=",ltrim(str(s1(2,1)))
 *        endif   
 *        if type("s2(2,1)") <> "U"
 *           ?? " s2(2,1)=",ltrim(str(s2(2,1)))
 *        endif   
 *        if type("s1(3,1)") <> "U"
 *           ?? " s1(3,1)=",ltrim(str(s1(3,1)))
 *        endif   
 *        if type("s2(3,1)") <> "U"
 *           ?? " s2(3,1)=",ltrim(str(s2(3,1)))
 *        endif   
         do empac06
      case estado = "c07"
         do empac07
      case estado = "c08"
         do empac08
      case estado = "c09"
         do empac09
      case estado = "c10"
         do empac10
      case estado = "c11"
         do empac11
      case estado = "c12"
         do empac12
      case estado = "c13"
         do empac13
      case estado = "c14"
         do empac14
   endcase
enddo