##Some simple forecasting methods

##Example1 : Bricks production from aus_production
##Model fitting
brick_fit <- aus_production |>
  filter(!is.na(Bricks)) |>
  model(
    Seasonal_naive = SNAIVE(Bricks),
    Naive = NAIVE(Bricks),
    Drift = RW(Bricks ~ drift()),
    Mean = MEAN(Bricks)
  )

brick_fit

##Producing forecasts
brick_fc <- brick_fit |>
  forecast(h = "5 years")
print(brick_fc, n = 4)

## Visualising forecasts

brick_fc |>
  autoplot(aus_production, level = NULL) +
  labs(title = "Clay brick production in Australia",
       y = "Millions of bricks") +
  guides(colour = guide_legend(title = "Forecast"))