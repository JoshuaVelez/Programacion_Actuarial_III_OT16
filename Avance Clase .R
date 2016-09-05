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
  data <- read.table("Datos_S&P.csv",F,",",nrows = 100) # tarea 2
  clases <- sapply(data,class)
  data <- read.table("Datos_S&P.csv",F,",",colClasses = clases)
  data

  # uso de Dput y dget
  
  y <- data.frame(a=1,b="a")
  dput(y) # al correr asi se muestra la descripcion del objeto
  dput(y,file="y.R") # almaceno un texto mostrando como se guardo al objeto en R
  nueva.y <- dget("y.R")
  y
  nueva.y
  
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
  # este elemento es una lista que contiene una secuencia
  x[1]
  
  # extraemos nuevamente el primer elemento de la lista ahora el elemento es la secuencia en si
  x[[1]]
  #extraemos un elemento por nombre
  x$bar
  x[["bar"]] # identifica el nombre
  x["bar"]
  