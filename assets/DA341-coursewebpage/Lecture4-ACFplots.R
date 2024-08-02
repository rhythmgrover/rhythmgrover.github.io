###Autocorrelation function (ACF) plots

##Example1: recent_production tsibble for Beer production
##pipe it to the ACF function
recent_production |> ACF(Beer, lag_max = 9) ##we can specify any other lag

##pipe it to the autoplot function to see the ACF plot
recent_production |> 
    ACF(Beer, lag_max = 9) |>
    autoplot()

##default ACF without the lag_max parameter
recent_production |>
  ACF(Beer) |>
  autoplot() + labs(title="Australian beer production")

##Trend and seasonality in ACF plots
##Example 2: retail trade employment from us_employment tsibble
##time plot
retail <- us_employment |>
  filter(Title == "Retail Trade", year(Month) >= 1980)
retail |> autoplot(Employed)

##ACF plot
retail |>
  ACF(Employed, lag_max = 48) |>
  autoplot()

##Example 3: Google stock price data for the year 2015
google_2015 <- gafa_stock |>
  filter(Symbol == "GOOG", year(Date) == 2015) |>
  select(Date, Close)
##look at the tsibble
google_2015

##time plot
google_2015 |> autoplot(Close)

##ACF
google_2015 |>
  ACF(Close, lag_max = 100)

google_2015 |>
  ACF(Close, lag_max = 100) |>
  autoplot()

##Example 4: a10 tsibble from PBS
a10 |>
  ACF(Cost, lag_max = 48) |>
  autoplot() +
  labs(title="Australian antidiabetic drug sales")


###White noise
##generating white noise
set.seed(30) ##so that we have the same wn series
y <- tsibble(sample = 1:50, wn = rnorm(50), index = sample) ##tsibble
y |> autoplot(wn) + labs(title = "White noise", y = "") ##time plot

##ACF plot of white noise
y |>
  ACF(wn) |>
  autoplot() + labs(title = "White noise")