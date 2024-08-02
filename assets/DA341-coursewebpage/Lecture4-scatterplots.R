###Multiple time series: exploring relationships between pairs of time series
##Example 1: Electricity Demand in Victoria, Australia

##vic_elec tsibble
vic_elec #recall

##manipulating the original tsibble
vic_elec_day_type <- vic_elec |> 
  filter(year(Time) == 2014) |> #extracting data for year 2014
  mutate(Day_Type = case_when(
    Holiday ~ "Holiday",
    wday(Date) %in% 2:6 ~ "Weekday",
    TRUE ~ "Weekend")) #three day types: holiday, weekday, weekend

#let's look at the created tsibble
vic_elec_day_type

##Time plots for demand and temperature
vic_elec_day_type |> 
  select(Temperature, Demand) |> 
  pivot_longer(-Time) |> 
  ggplot(aes(Time, value, colour = name)) +
  geom_line() +
  facet_grid(name ~ ., scales = "free_y") +
  guides(colour = "none") +
  labs(y = "Degrees Celsius                   GW         ")

##Scatter plot between demand and temperature
vic_elec_day_type |> 
  ggplot(aes(x = Temperature, y = Demand)) +
  geom_point() + 
  labs(x = "Temperature (degrees Celsius)", y = "Electricity demand (GW)")

##what can we say about the relationship on holidays, weekdays and weekends?
vic_elec_day_type |> 
  ggplot(aes(x = Temperature, y = Demand, colour = Day_Type)) +
  geom_point() + 
  labs(x = "Temperature (degrees Celsius)", y = "Electricity demand (GW)")



##Example 2: US consumption expenditure

##us_change tsibble
us_change

##time plots for each series in us_change tsibble
us_change |>
  pivot_longer(-Quarter, names_to="Series") |>
  autoplot(value) +
  facet_grid(Series ~ ., scales = "free_y") + 
  labs(y = "% change")

##matrix of scatter plots
##need the following package
##install.packages("GGally")
library(GGally) ##library call

##scatter plot matrix
us_change |> GGally::ggpairs(columns = 2:6)
