###Residuals diagnostics

##Example: Facebook closing stock price
##Extract training data
fb_stock <- gafa_stock |>
  filter(Symbol == "FB") |>
  mutate(trading_day = row_number()) |>
  update_tsibble(index = ??, regular = TRUE)

##Time plot
fb_stock |> autoplot(??)

##Model fitting 
fit <- fb_stock |> model(??(Close)) #we are using the naive model

##Checking the residuals
??(fit)
##.resid and .innov - what is the difference?
##why is the first observation missing? 

##Plotting the observed and the fitted
augment(fit) |>
  ggplot(aes(x = trading_day)) +
  geom_line(aes(y = Close, colour = "Data")) + #observed
  geom_line(aes(y = .fitted, colour = "Fitted")) #fitted


##what happenes at the end of the plot, say after 1100 days of trading?
augment(fit) |>
  filter() |>
  ggplot(aes(x = trading_day)) +
  geom_line(aes(y = Close, colour = "Data")) +
  geom_line(aes(y = .fitted, colour = "Fitted"))
##why does the fitted look shifted version of the data?

##Plotting the residuals from the naive method
augment(fit) |>
  autoplot(.resid) +
  labs(y = "$US",
       title = "Residuals from naïve method")

##Histogram of the residuals
augment(fit) |>
  ggplot(aes(x = ??)) +
  geom_histogram(bins = 150) +
  labs(title = "Histogram of residuals") 
##does it look normal?

##ACF of the residuals
augment(fit) |>
  ??(.resid) |>
  autoplot() + labs(title = "ACF of residuals")
##do they look uncorrelated?

##all the plots together
gg_tsresiduals(fit)

##Ljung-Box tests
augment(fit) |>
  features(.resid, ljung_box, lag = 10)
