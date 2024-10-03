###ARIMA modeling
##libraries
library(fpp3)
##Egyptian Exports data from global_economy tsibble

global_economy |>
  filter(Code == "EGY") |>
  autoplot(Exports) +
  labs(y = "% of GDP", title = "Egyptian Exports")

##fitting the ARIMA model
  fit <- global_economy |>
  filter(Code == "EGY") |>
  model(ARIMA(Exports)) #model function with ARIMA as an argument - automatically fits the model
 
##results of the fitting
  report(fit) ## ARIMA

##let's look at the residuals
  gg_tsresiduals(fit) #looks like white noise

##forecasting using the fit
  fit |> forecast(h=10) |>
    autoplot(global_economy) +
    labs(y = "% of GDP", title = "Egyptian exports") #picks up the cyclic behavior

##ACF plot
  global_economy |>
    filter(Code == "EGY") |>
    ACF(Exports) |>
    autoplot()
  
##PACF plot  
  global_economy |>
    filter(Code == "EGY") |>
    PACF(Exports) |>
    autoplot() ##which model do you want to fit now?
  
##fit2 <- global_economy |>
  filter(Code == "EGY") |>
    model(ARIMA(Exports ~ pdq(4,0,0))) #manually deciding on the model order
  report(fit2)
  
##if you want to compare
  compare_fit <- global_economy |>
    filter(Code == "EGY") |>
    model(
      auto <- ARIMA(Exports),
      manual <- ARIMA(Exports ~pdq(p = 4, d= 0, q = 0))
    )
glance(compare_fit)  #glance at the comparison

##finding the best model among different p and q after differencing
global_economy |>
  filter(Code == "EGY") |>
  model(ARIMA(Exports ~ pdq(p=1:3, d=1, q=0:2))) #check what happens when d=0?
