#set seed
x0 = 7

#set positive integers
a = 7^5
m = 2^31 - 1

#numbers you want to generate
n = 1000

#sequence of numbers that we generate can be stored in x
x <- vector("numeric", length = n)

#recursion to generate the first number
x[1] = (a * x0) %% m
for(i in 2:n)
{
  x[i] = (a * x[i-1]) %% m 
}

#scaling to get numbers between 0 and 1
x/m

#histogram of x
hist(x/m)

#traceplot of x/m
plot(1:n, x/m, type = 'l')

