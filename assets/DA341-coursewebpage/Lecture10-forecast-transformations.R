###Forecasting using transformations
##Example: Average annual price of eggs
eggs <- prices |>
  filter(!is.na(eggs)) |>
  select(eggs)

##time plot
eggs |> autoplot() +
  labs(title = "Annual egg prices", y = "$US (adjusted for inflation)")

##Fitting the drift model on the log-transformed data
fit <- eggs |>
  model(RW(log(eggs) ~ drift()))
fit

##Forecasting 50 years ahead
fc <- fit |>
  forecast(h = 50)
fc

##How do the forecasts look?
fc |> autoplot(eggs) +
  labs(title = "Annual egg prices",
       y = "US$ (adjusted for inflation)")

##What if we do not make the adjustment?
##comparison between the mean and median forecasts
fc |>
  autoplot(eggs, level = 80, point_forecast = lst(mean, median)) +
  labs(title = "Annual egg prices",
       y = "US$ (adjusted for inflation)")
