corr <- function(directorio, horizonte=0) {
  directorio <- setwd("~/GitHub/Programacion_Actuarial_III_OT16/specdata")
  Cumple = completos(directorio)
  idSi = Cumple[Cumple["nobs"] > horizonte, ]$id
  rrel = numeric()
  
  for (i in idSi) {
    
    data = read.csv(paste(directorio, "/", formatC(i, width = 3, flag = "0"),".csv", sep = ""))
    Hor = data[complete.cases(data), ]
    rrel = c(rrel, cor(Hor$sulfate, Hor$nitrate))
  }
  return(rrel)
}

corr("~/GitHub/Programacion_Actuarial_III_OT16/specdata", 1000) # Para correr cambiar directorio y el horizonte
cr <- corr("~/GitHub/Programacion_Actuarial_III_OT16/specdata", 150)
head(cr)