#libraries
library(viridis)

#color pallete
myPalette <- viridis(50, alpha = 1, begin = 0, end = 1, direction = 1)

#data
data <-  read.csv("Body and weights.csv", header = TRUE)


#scatter plot between body weight and brain weight
plot(data$Body.weight , data$Brain.weight, col = myPalette, xlab = 'Body weight (kg)', ylab = 'Brain weight (g)')


#transforming the data
plot(log(data$Body.weight), log(data$Brain.weight), col = myPalette, xlab = 'Body weight (kg)', ylab = 'Brain weight (g)')
