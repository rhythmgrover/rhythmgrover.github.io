#
set.seed(1)

#number of draws of x
rep = 10000

#vector of g(x)
g.x <- vector("numeric", length = rep)

#draws from U(0,1) and computation of g(x)
for(i in 1:rep)
{
  draws.x <- runif(1,min = 0, max = pi) 
  g.x[i] <- exp(sin(draws.x))
}

#approximation
pi * mean(g.x)

