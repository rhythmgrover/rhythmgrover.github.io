#Let us simulate the matching card problem

#number of cards
n = 100

#simulate the experiment of turning over the cards from the deck
set.seed(1)
x = sample(n) #the function 'sample(n)' takes a sample of size that we specify from 1:n without replacement  

#now I want to check if the ith card matches the position in the deck
count = (x == (1:n))

#the number of matching cards in a single run of the experiment
sum(count)

#now I want to run this experiment a large number of times
rep = 10000
r = replicate(rep, sum(sample(n) == 1:n))


#add up the number of times where there was at least one matching card, and we divide by the number of simulations.
sum(r>=1)/rep

#Recall the derived solution
sol = 1- (1/exp(1))
sol
