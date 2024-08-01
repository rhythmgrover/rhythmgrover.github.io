###Seasonal plots
##load package
library(fpp3) #this includes all the 10 libraries that we invoked in previous codes

##Example 1: a10 time series from PBS
##recall
PBS |>
  filter(ATC2 == "A10") |>
  select(Month, Concession, Type, Cost) |>
  summarise(TotalC = sum(Cost)) |>
  mutate(Cost = TotalC / 1e6) -> a10

##time plot
a10 |> 
  autoplot(Cost)

##seasonal plot using the function gg_season
a10 |>
  gg_season(Cost, labels = "both") +
  labs(y = "$ (millions)",
       title = "Seasonal plot: Antidiabetic drug sales")
##does the seasonal plot convey the same information as the time plot or more?


##Example 2: beer production time series from aus_production tsibble
##extracting the desired time series
beer <- aus_production |> 
  select(Quarter, Beer) |> filter(year(Quarter) >= 1992)

##ploting the time series - time plot
beer |> autoplot(Beer) + 
  labs(title = "Australian beer production", y = "Megalitres")

##lines with points over them for more clarity
beer |> autoplot(Beer) + geom_point() + 
  labs(title = "Australian beer production", y = "Megalitres") 

##seasonal plot
beer |> gg_season(Beer, labels = "right")


##Example 3: electricity demand data from vic_elec tsibble
##look at the tsibble
vic_elec

##time plot
vic_elec |> autoplot()

##seasonal plot
vic_elec |> gg_season(Demand)+
  labs(y="MWh", title="Electricity demand: Victoria")

##lets look at how demand varies over the time of the week rather than time of the year
vic_elec |> gg_season(Demand, period = "week")+
  labs(y="MWh", title="Electricity demand: Victoria")

##lets look at how demand varies during the day
vic_elec |> gg_season(Demand, period = "day")+
  labs(y="MWh", title="Electricity demand: Victoria")


###Seasonal subseries plots
##Example 1: a10 time series from PBS
a10 |>
  gg_subseries(Cost) +
  labs(
    y = "$ (millions)",
    title = "Australian antidiabetic drug sales"
  )

##Example 2: beer production from aus_production
beer |> gg_subseries(Beer)

##Example 3: Austrailian holidays from tourism tsibble
##look at the tsibble
tourism

##filtering what we want
holidays <- tourism |>
  filter(Purpose == "Holiday") |>
  group_by(State) |>
  summarise(Trips = sum(Trips))

##time plot
holidays |> autoplot(Trips) +
  labs(y = "thousands of trips", title = "Australian domestic holiday nights")

##seasonal plots
holidays |> gg_season(Trips) + 
  facet_wrap(vars(State), nrow = 2, scales = "free_y")+
  labs(y = "thousands of trips", title = "Australian domestic holiday nights")

##seasonal subseries plots
holidays |>
  gg_subseries(Trips) +
  labs(y = "thousands of trips", title = "Australian domestic holiday nights")
