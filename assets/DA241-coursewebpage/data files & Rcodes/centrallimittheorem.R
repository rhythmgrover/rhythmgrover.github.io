#libraries
library(viridis)
library(scales) 

#let us visualize the CLT for a distribution of interest by plotting the distribution of sample mean for various values of n

#Uniform(0,1)
#number of times we want to do the experiment
nsim <- 10^3
#number of random variables, X1, X2, ... (we are interested i the distribution of \bar{X}_{10})
n <- 10
#create a matrix of random numbers from Uniform(0,1)
x <- matrix(runif(n*nsim), nrow=nsim, ncol=n)
#calculate the means for each simulation
xbar <- rowMeans(x)
#plot the histogram
hist(xbar, col = viridis(20)[5])


#Exponential with rate 1
#number of times we want to do the experiment
nsim <- 10^3
#number of random variables, X1, X2, ... (we are interested i the distribution of \bar{X}_{10})
n <- 100
#create a matrix of random numbers from Expo(1)
y <- matrix(rexp(n*nsim, rate = 1), nrow=nsim, ncol=n)
#calculate the means for each simulation
ybar <- rowMeans(y)
#plot the histogram
hist(ybar, col = viridis(20)[10])


#Poisson with rate 2
#number of times we want to do the experiment
nsim <- 10^3
#number of random variables, X1, X2, ... (we are interested i the distribution of \bar{X}_{10})
n <- 100
#create a matrix of random numbers from Expo(1)
z <- matrix(rexp(n*nsim, rate = 1), nrow=nsim, ncol=n)
#calculate the means for each simulation
zbar <- rowMeans(z)
#plot the histogram
hist(zbar, col = viridis(20)[15])


