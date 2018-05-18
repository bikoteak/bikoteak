select 0
use torneo
select 0
use control
select 0
use jugadore
replace all nombre with nombres(nombre) for upper(nombre) = nombre

replace all categoria with '0' for categoria = "GM"
replace all categoria with '1' for categoria = "IM"
replace all categoria with '2' for categoria = "FM"
replace all categoria with '3' for categoria = "WGM"
replace all categoria with '4' for categoria = "WIM"
replace all categoria with '5' for categoria = "WFM"
replace all categoria with '6' for categoria = "CM"
replace all categoria with '7' for categoria = "WCM"
replace all categoria with '8' for categoria = " "
sort on elo_fide/d,elo_naci/d,elo_prov/d,categoria,nombre to wjuga
zap
append from wjuga
erase wjuga.dbf
replace all categoria with 'GM' for categoria = "0"
replace all categoria with 'IM' for categoria = "1"
replace all categoria with 'FM' for categoria = "2"
replace all categoria with 'WGM' for categoria = "3"
replace all categoria with 'WIM' for categoria = "4"
replace all categoria with 'WFM' for categoria = "5"
replace all categoria with 'CM' for categoria = "6"
replace all categoria with 'WCM' for categoria = "7"
replace all categoria with ' ' for categoria = "8"
replace all num_jug with recno(),clasific with recno(),traspaso with space(2);
            tot_buc_c with torneo.num_rondas * 0.5,tot_ptos with 0
replace all media_sw with .t.,media_elo with 0,num_lista with num_jug
use jugadore
reindex
use cuadro
zap
close databases