iris.numeric <- as.matrix(iris[,-5], col.names=F)
iris.log <- log(iris.numeric)
iris.preproc <- scale(iris.log)
iris.pca <- prcomp(iris.preproc)
iris.pca.data <- predict(iris.pca)[,1:2]
