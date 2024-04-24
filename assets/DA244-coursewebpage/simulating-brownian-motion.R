#simulating Brownian motion
#set seed
set.seed(123)

#libraries
library(viridis)
library(scales)

#sample size 
n = 1000

#time horizon
t = 1

#time steps (time domain is continuous)
t.step = seq(0,t,length = n+1) # we want n more starting from 0

#change in time
dt = t/n

#Brownian motion
Bt <- function(){bm.t <- sqrt(dt) * cumsum(rnorm(n+1, 0, 1))
                return(bm.t)}

plot(t <- 0:n, Bt(), type = 'l')

#multiple plots
for(k in 1:10)
{
  lines(Bt(), type = 'l', xlab = 'time', col = viridis(10)[k])
}