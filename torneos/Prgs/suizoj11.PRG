parameter camponom, camposex, campotit
****************************************************************************************************
* Revisar (creo que actualmente no hace nada)
****************************************************************************************************
if camposex = "w"
   if right(trim(camponom),1) = ")"
      titfem = STUFF(trim(camponom), 1, at("(",camponom), '')
      titfem = substr(titfem,1,len(titfem) - 1)
      do case
         case titfem = "FM"
            return("f")
         case titfem = "IM"
            return("m")
         case titfem = "GM"
            return("g")
      endcase
   else
      return(" ")
   endif
endif
return(campotit)