###Lag plots
##aus_production tsibble
aus_production #recall

##creating a new tsibble recent_production
recent_production <- aus_production |>
  filter(year(Quarter) >= 2000)

##piping the new tsibble into gg_lag for a lag plot
recent_production |>
  gg_lag(Beer, geom = "point") + #lag plot for Beer production
  labs(x = "lag(Beer, k)")


##default lag plot
recent_production |> gg_lag(Beer)
