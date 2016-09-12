Total3 <- 0
Total10 <-0

for (i in 1:100){ 
z <- 5
Caminata <- c(z)
while(z>= 3 && z<=10){ 
  print(z)
  moneda <- rbinom(1,1,0.5) 
  Caminata <-c(Caminata,z)
  if(moneda==1){ # Caminata Aleatoria 
    z <- z+1
  } else {
    z <- z-1
  } 
  }
 print(Caminata)
 if(z==2){Total3 <- Total3+1
 } else { 
Total10 <- Total10+1}
}

Total3
Total10