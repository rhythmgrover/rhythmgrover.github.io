#libraries
library(viridis)
library(scales)    

 # Flip a coin: Sample from Omega = {heads, tails}, 100 times with replacement
     flips <- sample(c("heads", "tails"), size = 100, replace = TRUE)

     #Calculate the number of times you get heads in n tosses: n=1, 2, ..., size
     cumsum(flips == "heads")

     #Calculate the proportion of flips producing heads against the total number of flips
     cumsum(flips == "heads") / (1:length(flips))

     #Plot the proportions
     plot(cumsum(flips == "heads") / (1:length(flips)), 
          type = "l", ylim = c(0,1),  
          main = "Coin Flips", 
          xlab = "Number of flips", ylab = "Proportion of heads", col = viridis(20)[nsim])

#Let us simulate this sim times
sim = 10
for(nsim in 2:sim)
{
     # Flip a coin: Sample from Omega = {heads, tails}, 10 times with replacement
     flips <- sample(c("heads", "tails"), size = 100, replace = TRUE)

     #Calculate the number of times you get heads in n tosses: n=1, 2, ..., size
     cumsum(flips == "heads")

     #Calculate the proportion of flips producing heads against the total number of flips
     cumsum(flips == "heads") / (1:length(flips))

     #Plot the proportions
     lines(cumsum(flips == "heads") / (1:length(flips)), 
          type = "l", ylim = c(0,1),  
          main = "Coin Flips", 
          xlab = "Number of flips", ylab = "Proportion of heads", col = viridis(sim)[nsim])
}
abline(h = 0.5, col = "red")
