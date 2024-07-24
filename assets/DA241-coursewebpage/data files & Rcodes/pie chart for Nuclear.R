#libraries
library(viridis)
library(RColorBrewer)

#reading the data
data <-  read.csv("Nuclear power data.csv", header = TRUE)

#color pallete
myPalette <- magma(35, alpha = 0.75, begin = 0, end = 1, direction = 1)

#making the pie chart
pie(data$Nuclear.reactors, 
    main = "Nuclear Power Station", 
    labels = c(data$Country), 
    col = myPalette
)

#too many categories
#clubbing the countries with less than 10 reactors
count = 0
for(k in 1:length(data$Country))
{
 if(data$Nuclear.reactors[k] <= 10)
 {
   count = count + data$Nuclear.reactors[k]
 }
}

#new data
new_data <- rbind(subset(data, data$Nuclear.reactors>=10), c('Others', count))

#new color scheme
#myPalette <- viridis(20, alpha = 0.75, begin = 0, end = 1, direction = 1, option = "D")
myPallete <- viridisMap(n = 256, alpha = 0.2, begin = 0, end = 1, direction = 1, option = "D")

#pie chart for the new data
pie(strtoi(new_data$Nuclear.reactors), 
    main = "Nuclear Power Station", 
    labels = c(new_data$Country), 
    border = "white",
    col = myPalette
)
