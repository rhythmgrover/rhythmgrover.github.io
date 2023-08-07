
install.packages("ggplot2")
# Libraries
library(ggplot2)
library(viridis)

# Color palette
myPalette <- magma(35, alpha = 0.75, begin = 0, end = 1, direction = 1)

# Reading the data
data <-  read.csv("Nuclear power data.csv", header = TRUE)

# Create a horizontal bar plot using ggplot2
my_plot <- ggplot(data, aes(x = Country, y = Nuclear.reactors, fill = Country)) +
  geom_bar(stat = "identity", color = "black") +
  coord_flip() +
  scale_fill_manual(values = myPalette) +
  labs(x = "Country", y = "Number of nuclear reactors") +
  theme_minimal() +
  theme(
    axis.text.y = element_text(hjust = 0, size = 8),  
    axis.text.x = element_text(angle = 0, hjust = 1), 
    legend.position = "none"  # Remove the legend
  ) +
  ggtitle("Number of Nuclear Reactors by Country")

