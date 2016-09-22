
 completos <- function(directorio, id = 1:332) {
   f <- function(i) {
     directorio <- setwd("~/GitHub/Programacion_Actuarial_III_OT16/specdata")
     data <- vector("numeric")
     data = read.csv(paste(directorio, "/", formatC(i, width = 3, flag = "0"),".csv", sep = ""))
     sum(complete.cases(data))
   }
   nobs = sapply(id, f)
   return(data.frame(id, nobs))
 }

 completos("~/GitHub/Programacion_Actuarial_III_OT16/specdata", 1:7) # Para correr el programa cambiar directorio e id