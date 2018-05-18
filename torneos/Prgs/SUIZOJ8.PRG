parameters rondilla,tipo
base = int((control.ronda-1)/3)
c_ronda = right('00' + ltrim(str(3*base+rondilla)),2)
rival = "rival_r" + c_ronda
color = "color_r" + c_ronda
acumu = "acumu_r" + c_ronda
resul = "resul_r" + c_ronda
incom = "resulta" + str(rondilla,1) + ".incomparec"
do case
   case tipo = 1
      return(iif(&rival=0,space(3),str(&rival,3)))   
   case tipo = 2
      return(&color)   
   case tipo = 3
      if &rival = 0 and &resul = 8
         return(space(5))
      else
         return(str(&acumu,4,1) + &incom)
      endif
   case tipo = 4
      return(&resul)   
endcase   