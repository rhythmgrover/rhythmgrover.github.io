#libraries
library(viridis)

#color pallete
myPalette <- viridis(2, alpha = 0.75, begin = 0, end = 1, direction = 1)

#data
data <-  read.csv("USA workforce.csv", header = TRUE)
#increase margin size
par(mar=c(4,11,2,2))

#barplot for employed males
barplot(data$Male ~ data$Type.of.employment, 
        horiz = TRUE, 
        las = 1, 
        ylab = '', 
        xlab = '', 
        col = myPalette
)

#barplot for employed females
barplot(data$Female ~ data$Type.of.employment, 
        horiz = TRUE, 
        las = 1, 
        ylab = '', 
        xlab = '', 
        col = myPalette
)

#barplot for employed people
barplot(cbind(data$Male, data$Female) ~ data$Type.of.employment, 
        horiz = TRUE, 
        las = 1, 
        ylab = '', 
        xlab = '', 
        col = myPalette
)

#side by side
new_data <- rbind(data$Male, data$Female)
colnames(new_data) <- data$Type.of.employment
barplot(height = new_data, 
        beside = TRUE, 
        legend.text = TRUE ,
        col = myPalette
)

