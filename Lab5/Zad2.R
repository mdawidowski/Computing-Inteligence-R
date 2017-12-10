iris <- data.matrix(iris[,-5])
colnames(iris) <- NULL
iris.log <- log(iris)
iris.preproc <- scale(iris.log)
iris.pca <- prcomp(iris.preproc)
iris.pca.data <- predict(iris.pca)[,1:2]
iris.kmeans <- kmeans(iris.pca.data, 3)
plot(iris.pca.data, col = iris.kmeans$cluster)
points(iris.kmeans$centers, col = 1:3, pch = 3, cex = 2)

