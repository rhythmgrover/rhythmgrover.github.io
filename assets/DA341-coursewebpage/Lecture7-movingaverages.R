###Moving averages

##Example 1: global economy tsibble
global_economy |> filter(Country == "Australia") |>
  autoplot(Exports) + #exports for austrailia
  labs(y="% of GDP", title= "Total Australian exports")

##moving average of order 5
aus_exports_ma <- aus_exports <- global_economy |>
  filter(Country == "Australia") |>
  mutate(
    `5-MA` = slider::slide_dbl(Exports, mean,
                               .before = 2, .after = 2, .complete = TRUE)
  ) #easy to compute using slide_dbl function in the slider package
##look at the new table to see the ma values

##trend-cycle using 5-MA
aus_exports |>
  autoplot(Exports) +
  geom_line(aes(y = `5-MA`), colour = "#D55E00") +
  labs(y = "% of GDP",
       title = "Total Australian exports") #trend-cycle is smoother than the original time series

##what happens as you increase the order of MA?
aus_exports <- global_economy |>
  filter(Country == "Australia") |>
  transmute(Exports, `3-MA` = slider::slide_dbl(Exports, mean,.before = 1, .after = 1, .complete = TRUE))

aus_exports |> 
  autoplot(Exports) +
  autolayer(aus_exports,`3-MA`, color = "#D55E00") +
  labs(y = "% of GDP",
       title = "Total Australian exports: 3-MA") +
  guides(colour = guide_legend(title = "series")) 


aus_exports <- global_economy |>
  filter(Country == "Australia") |>
  transmute(Exports, `5-MA` = slider::slide_dbl(Exports, mean,.before = 2, .after = 2, .complete = TRUE))

aus_exports |> 
  autoplot(Exports) +
  autolayer(aus_exports,`5-MA`, color = "#D55E00") +
  labs(y = "% of GDP",
       title = "Total Australian exports: 5-MA") +
  guides(colour = guide_legend(title = "series")) 


aus_exports <- global_economy |>
  filter(Country == "Australia") |>
  transmute(Exports, `7-MA` = slider::slide_dbl(Exports, mean,.before = 3, .after = 3, .complete = TRUE))

aus_exports |> 
  autoplot(Exports) +
  autolayer(aus_exports,`7-MA`, color = "#D55E00") +
  labs(y = "% of GDP",
       title = "Total Australian exports: 7-MA") +
  guides(colour = guide_legend(title = "series")) 

aus_exports <- global_economy |>
  filter(Country == "Australia") |>
  transmute(Exports, `9-MA` = slider::slide_dbl(Exports, mean,.before = 4, .after = 4, .complete = TRUE))

aus_exports |> 
  autoplot(Exports) +
  autolayer(aus_exports,`9-MA`, color = "#D55E00") +
  labs(y = "% of GDP",
       title = "Total Australian exports: 9-MA") +
  guides(colour = guide_legend(title = "series")) 

aus_exports <- global_economy |>
  filter(Country == "Australia") |>
  transmute(Exports, `11-MA` = slider::slide_dbl(Exports, mean,.before = 5, .after = 5, .complete = TRUE))

aus_exports |> 
  autoplot(Exports) +
  autolayer(aus_exports,`11-MA`, color = "#D55E00") +
  labs(y = "% of GDP",
       title = "Total Australian exports: 11-MA") +
  guides(colour = guide_legend(title = "series")) 

aus_exports <- global_economy |>
  filter(Country == "Australia") |>
  transmute(Exports, `15-MA` = 
              slider::slide_dbl(Exports, mean,.before = 7, .after = 7, .complete = TRUE))

aus_exports |> 
  autoplot(Exports) +
  autolayer(aus_exports,`15-MA`, color = "#D55E00") +
  labs(y = "% of GDP",
       title = "Total Australian exports: 15-MA") +
  guides(colour = guide_legend(title = "series")) 


##US retail employment data
us_retail_employment <- us_employment |>
  filter(Title == "Retail Trade", year(Month) >= 1980)

##plot the data
us_retail_employment |> autoplot(Employed)

##weighted moving average
us_retail_employment_ma <- us_retail_employment |>
  mutate(
    `12-MA` = slider::slide_dbl(Employed, mean,
                                .before = 5, .after = 6, .complete = TRUE),#asymmetric
    `2x12-MA` = slider::slide_dbl(`12-MA`, mean,
                                  .before = 1, .after = 0, .complete = TRUE)#symmetric
  )

us_retail_employment_ma |> 
  autoplot(Employed, color = "gray") +
  autolayer(us_retail_employment_ma, vars(`2x12-MA`),
            color = "#D55") +
  labs(y = "Persons (thousands)",
       title = "Total employment in US retail")

