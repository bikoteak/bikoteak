select 0
use jugadore
set order to tag("num_lista")
copy to kk
select 0
use kk
replace all categoria with '4' for categoria = "1"
replace all categoria with '5' for categoria = "2"
replace all categoria with '6' for categoria = "3"
replace all categoria with '7' for categoria = " "
replace all categoria with '0' for categoria = "g"
replace all categoria with '1' for categoria = "m"
replace all categoria with '2' for categoria = "f"
replace all categoria with '3' for categoria = "P"
sort on elo_fide/d,elo_naci/d,elo_prov/d,categoria,nombre to wjuga
use wjuga
do while not eof()
   select jugadore
   seek wjuga.num_lista
   replace num_jug with recno("wjuga")
   select wjuga
   skip
enddo
close data
erase kk.dbf
erase wjuga.dbf