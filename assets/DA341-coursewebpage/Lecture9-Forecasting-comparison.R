###Forecasting methods: which one is better?

##Example 1: Beer production data

##Set training data from 1992 to 2006
train <- aus_production |>
  filter_index("1992 Q1" ~ "??")

##Fit the models
beer_fit <- train |>
  model(
    Mean = MEAN(Beer),
    `Naïve` = NAIVE(Beer),
    `Seasonal naïve` = SNAIVE(Beer)
  )

##Generate forecasts for 14 quarters
beer_fc <- beer_fit |> forecast(??)

##Plot forecasts against actual values
beer_fc |>
  ??(train, level = NULL) +
  autolayer(
    filter_index(aus_production, "2007 Q1" ~ .),
    colour = "black"
  ) +
  labs(
    y = "Megalitres",
    title = "Forecasts for quarterly beer production"
  ) +
  guides(colour = guide_legend(title = "Forecast"))

##Example 2: Google stock price 

##Re-index based on trading days
google_stock <- gafa_stock |>
  filter(Symbol == "GOOG", year(Date) >= 2015) |>
  ??(day = row_number()) |>
  update_tsibble(index = ??, regular = TRUE)

##Filter the year of interest
google_2015 <- google_stock |> filter(year(??) == ??)

##Fit the models
google_fit <- google_2015 |>
  model(
    Mean = MEAN(Close),
    `Naïve` = NAIVE(Close),
    Drift = NAIVE(Close ~ drift())
  )

##Produce forecasts for the trading days in January 2016
google_jan_2016 <- google_stock |>
  filter(??)
google_fc <- google_fit |>
  forecast(new_data = google_jan_2016)

##Plot the forecasts
google_fc |>
  ??(google_2015, level = NULL) +
  autolayer(google_jan_2016, Close, colour = "black") +
  labs(y = "$US",
       title = "Google daily closing stock prices",
       subtitle = "(Jan 2015 - Jan 2016)") +
  guides(colour = guide_legend(title = "Forecast"))

##Checking for the residuals
augment(??)
augment(??)
