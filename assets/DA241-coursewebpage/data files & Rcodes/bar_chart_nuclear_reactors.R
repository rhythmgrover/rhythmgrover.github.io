#libraries
library(viridis)

#color pallete
myPalette <- magma(35, alpha = 0.75, begin = 0, end = 1, direction = 1)

#reading the data
data <-  read.csv("Nuclear power data.csv", header = TRUE)

#increase margin size
par(mar=c(4,11,2,2))

#barplot
barplot(data$Nuclear.reactors ~ data$Country, 
        horiz = TRUE, 
        las = 1, 
        ylab = '', 
        xlab = 'Number of nuclear reactors', 
        col = myPalette
)
