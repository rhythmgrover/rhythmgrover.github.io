#libraries
library(viridis)

#color pallete
myPalette <- viridis(50, alpha = 1, begin = 0, end = 1, direction = 1)

#data
data <- read.csv("alcohol_cirrohsis_data.csv")

#scatter plot between consumption and death rate
plot(data$Consumption, data$Death.Rate, col = myPalette, xlab = 'Consumption (ltrs/person/year)', ylab = 'Death rate (per 100000)')

#what if we remove the 'outlier'
new_data <- subset(data, Country != 'France')
plot(new_data$Consumption, new_data$Death.Rate, col = myPalette, xlab = 'Consumption (ltrs/person/year)', ylab = 'Death rate (per 100000)')
