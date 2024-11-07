###Simple Exponential Smoothing for forecasting 
##Library needed
library(fpp3)

##Global economy tsibble
##Time series:  Exports from Algeria
algeria_economy <- global_economy |>
  filter(Country == "Algeria")

##Plotting the time series
algeria_economy |>
  autoplot(Exports) +
  labs(y = "% of GDP", title = "Exports: Algeria") 

##Fitting the model ETS (Error Trend Seasonal): 
fit <- algeria_economy |>
  model(ANN = ETS(Exports ~ error("A") + trend("N") + season("N")))

##the smoothing parameters obtained by fitting the model
report(fit)

##geting the components in the fit and plotting them
components(fit) |> autoplot()

##If you want to look at the components - values
components(fit) |> 
  left_join(fitted(fit), by = c("Country", ".model", "Year"))
#left join the coponents to fitted values column 

##generate forecasts
fc <- fit |>
  forecast(h = 5) 

##Plotting the forecasts 
fc|> 
  autoplot(algeria_economy) + 
  labs(y = "% of GDP", title = "Algerian exports")
