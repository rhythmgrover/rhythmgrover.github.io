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
fit |> 
    forecast(h = 10)|> 
    autoplot(aus_economy)+
    labs(title = "Australian population", y = "Millions")


##Damped Trend
aus_economy |>
  model(
    `Damped Holt's method` = ETS(Pop ~ error("A") +
                                   trend("Ad", phi = 0.9) + season("N"))) |>
  forecast(h = 20) |>
  autoplot(aus_economy) +
  labs(title = "Australian population",
       y = "Millions")


##Comparing the three methods
fit <- aus_economy |>
  filter(Year <= 2010) |>
  model(
    ses = ETS(Pop ~ error("A") + trend("N") + season("N")),
    holt = ETS(Pop ~ error("A") + trend("A") + season("N")),
    damped = ETS(Pop ~ error("A") + trend("Ad") + season("N"))
  )

##check the coefficients
  tidy(fit)
 

##check the accuracy
  accuracy(fit)
