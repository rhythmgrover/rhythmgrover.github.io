###Prediction Intervals
##Example: Brick production data from aus_production
##we model it using SNAIVE and forecast for 5 years
aus_production |>
  filter(!is.na(Bricks)) |>
  model(Seasonal_naive = SNAIVE(Bricks)) |>
  forecast(h = "5 years")

##95% prediction intervals
aus_production |>
  filter(!is.na(Bricks)) |>
  model(Seasonal_naive = SNAIVE(Bricks)) |>
  forecast(h = "5 years") |>
  hilo(level = 95)

##lower and upper bounds of PI
aus_production |>
  filter(!is.na(Bricks)) |>
  model(Seasonal_naive = SNAIVE(Bricks)) |>
  forecast(h = "5 years") |>
  hilo(level = 95)  |>
  mutate(lower = `95%`$lower, upper=`95%`$upper)
