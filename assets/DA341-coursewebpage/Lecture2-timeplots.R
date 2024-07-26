###Time series plots
##Example 1: a10 from PBS

PBS |>
  filter(ATC2 == "A10") |>
  select(Month, Concession, Type, Cost) |>
  summarise(TotalC = sum(Cost)) |>
  mutate(Cost = TotalC / 1e6) -> a10

a10 |> autoplot() 

a10 |> autoplot(Cost)

a10 |> ggplot(aes(x = Month, y = Cost)) +
      geom_point()

a10 |> ggplot(aes(x = Month, y = Cost)) +
  geom_line()

a10 |> autoplot(Cost) + geom_point()

a10 |> autoplot(Cost) +
  labs(y = "$ (millions)",
       title = "Australian antidiabetic drug sales")



##Example 1: ansett dataset
#let's look at the data
ansett

#plotting 
ansett |> autoplot(Passengers)

#distint class and airports
ansett |> distinct(Class)

#economy class only
ansett |> 
        filter(Class == "")
        autoplot()
        
#more filtering 
ansett |>
          filter(Airports == "MEL-SYD")
          select(-Airports)
          
#what does it look like?


#more specific filtering

melsyd_economy <- ansett |>
  filter(Airports == "MEL-SYD", Class == "Economy") |>
  mutate(Passengers = Passengers/1000)
  autoplot(melsyd_economy, Passengers) +
  labs(title = "Ansett airlines economy class",
       subtitle = "Melbourne-Sydney",
       y = "Passengers ('000)")
  
##Patterns in time plots
#electricity prod from aus_production tsibbble

aus_production |>
  filter(year(Quarter) >= 1980) |>
    autoplot(Electricity) +
    labs(y = "GWh", title = "Australian electricity production")

#brick prod from aus_production tsibbble  
aus_production |>
  autoplot(Bricks) +
  labs(y = "million units", title = "Australian clay brick production")

#us employment
us_employment |>
  filter(Title == "Retail Trade", year(Month) >= 1980) |>
  autoplot(Employed / 1e3) +
  labs(y = "Million people", title = "Retail employment, USA")

#stock price (Amazon)
gafa_stock |>
  filter(Symbol == "AMZN", year(Date) >= 2018) |>
  autoplot(Close) +
  labs(y = "$US", title = "Amazon closing stock price")

#Lynx trapping 
pelt |>
  autoplot(Lynx) +
  labs(y = "Number trapped", title = "Annual Canadian Lynx Trappings")