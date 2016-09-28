---
title: "Practica2"
author: "Joshua Velez"
date: "25 de agosto de 2016"
output: html_document
---


 # Clase del 25/08/2016
 # Crear Vectores
 x <- vector(mode="numeric", length = 5L)
 x
 
 #Crear vectores con la funcion c
 x <- c(0.5,0.6)
 x
 class(x)
 
 x <- c(TRUE, FALSE, T, F)
 x
 class(x)
 
 x <- 5:10
 x
 class(x)
 
 x <- 10:0
 x
 class(x)
 
 x <- c(1+2i,5,3+9i,-4-5i)
 x
 class(x)

x <- c("a","b","c","d")
x
class(x)

 # Mezcla de objetos de un vector
 
 y <- c(1.7, "a")  #caracter
 y
 class(y)
 
 y <- c(TRUE,2)   #numerico
 y
 class(y)
 
 y <- c("a",TRUE) #caracter
 y
  class(y)
  
 y <- c(TRUE, 10L, 8.5,1+1i, "Nacho")
 y
  class(y) 
  
 # Orden de coaccion/ coercion explicita
 
 # 1 character
 # 2 complex
 # 3 numeric
 # 4 integer
 # 5 logical
  
 # Coercion explicita
  z <- 0:6
  class(z)
  as.numeric(z)
  as.logical(z)
  as.character(z)
  
  z <- c(1+2i,3+4i,8,0+3i,0)
  as.logical(z)
  
  z <-c("Programacion","Actuarial","III")
  as.numeric(z)
  as.logical(z)
  as.complex(z)
  
  #listas(es como un vector pero de c=vectores y c/u tiene su propia clase)
  x <- list(1,"a",TRUE,1+4i)
  x
  
  # Matrices
  m <- matrix(nrow=2,ncol = 3)
  m
  dim(m)
  attributes(m)
  
 # Cambio de dimensiones de 2x3 a 3x2
  dim(m) <- c(3,2)
  m
  # Crear matriz con datos
  m <- matrix(1:6,3,2)
  m
  
  m <- matrix(1:6,3,2,TRUE)
  m
  
  m <- matrix(1:6,3,3, T)
  m
  str(m)
  
  dim(m) <- c(2,5) # Esto produce un error
  
  x <- c(1,2,3)
  y <- c("a","b","c")
  z <- c(x,y)
  z

  m1 <- rbind(m,x)
  m1
  
  m2 <- cbind(m,x)
  m2
  
  m1 <- rbind(m,y)
  m1
  
  m2 <- cbind(m,y)
  m2
  
  rbind(m1,y)
  cbind(m2,y)
  
  # Factores
  x <- factor(c("si","no","si","si","no","si","no"))
  x
  table(x)
  unclass(x)
  x <- factor(c("si","no","si","si","no","si","no"),levels = c("si","no"))
  x  
  unclass(x)
  
  x <- factor(c("azul","azul","rojo","amarillo","verde","azul"))
  x
  table(x)
  
  # Valores Faltantes
  x <- c(1,2,NA,10,3)
  is.na(x)
  is.nan(x)
  
  x <- c(1,2,NaN,10,3)
  is.na(x)
  is.nan(x)
  
  # Data Frames
  x <- data.frame(Erick = 1:4, Lori = c(T,T,F,F))
  x
  row.names(x) <- c("Primero","segundo","tercero","cuarto")
  x
  nrow(x)
  ncol(x)
  attributes(x)
  names(x) <- c("Yarely","Karen")
  x
  
  # Los nombres no son exclusivos de los data frames
  x <- 1:3
  names(x) # vacio(null)
  names(x) <- c("Hugo","Paco","Luis")
  x
  
  x <- list(a=1:10,b=100:91,c=51:60)
  x
  names(x) <- c("Sec1","Sec2","Sec3")
  x
  
  m <- matrix(1:4,2,2)
  m
  attributes(m)
  dimnames(m) <- list(c("fill","fill2"),c("col1","col2"))
  m
  
  m <- matrix(NA, 5,6)
  dimnames(m) <- list (c(1:5), c("A","B","C","D","E","F"))
  m
 # Lectura de Datos
  getwd()
  setwd("~/GitHub/Programacion_Actuarial_III_OT16")
  data <- read.csv("Datos_S&P.csv")
  data <- read.table("Datos_S&P.csv",T,",")
  
  x <- "Programacion Actuarial III"
  y <- data.frame(a=1,b="a")
  dump(c("x","y"),file= "data.R") # para multiples variables, se pone entre comillas para que pegue el objeto llamado x
  rm(x,y) # remueve x, y
  source("data.R") # lo busca y lo vuelve a cargar
   
  dput(airquality, file = "Airquality.R") # Guarda un archivo directo en memoria
  
  con <- url("http://www.fcfm.buap.mx/",'r')
  x <- readLines(con,7) # con writeLines lo guarda directo en un archivo
  x
  
  # Creamos un vector
  x <- c("a","b","c","c","d","e")
  # veamos el vector
  x
  # extraemos elementos del vector
  x[1] # en orden alfabetico
  x[2]
  # Tambien pdemos extraer una secuencia de datos
  x[1:4]
  # ES posible extraer elementos con restriccion
  x[x>"b"]
  # De manera equivalente se puede obtener un vector logico
  u <- x == "c"
  u
  p
  x[u]
  
  # Creamos una lista
  x <- list(foo= 1:4, bar =0.6)
  # extraemos el primer elemento de la lista
  # este elemento es una lista que contiene una secuencia, porlo tanto te da toda la lista
  x[1]
  
  # extraemos nuevamente el primer elemento de la lista ahora el elemento es la secuencia en si
  x[[1]]
  #extraemos un elemento por nombre esto es parecido al corchete doble
  x$bar # cuando esta el signo de pesos no se pueden hacer operaciones
  x[["bar"]] # identifica el nombre
  x["bar"]
  x$foo[2]
  
  # Creamos una lista de 3 elementos
  x <- list(foo = 1:4, bar= 0.6, baz="Hola")
  #Extraemos el primer y tercer elemento de la lista
  x[c(1,3)]
  x[[c(1,3)]] # selecciona del primer grupo el tercer elemento
  # Los corchetes [[ ]] pueden usar indices calculados, el $ solamente puede usar el nombre literal
  name <- "foo"
  x[[name]]
  x$name
  x$foo
  
  # se pueden extraer elementos de los elementos extraidos
  x <- list(a= list(10,12,14), b= list(3.14,2.81))
  x[[c(1,3)]]
  x[[1]][[3]]
  x[[c(2,1)]]
  # Subconjunto de una matriz
  x<- matrix(1:6,2,3)
  x
  x[1,2] # extrae dato
  x[2,1]
  x[1,] # extrae una fila
  x[,2] # extrae una columna
  # con drop = FALSE mantiene la dimension y el resultado sera una matriz
   x[,2]
   x[1,2, drop= FALSE]
   x[1,]
   x [1, ,drop= FALSE]
   # Subconjunto con nombres
   x <-list(aardvark=1:5)
   x$a # inicial de aardvark
   x[["a"]]
   x[["a",exact= FALSE]] # pueden no ser explicitas y ser parciales
   
   # Valores faltantes
   airquality[1:6,] # extrae las primeras 6 filas y la fila entera
   completos <- complete.cases(airquality)
   completos # filas con datos faltantes
   airquality[completos,] # extrae filas completas
   airquality[completos,][1:6,] # extrae filas del 1 al 6 con datos completos
   airquality[1:6,][completos,]
   
   # Operaciones Vectorizadas
   x <- 1:4; y <- 6:9 # si el tamano no es igual repetira el menor valor para las operaciones
   x + y
   x>2
   x>=2
   y == 8 # para evaluar el igual se pone ==
   x*y
   x/y
   # Operaciones con matrices
   x <- matrix(1:4,2,2); y <- matrix(rep(10,4),2,2) # rep repite el numero aqui el diez 4 veces
   x*y
   x/y
   x %*% y # solo funciona con la dimension de la matriz correcta, multiplicacion de matrices
   
   # Estructuras de control If-Else
   
   If(x>3) {
     y <-10
   } else {y<-0}
   
   #Estructuras de control For
   for(i in 1:10){print(i)}
   
   x <- c("a","b","c","d")
   for(i in 1:4){print(x[i])}
   for(i in seq_along(x)){print(x[i])} # seq_along cuenta la longitud de la secuencia
   for (letra in x){print(letra)} 
   for(i in 1:4)print(x[i]) # se pueden omitir los parentesis si solo es una instruccion   
   
   w<- matrix(1:6,2,3) 
   for(i in seq_len(nrow(w))){for(j in seq_len(ncol(w))){print(w[i,j])}} # Convenientemente se deben anidar 2 o 3 niveles de ciclo for
   
   # ciclos While # Las condiciones se evaluan de izquierda a derecha
   z <- 5
   while(z>= 3 && z<=10){ # && se evalua un solo numero, doble simbolo con condiciones verdadero o falso
     print(z)
   moneda <- rbinom(1,1,0.5) # distribucion binomial
   if(moneda==1){ # Caminata Aleatoria 
     z <- z+1
   } else {
       z <- z-1}
   }
   # mismo caso pero guardando en un vector
   z <- 5
   x <- c(z)
   while(z>= 3 && z<=10){ 
     print(z)
     moneda <- rbinom(1,1,0.5) 
     x <-c(x,z)
     if(moneda==1){ # Caminata Aleatoria 
       z <- z+1
     } else {
       z <- z-1}
   }
   x
  plot(x)
   z <- 5
   x <- c(z)
   while(z>= 3 && z<=10){ 
     print(z)
     moneda <- rbinom(1,1,0.5) 
     x <-c(x,z)
     if(moneda==1){ # Caminata Aleatoria 
       z <- z+0.5
     } else {
       z <- z-0.5}
   }
   plot(x) # hace una grafica de x 
   str(x) # mide tamaño de x
   
   # Repeat inicia un ciclo infinito que no parara hasta llamar un break
   x0 <- 1
   tol <- 1e-8
   repeat{
     x1 <- CalculaEstimado(x0)
      if(abs(x1-x0)< tol){break
      }else{
          x0 <- x1
        }
   }
   
   # Creacion de funciones
   
   suma2 <- function(x,y){
     x +y
   }
   suma2(1,2) # para correr se pone en la consola
   mayor10 <- function(x){
     x[x>10]
   }
   mayor10(runif(100,5,15)) # para correr se pone en la consola
   # mayorque cualquier numero
   mayorque <- function(x,n){  
     x[x>n]
   }
   mayorque(1:10,3)  # para correr se pone en la consola
   
   promedioCol <- function(x,quitar.NA = TRUE){
     nc <- ncol(x)
     medias <- vector("numeric",nc)
     for (i in 1:nc){
       medias[i] <- mean(x[,i], na.rm = quitar.NA ) #na.rm quita los valores faltantes
     } 
     medias
   }
   promedioCol(as.data.frame(c(1,2,3,NA)))
   
   # Evaluacion Perez Sosa
   f <- function(a,b){
     a^2
   }
   f(2,"NA")
   f <- function(a,b){
     print(a)
     print(b)
   }
   f(2) 
   
   # Argumento "..."
   myplot <- function(x,y, type="l",...){ # significa todo los demas argumentos que pueden ser utilizados 
     plot(x,y,type=type, ...)
   }
   
   args(paste) # paste es para concatenar
   function(..., sep = " ", collapse = NULL) # cuando no se conoce el Num. de argumentos por anticipado
     NULL
   
   args(cat)
   function (...,file = "", sep = " ", fill = FALSE, labels = NULL, append = FALSE)
     NULL
   
   paste("a","b",sep=":") # se debe de nombrar los argumentos despues de los ..., con ""
   
   search() # orden de revision de funciones
   library() # para colocar el paquete en search a la segunda posicion
   
   # esta funcion regresa como resultado una funcion como su valor
   hacer.potencia <- function(n) {
     potencia <- function(x) {
       x^n
     }
  
     potencia
   }
   
   cubica <- hacer.potencia(3)
   cubica(3)  
   cuadrada <- hacer.potencia(2)
   cuadrada(3)
   
   ls(environment(cubica))
   get("n", environment(cubica))
   ls(environment(cuadrada))
  get("n", environment(cuadrada))
   
  y <- 10
  
  f <- function(x) {
    y <- 2
    y^2 + g(x)
  }
  
  g <- function(x) {
    x*y                # utiliza la y que esta fuera del entorno y=10
  }
  
  # Fechas y tiempo
  x <- as.Date("1970-01-01")
  x
  unclass(x)
  unclass(as.Date("1970-01-02"))
  
  date()
  as.POSIXct.Date()
  
  lapply
  
  x <- list(a = 1:5, b = rnorm(10000))
  lapply(x, mean)
  
  x <- list(a = 1:5, b = rnorm(10), c = rnorm(10, 1), d = rnorm(10, 2))
  lapply(x, mean)
  
  sapply(X, mean) # hace lo mismo que lapply pero simplificado
  
  x <- 1:4
  lapply(x, runif) # runif genera numero de aleatorios de acuedo a la secuencia uniformes entre 0 y 1
  
  x <- 1:4
  lapply(x, runif, min = 5, max = 15) # para generar numeros aleatorios entre un intervalo
  
  sapply(x, runif, min = 5, max = 15)
   
  # Apply
  x <- matrix(rnorm(200), 20, 10)
  apply(x, 2, mean)        
  
  apply(x,1,sum)
  
  x <- matrix(rnorm(200), 20, 10)
  apply(x, 1, quantile, probs = c(0.25, 0.75))
  
  a <- array(rnorm(2 * 2 * 10), c(2, 2, 10))
  apply(a, c(1, 2), mean)
  rowMeans(a,dims = 2)
  
  list(rep(1, 4), rep(2, 3), rep(3, 2), rep(4, 1))
  # la lista se puede hacer con mapply
  # mapply para aplicar de manera vectorizada los argumentos de una funcion
  mapply(rep,1:4,4:1)
  
  noise <- function(n, mean, sd) {
      rnorm(n, mean, sd)
      }
  mapply(noise, 1:5, 1:5, 2)
  
  # Tapply
  x <- c(rnorm(10),runif(10),rnorm(10,1))
  f <- gl(3,10) # gl genera niveles
  f
  
  tapply(x,f,mean)
  tapply(x,f,mean,simplify = F)
  