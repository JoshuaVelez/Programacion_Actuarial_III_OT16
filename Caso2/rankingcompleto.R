setwd("~/GitHub/Programacion_Actuarial_III_OT16/Caso2")

rankingcompleto <- function(resultado, num = "mejor") { 
       
        if(!(resultado %in% as.vector(c("Infarto","Falla Cardiaca","Neumonia")))){
            stop("resultado invalido")
        }    
        if(resultado == "Infarto"){
            resultado = 11 
        } 
        if(resultado == "Falla Cardiaca"){
            resultado = 17
        } 
        if(resultado == "Neumonia"){
            resultado = 23
        }
        
        out1 = read.csv("outcome-of-care-measures.csv")
        out1 = out1[grep("[[:digit:]]", out1[,resultado]), ]
        out2 = data.frame(out1[,2],out1[,7], out1[, resultado])
        colnames(out2) = c("Hospital", "Estado", "Resultado")
        out2 = out2[order(out1[,7], out1[,2]), ]
        final = NULL
        a = split(out2, out2[,2])
        for(y in 1:54){
            num2 = num
            num1 = length(which(y == as.numeric(out2[,2])))
            b = as.data.frame(a[y])
            a = b[order(as.numeric(as.vector(b[,3])), b[,1]), ]
            if(num == "mejor"){
                num2 = 1
            }
            if (num == "peor"){
                num2 = num1
            }
            a = data.frame(a[num2,1], a[1,2])
            final = rbind(final, a)
            a = split(out2, out2[,2])
            num = num
        }
        colnames(final) = c("Hospital", "Estado")
        final
        
    }


head(rankingcompleto("Infarto",20),10)
tail(rankingcompleto("Neumonia", "peor"), 3)
tail(rankingcompleto("Falla Cardiaca"), 10)
