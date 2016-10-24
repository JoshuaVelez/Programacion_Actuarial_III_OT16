setwd("~/GitHub/Programacion_Actuarial_III_OT16/Caso2")

rankhospital <- function(estado, resultado, num = "mejor") { 
    # Lectura de datos 
    # Revisión de la validez de estado y resultado 
    # Regresa el nombre del hospital con el puesto dado de la tasa más  
    # baja de mortalidad de 30 días
  
    data <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
    
    estados <- data[ , 7]
    resultados <- c("Infarto", "Falla Cardíaca", "Neumonía")
    
      if ((estado %in% estados) == FALSE) {
          stop(print("Estado inválido"))
    }
      else if ((resultado %in% resultados) == FALSE) {
          stop(print("Resultado inválido"))
    }
     new_data <- subset(data, State == estado)
    
       if (resultado == "Infarto") {
            Col_Res <- 11
     }
       else if (resultado == "Falla Cardíaca") {
            Col_Res <- 17
     }
       else {
            Col_Res <- 23
     }
    
       if (is.numeric(num) == TRUE) {
           if (length(data[,2]) < num) {
               return(NA)
        }
    }
    
    new_data[, Col_Res] <- as.numeric(new_data[,Col_Res])
    mal <- is.na(new_data[, Col_Res])
    Info <- new_data[!mal, ]
    
    Nombre_Col_Res <- names(Info)[Col_Res]
    Nombre_Hosp <- names(Info)[2]
    index <- with(Info, order(Info[Nombre_Col_Res], Info[Nombre_Hosp]))
    Datos_Ordenados <- Info[index, ]
    
     if (is.character(num) == TRUE) {
          if (num == "mejor") {
             num = 1
        }
          else if (num == "peor") {
             num = length(Datos_Ordenados[, Col_Res])
        }
    }
      Datos_Ordenados[num, 2]
}

  rankhospital("TX","Falla Cardíaca", 4)
  rankhospital("MD","Infarto", "peor")
  rankhospital("MN","Infarto", 5000)
  