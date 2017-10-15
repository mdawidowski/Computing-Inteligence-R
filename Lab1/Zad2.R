#a
getwd()
setwd("C:\\Users\\mdawidowski\\Documents")
#b
b = read.csv("osoby.csv")

#c
b[,"imie", drop=FALSE]

#d
x = subset(osoby, osoby[3] == "k" )

#e
av = mean(osoby$wiek)

#f
su = summary(osoby["wiek"])

