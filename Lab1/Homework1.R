#a
phi1 <- matrix(c(-1,-2,1,1,2,-1,1,2,3,-3,-2,-3,3,2,4,4,4,-4,-4,-4,3,0,0,0,0,0,0,0), ncol=4)
#b
phi2 <- as.matrix(read.csv("/home/marcin/Computing-Inteligence-R/Lab1/dubois20.cnf.txt", header=FALSE, skip=13, sep="", colClasses=c(NA,NA,NA,"NULL")))
#c
fitness = function(temp, phi){
  licz = 0
  wynik = FALSE
  max = max(as.numeric(unlist(phi)))
  for(i in 1:nrow(phi)){
    row <- phi[i,]
    row_1 <- abs(row[1])%%3
    if(row_1 == 0){ row_1 = 3}
    row_2 <- abs(row[2])%%3
    if(row_2 == 0){ row_2 = 3}
    row_3 <- abs(row[3])%%3
    if(row_3 == 0){ row_3 = 3}
    x1 = temp[row_1]
    if(row[1] < 0){ x1 = !x1 }
    x2 = temp[row_2]
    if(row[2] < 0){ x2 = !x2 }
    x3 = temp[row_3]
    if(row[3] < 0){ x3 = !x3 }
    wynik = x1 | x2 | x3
    if(!is.na(wynik)){ if(wynik){ licz = licz + 1 } }
  }
  return(licz)
}
#d
licz = fitness(c(1,1,1,0), phi1)

