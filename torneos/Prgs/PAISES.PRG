set talk off
use paises
zap
appe from C:\torneos\oro99b10\jugadore
replace all sub_torneo with "b10" for sub_torneo = " "
appe from C:\torneos\oro99b12\jugadore
replace all sub_torneo with "b12" for sub_torneo = " "
appe from C:\torneos\oro99b14\jugadore
replace all sub_torneo with "b14" for sub_torneo = " "
appe from C:\torneos\oro99b16\jugadore
replace all sub_torneo with "b16" for sub_torneo = " "
appe from C:\torneos\oro99b18\jugadore
replace all sub_torneo with "b18" for sub_torneo = " "
appe from C:\torneos\oro99g10\jugadore
replace all sub_torneo with "g10" for sub_torneo = " "
appe from C:\torneos\oro99g12\jugadore
replace all sub_torneo with "g12" for sub_torneo = " "
appe from C:\torneos\oro99g14\jugadore
replace all sub_torneo with "g14" for sub_torneo = " "
appe from C:\torneos\oro99g16\jugadore
replace all sub_torneo with "g16" for sub_torneo = " "
appe from C:\torneos\oro99g18\jugadore
replace all sub_torneo with "g18" for sub_torneo = " "
replace all licencia with 1
sort on federacion, sub_torneo to paises2
use paises2
total to paises3 on federacion+sub_torneo fields licencia
close data
