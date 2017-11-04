#a
iris.pca <- prcomp(iris.preproc)
#b
iris.pca
#c
predict(iris.pca)
#e
iris.pca.data <- predict(iris.pca)
iris.pca.data <- iris.pca.data[,-3]
iris.pca.data <- iris.pca.data[,-3]
