setwd("~/GitHub/Programacion_Actuarial_III_OT16/Caso2")

mejor <- function(estado, resultado) {  
    # Lectura de datos 
    # Revisión de la validez de estado y resultado 
    # Regresa el nombre del hospital con la tasa más baja de mortalidad de 30 días 

    data <- read.csv("outcome-of-care-measures.csv", colClasses = "character", na.strings = "Not Available")
    
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
    
    Col_necesarias <- as.numeric(new_data[,Col_Res])
    mal <- is.na(Col_necesarias)
    datos_deseados <- new_data[!mal, ]
    
    columnas_consideradas <- as.numeric(datos_deseados[, Col_Res])
    Fila_deseada <- which(columnas_consideradas == min(columnas_consideradas))
    hospitales_deseados <- datos_deseados[Fila_deseada, 2]
    
       if (length(hospitales_deseados) > 1) {
        Clas_Hosp <- sort(hospitales_deseados)
        Clas_Hosp[1]
    }
       else {
        hospitales_deseados
    }
} 

  mejor("TX", "Infarto")
  mejor("MD", "Falla Cardíaca")
  mejor("MD", "Neumonía")
  mejor("BB", "Infarto")
  mejor("NY", "Ataque")