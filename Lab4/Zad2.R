install.packages("deducorrect")
library(deducorrect)

dirty.iris <- read.csv("dirty_iris.csv")
rules <- correctionRules("/home/marcin/Computing-Inteligence-R/Lab4/rules.txt")

corrected.iris <- correctWithRules(rules, dirty.iris)
corrected.iris$corrected

