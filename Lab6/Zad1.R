require(neuralnet)
siatk.dane <- read.csv("/home/marcin/Computing-Inteligence-R/Lab6/siatka.csv", header=TRUE, sep=",")
siatk.nn <- neuralnet(gra~wiek+waga+wzrost, siatk.dane, hidden=2, lifesign="full")
plot(siatk.nn)
siatk.predict <- compute(siatk.nn, siatk.dane[,1:3])$net.result

