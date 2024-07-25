###time series as a tsibble object
##Invoking the libraries
library(tibble)
library(dplyr)
library(tidyr)
library(lubridate)
library(ggplot2)
library(tsibble)
library(tsibbledata)
library(feasts)
library(fable)
library(fabletools)

##If any of the above needs t be installed
#install.packages("tibble") #write the package name in the brackets in quotes


##Let's look at the first data set
#Dataset: Globabl economy data in the package tsibbledata
global_economy

##Let's look at the second data set
#Dataset: tourism data in the package tsibbledata
tourism


##Create a tsibble object
y <- tsibble(
  year = 2015:2019,
  observation = c(123,45,36,29,102),
  index = year
)

##Coverting a tibble object into a tsibble object
mydata <- tibble(
  year = 2015:2019,
  observation = c(123,45,36,29,102)
) 
mydata # a tibble object without the index

#we can convert it into a tsibble object
mydata <- mydata |>
          as_tsibble(index = year)
mydata #now a tsibble object

##When indexing is confusing for R
z <- tibble(
  Month = c("2019 Jan", "2019 Feb", "2019 Mar", "2019 Apr", "2019 May"), #Month is stored as a string
  observation = c(123,45,36,29,102)
)
z

#let's make it understand
#we will change Month from chr type to mth type
z |> 
  mutate(Month = yearmonth(Month)) |> #tell R to interpret Month as year followed by a month 
  as_tsibble(index = Month) #index the series


##Reading the file and saving it as tsibble object
#install.packages("readr")
library(readr)
prison <- readr::read_csv("https://rhythmgrover.github.io/assets/DA341-coursewebpage/prison-data-aus.csv")

prison <- prison |>
  mutate(Quarter = yearquarter(Date)) |>
  select(-Date) |>
  as_tsibble(key = c(State, Gender, Legal, Indigenous),
             index = Quarter)

prison


##Working with tsibble objects
#Dataset PBS
PBS
