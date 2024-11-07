##Global economy tsibble
##Austrailian population
aus_economy <- global_economy |>
  filter(Code == "AUS") |>
  mutate(Pop = Population / 1e6)

##Plotting the time series
autoplot(aus_economy, Pop) +
  labs(y = "Millions", title = "Australian population")

##Fitting with double exponential smoothing
fit <- aus_economy |>
  model(
    AAN = ETS(Pop ~ error("A") + trend("A") + season("N"))
  )

##Report the fit: parameters?
report(fit)

##Component form
components(fit)

##Plotting the components
components(fit) |> autoplot()

##Forecasting
fc <- fit |> forecast(h = 10)


##Damped Trend - comparison with linear trend
aus_economy |>
  model(
    `Holt's method` = ETS(Pop ~ error("A") +
                            trend("A") + season("N")),
    `Damped Holt's method` = ETS(Pop ~ error("A") +
                                   trend("Ad", phi = 0.9) + season("N"))
  ) |>
  forecast(h = 15) |>
  autoplot(aus_economy, level = NULL) +
  labs(title = "Australian population",
       y = "Millions") +
  guides(colour = guide_legend(title = "Forecast"))

##check the coefficients
tidy()

##check the accuracy
accuracy()