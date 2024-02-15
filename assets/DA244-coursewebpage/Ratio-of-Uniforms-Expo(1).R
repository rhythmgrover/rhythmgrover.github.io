#Ratio of Uniforms for Exp(1)

#set seed
set.seed(1)

#function to sample from the rectangle
draws.rectangle <- function(a,b,c)
{
  u <- runif(1, min = 0, max = a)
  v <- runif(1, min = b, max = c)
  return(c(u,v))
}

#square root of f function
sqrt.f <- function(x)
{
  exp(-x/2)
}

#rectangle 
a <- 1
b <- 0
c <- 2 * exp(-1)

#true probability of acceptance
prob.accept <- 1/(2*a*(c-b))

#number of samples
N <- 10000
sample <- vector("numeric", length = N)

i <- 1
counter <- 0
while(i<=N)
{
  counter <- counter + 1
  proposal <- draws.rectangle(a = a, b = b, c = c)
  frac.v.u <- proposal[2]/proposal[1]
  if(proposal[1] < sqrt.f(frac.v.u))
  {
    sample[i] <- frac.v.u
    i = i+1
  }
}

#check the density
plot(density(sample), main = "Estimated denisty for Exp(1)", col = "maroon")
lines(density(rexp(1000, 1)), col = "blue")
legend("topright", col = c("maroon", "blue"), lty = 1, legend = c("Ratio of Uniforms", "Truth"))

#check the probability of acceptance
#true probability
prob.accept
#fraction of acceptances
N/counter
