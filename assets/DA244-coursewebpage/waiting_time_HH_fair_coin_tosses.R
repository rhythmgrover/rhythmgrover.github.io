#package required
library("stringr")

#generating a sequence of fair coin tosses
sample(c("H","T"),100,replace=TRUE) #using sample with replacement from the sample space {H,T}

#to produce a single string rather than a sample vector, we use paste with collapse argument 
paste(sample(c("H","T"),100,replace=TRUE),collapse="")

#we simulate many such strings
rep = 1000
strings.coin.tosses <- replicate(rep,paste(sample(c("H","T"),100,replace=T),
                          collapse=""))

#let's find the first appearance of HH
#str_locate function in stringr package creates a two column table: starting and ending positions of HH
HH.appearance <- str_locate(strings.coin.tosses, "HH")

#view HH.appearance table
head(HH.appearance)

#average waiting time for HH in rep number of times we simulate this experiment
mean(HH.appearance[,2])
