#a
dirty.iris <- read.csv("/home/marcin/Computing-Inteligence-R/Lab4/dirty_iris.csv", header=TRUE, sep=",")
zbior = nrow(subset(dirty.iris, subset=(is.finite(Sepal.Length & Sepal.Width & Petal.Length & Petal.Width))))

#b

install.packages("editrules")
library(editrules)
E <- editset(c("Sepal.Length <= 30"))
E
ve <- violatedEdits(E, dirty.iris)
ve         
summary(ve)
plot(ve)

#c
E <- editset(expression(Sepal.Length <= 30,
                        Species %in% c("versicolor", "virginica", "setosa"),
                        Sepal.Length > Petal.Length,
                        Sepal.Length > 0, Sepal.Width > 0,
                        Petal.Length > 0, Petal.Width > 0,
                        Petal.Length >= (2*Petal.Width)))
E

#d
ve <- violatedEdits(E, dirty.iris)
ve
summary(ve)
plot(ve)
