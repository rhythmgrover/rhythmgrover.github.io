#libraries
library(viridis)

#color pallete
myPalette <- viridis(50, alpha = 0.25, begin = 0, end = 1, direction = 1)

data <-  read.csv("Infants with SIRD.csv", header = TRUE)

hist(x=data$Birth.weights,
     col = myPalette,
     breaks = seq(1.0, 3.8, 0.2), 
     xlab = 'Birth weights', ylab = 'Frequency', 
     main = 'Histogram')
