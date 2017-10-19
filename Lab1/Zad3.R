#a
install.packages("genalg")
library(genalg)
install.packages("ggplot2")
library(ggplot2)

#b
dataset <- data.frame(
  item = c("pocketknife", "beans", "potatoes", "unions", 
           "sleeping bag", "rope", "compass"),
  survivalpoints = c(10, 20, 15, 2, 30, 10, 30), 
  weight = c(1, 5, 10, 1, 7, 5, 1))
weightlimit <- 20

#c
chromosome = c(1, 0, 0, 1, 1, 0, 0)
dataset[chromosome == 1, ]
cat(chromosome %*% dataset$survivalpoints)

#d
fitnessFunc <- function(x) {
  current_solution_survivalpoints <- x %*% dataset$survivalpoints
  current_solution_weight <- x %*% dataset$weight
  if (current_solution_weight > weightlimit) 
    return(0) else return(-current_solution_survivalpoints)
}


#e
GAmodel <- rbga.bin(size = 7, popSize = 200, iters = 100,
                    mutationChance = 0.01, elitism = T, evalFunc = fitnessFunc)
summary(GAmodel, echo=TRUE)

#f
iter<-100
animate_plot <- function() {
  for (i in seq(1, iter)) {
    temp <- data.frame(Iteracja = c(seq(1, i), seq(1, i)), Legenda = c(rep("Średnia",
                                                                           i), rep("Najlepsza", i)), WartoscFitness = c(-GAmodel$mean[1:i], -GAmodel$best[1:i]))
    pl <- ggplot(temp, aes(x = Iteracja, y = WartoscFitness, group = Legenda,
                           colour = Legenda)) + geom_line() + scale_x_continuous(limits = c(0,
                                                                                            iter)) + scale_y_continuous(limits = c(0, 110)) + geom_hline(y =
                                                                                                                                                           max(temp$WartoscFitness),
                                                                                                                                                         lty = 2) + annotate("text", x = 1, y = max(temp$WartoscFitness) +
                                                                                                                                                                               2, hjust = 0, size = 3, color = "black", label = paste("Najlepsze rozwiązanie:",
                                                                                                                                                                                                                                      max(temp$WartoscFitness))) + scale_colour_brewer(palette = "Set1")
    print(pl)
  }
}
animate_plot()

