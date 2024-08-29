###Forecast accuracy
##Example: beer production data from aus_production

train <- aus_production |>
  filter(between(year(Quarter), 1992, 2007)) #training data between 1992 to 2007

beer <- aus_production |>
  filter(year(Quarter) >= 1992)

beer_fc_plot <- train |>
  model(
    Mean = MEAN(Beer),
    Naive = NAIVE(Beer),
    Seasonal_naive = SNAIVE(Beer),
    Drift = RW(Beer ~ drift())
  ) |>
  forecast(h = 11) |>
  autoplot(beer, level = NULL) +
  labs(
    title = "Forecasts for quarterly beer production",
    y = "Megalitres"
  ) +
  guides(colour = guide_legend(title = "Forecast"))
beer_fc_plot


recent_production <- aus_production |>
  filter(year(Quarter) >= 1992)
train <- recent_production |>
  filter(year(Quarter) <= 2007)

##models that we train
beer_fit <- train |>
  model(
    Mean = MEAN(Beer),
    Naive = NAIVE(Beer),
    Seasonal_naive = SNAIVE(Beer),
    Drift = RW(Beer ~ drift())
  )

##forecast for 10 quarters
beer_fc <- beer_fit |>
  forecast(h = 10)

##accuracy measures
accuracy(beer_fit) |>
  arrange(.model) |>
  select(.model, .type, RMSE, MAE, MAPE, MASE, RMSSE)

##different way
accuracy(beer_fc, recent_production) |> #forecast as well as the data for MASE
  arrange(.model) |>
  select(.model, .type, RMSE, MAE, MAPE, MASE, RMSSE)