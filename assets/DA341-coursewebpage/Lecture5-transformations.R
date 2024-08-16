###Transformations and adjustments
##er capita adjustment
##Example: GDP data from global_economy

global_economy |>
  filter(Country == "Australia") |>
  autoplot(GDP/Population) +
  labs(title= "GDP per capita", y = "$US")

##Inflation adjustment
##Example: Retail data on Newspaper and books
print_retail <- aus_retail |>
  filter(Industry == "Newspaper and book retailing") |>
  group_by(Industry) |>
  index_by(Year = year(Month)) |>
  summarise(Turnover = sum(Turnover))

aus_economy <- global_economy |>
  filter(Code == "AUS") #for CPI to adjust

print_retail |>
  left_join(aus_economy, by = "Year") |>
  mutate(Adjusted_turnover = Turnover / CPI * 100) |>
  pivot_longer(c(Turnover, Adjusted_turnover),
               values_to = "Turnover") |>
  mutate(name = factor(name,
                       levels=c("Turnover","Adjusted_turnover"))) |>
  ggplot(aes(x = Year, y = Turnover)) +
  geom_line() +
  facet_grid(name ~ ., scales = "free_y") +
  labs(title = "Turnover: Australian print media industry",
       y = "$AU")

##Mathematical transformations
food <- aus_retail |>
  filter(Industry == "Food retailing") |>
  summarise(Turnover = sum(Turnover))

food |> autoplot(Turnover) +
  labs(y = "Turnover ($AUD)")

food |> autoplot(sqrt(Turnover)) +
  labs(y = "Square root turnover")

food |> autoplot(Turnover^(1 / 3)) +
  labs(y = "Cube root turnover")

food |> autoplot(log(Turnover)) +
  labs(y = "Log turnover")

food |> autoplot(-1 / Turnover) +
  labs(y = "Inverse turnover")

##Box-cox transformations using inbuilt function
food |>
  features(Turnover, features = guerrero)
