#Doing the birthday problem experiment a single time
#number of people in the room
k <- 2

#birthday 
b <- sample(1:365,k, replace = TRUE)

#Do the birthdays match? 
duplicated(b)

#number of duplicates
sum(duplicated(b)) #if this is > 0 then at least one match is there else no match

#Lets repeat the experiment
#number of times I want to repeat my exp
rep = 10000

#maximum number of people in the room for which we want to compute the probability
maxk = 100

#p is a vector of prob of atleat one match for each k
p <- vector("numeric", length = maxk)

#We will run a loop on different values of k 
for(k in 1:maxk)
{
  #right now there is no match
  match = 0
 #for each k we do this experiment 10000 times
 for(r in 1: rep)
  {
  
   # sample birthdays from 1:365 days with replacement; assuming equally likely days 
   b <- sample(1:365,k, replace = TRUE)
  
  #Do the birthdays match? 
   duplicated(b)
  
  #If there is even one match, we add it the count
   if(sum(duplicated(b)) > 0)
   {
    match = match + 1
   }
 }
 #Frequency approach to compute the probability: number of times there is at least one match/number of times we repeat the experiment
 p[k] = match/rep
 p[k]
}

#plotting the prob vs number of people
k <- 1:maxk
plot(k, p, type = 'p')
abline(h = 0.5)