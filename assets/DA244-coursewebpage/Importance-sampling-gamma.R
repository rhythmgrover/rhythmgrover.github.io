#Importance sampling 
#kth moment of Gamma distribution

#setting the seed
set.seed(1)

#Gamma parameters
alpha = 2
beta = 5

#Second moment
k = 2

#compute true second order moment
truth <- (alpha/beta^2) + (alpha/beta)^2

#Exponential paramater (Importance porposal)
lambda = 5

#Importance samples
N = 10000
samp <- rexp(N, rate = lambda)

#evaluate h(z)*pi(z)/g(z)
func <- samp^k * dgamma(samp, shape = alpha, rate = beta)/dexp(samp, rate = lambda)
mean(func)
truth #to compare with the truth


###
#Comparison of reference density pi and the importance density g
x <- seq(0,2,length = 1000)
plot(x, dgamma(x, shape = alpha, rate = beta), type = 'l', lty = 1, col = "blue", ylab = "density", ylim = c(0,5))
lines(x,dexp(x, rate = lambda), lty = 2, col = "red")
points(x = samp[1:100], y = rep(0,100), col = "green")
legend("topright", col = c("blue", "red"), legend = c("Gamma(2,10)", "Exp(5)"), lty = c(1,2), cex = 0.5)


###
#Convergence of the estimator
#Choose N to be large
N <- 1e5
#Importance samples
samp <- rexp(N, rate = lambda)
func <- samp^k * dgamma(samp, shape = alpha, rate = beta)/dexp(samp, rate = lambda)

#Plotting the running average
plot(1:N, cumsum(func)/1:N, type = 'l', xlab = "N", ylab = "Running average")
abline(h = truth, col = "red")

###
#Unbiasedness of the estimator
N <- 1e4
r <- 1e3

est <- vector("numeric", length = r)
for(a in 1:r)
{
  samp <- rexp(N, rate = lambda)
  func <- samp^k * dgamma(samp, shape = alpha, rate = beta)/dexp(samp, rate = lambda)
  est[a] = mean(func)
}

mean(est - truth)

#is it close to zero?