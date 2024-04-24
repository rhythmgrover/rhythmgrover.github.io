#setting the seed
set.seed(1)

#function for importance sampling
imp.gamma <- function(N = 1000, alpha = 4, beta = 10, 
                      moment = 2, imp.alpha = alpha + moment)
{
  func <- vector("numeric", length = N)
  
  #draw importance samples
  draw <- rgamma(N, shape = imp.alpha, rate = beta)
  func <- draw^moment * dgamma(draw, shape = alpha, rate = beta)/ dgamma(draw, shape = imp.alpha, rate = beta)
  return(func)
}

N <- 10000

#Choosing simple Monte Carlo
#Estimation using classical Monte Carlo (i.i.d)
monte.carlo.samples <- imp.gamma(N = N, imp.alpha = 4)
mean(monte.carlo.samples)
#truth = 0.2
var(monte.carlo.samples)

#Choosing optimal importance proposal
#Estimation using optimal importance sampling
imp.samples <- imp.gamma(N = N)
mean(imp.samples)
var(imp.samples)

#Why this is a good estimate?
grid <- seq(0.001, 5, length = 1000)
plot(grid, dgamma(grid, shape = 4, rate = 10), type = 'l', ylab = "Density")
lines(grid, dgamma(grid, shape = 6, rate = 10), type = 'l', col = 'red')
legend("topright", col = 1:2, lty = 1, legend= c("Reference", "Optimal"), cex = 0.8)


#Choosing a horrible proposal
#Estimation using Gamma(100, 10)
imp.samples <- imp.gamma(N = N, imp.alpha = 100)
mean(imp.samples)
var(imp.samples)

#Why is it a bad estimate?
grid <- seq(0.01, 15, 0.01)
plot(grid, dgamma(grid, shape = 4, rate = 10), type = 'l', ylab = "Density")
lines(grid, dgamma(grid, shape = 100, rate = 10), type = 'l', col = 'red')
legend("topright", col = 1:2, lty = 1, legend= c("Reference", "Optimal"), cex = 0.8)
#no high weights: low weights on samples where red curve has a peak
#samples from where black has peak will never be drawn
