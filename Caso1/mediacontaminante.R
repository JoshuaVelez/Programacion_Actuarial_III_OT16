
 mediacontaminante  <- function(directorio, contaminante, id = 1:332) {
   directorio <-setwd("~/GitHub/Programacion_Actuarial_III_OT16/specdata")
   data <- vector("numeric")
   data = sapply(id, function(i) read.csv(paste(directorio, "/", formatC(i,width = 3, flag = "0"), ".csv", sep = ""))[[contaminante]])
   
   if(contaminante=="sulfate"){
     return(mean(unlist(data), na.rm = TRUE))
      } else if (contaminante=="nitrate"){
         return(mean(unlist(data), na.rm = TRUE))
      } else {
        paste("El contaminante buscado",contaminante,"no se encuentra en la lista")
          }
 }
 
 mediacontaminante("~/GitHub/Programacion_Actuarial_III_OT16/specdata", "nitrate", 2:4) # Para correr cambiar directorio e id
 