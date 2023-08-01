#install
#install.packages("viridis")
#libraries
library(viridis)
library(RColorBrewer)

#color pallete
myPalette <- viridis(3, alpha = 1, begin = 0, end = 1, direction = 1, option = "D")


#Data and labels
size<- c(30, 16, 9)
labels <- c("Large", "Medium", "Small")
 
# Plot the chart
#if I just do pie
#pie(size, labels)
pie(size, labels, border = "white", col = myPalette)



