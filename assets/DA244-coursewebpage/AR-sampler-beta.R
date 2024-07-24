#Accept/Reject Sampler to draw from Beta(4,3)

set.seed(123)

simulate_beta <- function()
{
  c <- 60 * (3/5)^3 * (2/5)^2 #calculate c
  
  accept <- 0 #indicate an accept or reject
  
  counter <- 0 #count the number of loops
  
  while(accept == 0)
  {
    counter <- counter + 1
    U <- runif(1) #Draw from U(0,1)
    proposal.value <- runif(1) #Proposal value from g
    
    ratio = dbeta(proposal.value, shape1 = 4, shape2 = 3)/c
    
    if(U <= ratio)
    {
      accept <- 1
      return(c(proposal.value, counter))
    }
    
  }
}


#one sample
simulate_beta() #call the above function

#1000 samples
x.samples.target <- vector("numeric", length = 1000)
x.iterations <- vector("numeric", length = 1000)

for(t in 1:1000)
{
  dummy <- simulate_beta() #calling the function in dummy
  x.samples.target[t] <- dummy[1]
  x.iterations[t] <- dummy[2]
}


#check
x <- seq(0,1, length= 600)
plot(density(x.samples.target), main = "Estimated density", col = "blue")
lines(x, dbeta(x, shape1 = 4, shape2 = 3), col = "red", lty = 2)
legend("topleft", lty = 1:2, col = c("blue","red"), legend = c("AR", "truth"))


#let us look at the expected number of iterations
c <- 60 * (3/5)^3 * (2/5)^2
mean(x.iterations)
