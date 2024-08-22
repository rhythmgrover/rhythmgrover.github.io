###Tidy workflow
##Example 1: Global economy- GDP data

##Step1: Preparing data
gdppc <- global_economy |> #creating a new tsibble
  mutate(GDP_per_capita = GDP / Population) |> #for GDP per capita
  select(Year, Country, GDP, Population, GDP_per_capita) #the columns we want

##new tsibble
gdppc

##Step2: Data visualization
gdppc |>
filter(Country == "Sweden") |>
  autoplot(GDP_per_capita) +
  labs(title = "GDP per capita for Sweden", y = "$US")

##Model estimation
fit <- gdppc |>
  model(trend_model = TSLM(GDP_per_capita ~ trend())) #using the linear model
fit

##Model accuracy (we will skip this step for now)

##Producing and visualising forecasts
fit |> forecast(h = "3 years")
fit |>
  forecast(h = "3 years") |>
  filter(Country == "Sweden") |>
  autoplot(gdppc) + labs(title = "GDP per capita for Sweden", y = "$US")
