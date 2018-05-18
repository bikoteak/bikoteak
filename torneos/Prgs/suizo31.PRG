eti_hoja = 10
use rondas
copy to kk2
use
use kk2
do while mod(reccoun(),eti_hoja) <> 0
   append blank
   replace num_mesa with recno()
enddo
replace all num_eti with int((num_mesa-1)/(reccount()/eti_hoja)+1)+;
            mod(num_mesa-1,(reccount()/eti_hoja))*eti_hoja
sort on num_eti to kk
use kk alias rondas
label form ..\reports\hoja environment noconsole to print prompt
close databases
erase kk.dbf
erase kk2.dbf