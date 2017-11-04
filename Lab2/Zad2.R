#a
iris.numeric <- as.matrix(iris[,-5], col.names=F)
colnames(iris.numeric) <- NULL
#b
iris.log <- log(iris.numeric)
#c
iris.preproc <- scale(iris.log)
