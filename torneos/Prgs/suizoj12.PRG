parameters camposex, campotit
****************************************************************************************************
* Revisar (creo que lo hace mal)
****************************************************************************************************
return(iif(camposex = "w",iif(at("w",campotit)=1,substr(campotit,2), campotit)," "))