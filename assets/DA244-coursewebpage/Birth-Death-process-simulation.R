#simulating Birth-Death Process

#seed
set.seed(0)

#setting the probabilities
#birth probability
p <- 0.6
#death probability
q <- 0.2
#nothing happens
r <- 1-p-q


#fix the number of steps (evolution till time step: steps)
steps <- 100

#Suppose there is 1 individual/animal/cell in the current population 
population <- 1

#now we run the loop to see what happens at future time steps
for(i in 1:steps)
{
  #check the current status of the population (last number in population)
  if(tail(population, 1) > 0)
  {
    foo <- sample(c(1,-1,0), size  = 1, prob = c(p,q,r))
    
    population <- c(population, tail(population, 1) + foo) #updating the population
    next
  }
  
  if(tail(population, 1) == 0)
  {
    foo <- sample(c(1,0), size  = 1, prob = c(p,1-p))
    
    population <- c(population, tail(population, 1) + foo) #updating the population
    next
  }
}

#plotting the process (the population)
plot(population, type = 'l', xlab = 'time', col = 'blue')