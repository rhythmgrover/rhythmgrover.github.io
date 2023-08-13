#How many times you want to repeat the experiment
rep = 10000

#count: number of times you win with switching strategy
count = 0
#Run a loop
for(r in 1: rep)
{
  #You choose Door 1 always
  chosendoor = 1
  
  #car door: Door behind which the car is; all three doors are equally likely
  cardoor <- sample(3,1)
  
  #Monty door: Door that Monty opens
  if(cardoor == 1)
  {
    Montydoor = sample(2:3,1)
    if (Montydoor ==2) {final_choice = 3}
    else{final_choice = 2}
  }
  else if(cardoor == 2)
  {
    Montydoor = 3
    final_choice = 2
  }
  else {Montydoor = 2
  final_choice = 3}
  
 #You win when your final choice matches the cardoor
  if(final_choice == cardoor)
    count = count + 1
}

#Final count: Number of times you won with the switching strategy
count

#Probability of winning
count/rep


########
#Shorter code
rep <- 10^5
cardoor <- sample(3,rep,replace=TRUE)
sum(cardoor!=1)/rep

