###Classical decomposition

##Example: US retail employment data
##Additive decomposition
us_retail_employment |>
  model(
    classical_decomposition(Employed, type = "additive")
  ) |>
  components() |>
  autoplot() +
  labs(title = "Classical additive decomposition of total
                  US retail employment")


##Multiplicative decomposition
us_retail_employment |>
  model(
    classical_decomposition(Employed, type = "multiplicative")
  ) |>
  components() |>
  autoplot() +
  labs(title = "Classical additive decomposition of total
                  US retail employment")
